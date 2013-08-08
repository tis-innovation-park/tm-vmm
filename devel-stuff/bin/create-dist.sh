#!/bin/bash

BASE_TM_VERSION=""


while [ "$1" != "" ]
do
    if [ "$1" = "--version" ]
    then
	export BASE_TM_VERSION=$2
	shift
    elif [ "$1" = "--push" ]
    then
	PUSH=true
    elif [ "$1" = "--force-tag" ]
    then
	GIT_TAG_ARG="-f"
    elif [ "$1" = "--dry-run" ]
    then
	DEBUG=echo
    fi

    shift

done

if [ "$BASE_TM_VERSION" = "" ]
then
    echo "Missing version"
    echo "$0 --version <version>"
    exit 1
fi

CONFIG_VERSION=$(grep "export BASE_TM_VERSION=" configure | awk 'BEGIN {FS="=" } { print $2}')
CLI_VERSION=$BASE_TM_VERSION

if [ "$CLI_VERSION" != "$CONFIG_VERSION" ]
then
    echo "You need to update the version in the configure script to $CLI_VERSION"
    echo "   it's currently: $CONFIG_VERSION"
    exit 1
fi

GIT_DIFF=$(git diff | wc -l)


#if [ $GIT_DIFF -gt 0 ]
#then
#    echo "You seem to have uncommited stuff in your repo (git diff gives $GIT_DIFF lines)"
#    echo "  you need to commit first"
#    exit 2
#fi

exit_on_error()
{
    RET=$1
    CMD=$2
    if [ $RET -ne 0 ]
	then
	echo "Failed: $CMD"
	exit $RET
    fi
}

exec_cmd()
{
    COMMAND="$*"

    echo "*** $COMMAND *** "
    $COMMAND
    exit_on_error $? "$COMMAND"
}

check_install()
{
    INSTALL_DIR=$1

    INSTALLED_VERSION=`$INSTALL_DIR/bin/tm-vmm --version`
    if [ "$BASE_TM_VERSION" != "$INSTALLED_VERSION" ]
    then
	echo "Installed version ($INSTALLED_VERSION) differs from the one we've just built ($BASE_TM_VERSION)"
	return 1
    fi

    $INSTALL_DIR/bin/tm-vmm --list-clients > /dev/null 2> /dev/null
    RET=$?
    if [ $RET -ne 0 ] ; then echo " * list clients failed"; return $RET ; fi

    PDFS=$(ls -1 $INSTALL_DIR/share/testingmachine/doc/*.pdf | wc -l )
    HTMLS=$(ls -1 $INSTALL_DIR/share/testingmachine/doc/*.html | wc -l)

    NR_MANUALS=4
    if [ $PDFS -ne $NR_MANUALS ]
    then
	echo "Can't find the $NR_MANUALS pdf manuals ($PDFS != $NR_MANUALS) in $INSTALL_DIR/share/testingmachine/doc/"
	return 1
    fi

    if [ $HTMLS -ne $NR_MANUALS ]
    then
	echo "Can't find the $NR_MANUALS html manuals"
	return 1
    fi
}

check_dist()
{
    cd tmp

    DIST_FILE=$(ls -1t *.tar.gz | head -1)
    DIST_DIR=$(ls -1t *.tar.gz | head -1 | sed 's,\.tar\.gz,,g')

    cd $DIST_DIR

    exec_cmd ./configure --prefix /tmp/test-2 --build-doc
    exec_cmd make all install 
    exec_cmd cd doc && make clean all install && cd ..
    exec_cmd check_install /tmp/test-2

    cd -

    cd -
}


exec_cmd git tag $GIT_TAG_ARG $BASE_TM_VERSION
exec_cmd ./configure --prefix /tmp/test-1  --build-doc
exec_cmd make all install 
exec_cmd cd doc && make clean all install && cd ..
exec_cmd check_install /tmp/test-1
exec_cmd make dist
exec_cmd check_dist

if [ "$PUSH" = true ]
then
    $DEBUG git push --tags
fi


echo ""
echo ""
echo "Dist: ok"
echo "Ready for relase: tmp/$DIST_FILE"



