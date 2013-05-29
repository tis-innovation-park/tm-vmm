#!/bin/sh

#
#                                                                   
#                   Testing Machine
#                      
#   Copyright (C) 2012, 2013 TIS Innovation Park
#                                                                   
# This program is free software; you can redistribute it and/or     
# modify it under the terms of the GNU General Public License       
# as published by the Free Software Foundation; either version 3    
# of the License, or any later version.                             
#                                                                   
#                                                                   
# This program is distributed in the hope that it will be useful,   
# but WITHOUT ANY WARRANTY; without even the implied warranty of    
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the     
# GNU General Public License for more details.                      
#                                                                   
# You should have received a copy of the GNU General Public License 
# along with this program; if not, write to the Free Software       
# Foundation, Inc., 51 Franklin Street, Boston,            
# MA  02110-1301, USA.                                              
#

exit_on_error()
{
    RET=$1
    MSG=$2

    if [ $1 -ne 0 ]
    then
	echo "ERROR ($RET): $MSG"
	exit $RET
    fi
}

VMM_DIR=/tmp

VMM=${VMM_DIR}/bin/tm-vmm



build_project()
{
    MACHINE=$1

    INST_DIR=/tmp/seard-tmp

    export CONF_TWEAK="export CFLAGS=-I/usr/lib/jvm/java-6-openjdk-i386/include; export CXXFLAGS=-I/usr/lib/jvm/java-6-openjdk-i386/include; "


    if [ "1" = "2" ]
    then


    $VMM --client-exec    $MACHINE "rm -fr searduino"
    if [ $? -ne 0 ] ; then return 1 ;  fi

    $VMM --client-exec    $MACHINE "git clone git://git.savannah.nongnu.org/searduino.git"
    if [ $? -ne 0 ] ; then return 1 ;  fi

    $VMM --client-exec    $MACHINE "cd searduino && make -f Makefile.git"
    
    fi
    
    $VMM --client-exec    $MACHINE "cd searduino && $CONF_TWEAK ./configure --prefix=$INST_DIR --disable-unittest "
    if [ $? -ne 0 ] ; then return 1 ;  fi

    $VMM --client-exec    $MACHINE "cd searduino && make clean all"
    if [ $? -ne 0 ] ; then return 1 ;  fi

    $VMM --client-exec    $MACHINE "cd searduino && make check"
    if [ $? -ne 0 ] ; then return 1 ;  fi

    $VMM --client-exec    $MACHINE "$INST_DIR/bin/verify-install.sh"
    if [ $? -ne 0 ] ; then return 1 ;  fi
}


build_on_host()
{
    MACHINE=$1
    
#    echo $VMM --start-client-headless   $MACHINE
#    $VMM --start-client-headless   $MACHINE
#    if [ $? -ne 0 ] ; then return 1 ;  fi
    
 #   echo $VMM --wait-for-ssh   $MACHINE
 #   $VMM --wait-for-ssh   $MACHINE
 #   if [ $? -ne 0 ] ; then return 1 ;  fi

    echo build_project         $MACHINE
    build_project         $MACHINE
    # don't return or exit after failed build.... we need to always stop the machine/client

#    echo $VMM --stop-client    $MACHINE
#    $VMM --stop-client    $MACHINE
#    if [ $? -ne 0 ] ; then return 1 ;  fi
}

#build_on_host searduino-32-devel
build_on_host armel-debian-6.0




