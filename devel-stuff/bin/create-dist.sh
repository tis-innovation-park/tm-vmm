#!/bin/sh

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
    elif [ "$1" = "-d" ]
    then
	GIT_ARG=$1
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


if [ $GIT_DIFF -gt 0 ]
then
    echo "You seem to have uncommited stuff in your repo (git diff gives $GIT_DIFF lines)"
    echo "  you need to commit first"
    exit 2
fi

exit_on_error()
{
    RET=$1
    CMD=$2
    if [ $RET -nee 0 ]
	then
	echo "Failed: $CMD"
	exit $RET
    fi
}

exec_cmd()
{
    COMMAND="$*"

    $DEBUG $COMMAND
    exit_on_error $? "$COMMAND"
}

exec_cmd git tag $GIT_ARG $VERSION
exec_cmd make clean
exec_cmd ./configure --prefix /opt
exec_cmd make 
exec_cmd make dist


if [ "$PUSH" = true ]
then
    $DEBUG git push --tags
fi




