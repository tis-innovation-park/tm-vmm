vvm
===

Virtual Machine ManagerInstallation and Setup
----------------------

On local machine:
-----------------

* Edit file bin/test-burger-card:

  Add virtual machine name

  CLIENT_NAME=FSCRS-1


* create dir .ats in $HOME
* create ats.conf in .ats
  more ~/.ats/ats.conf

* add folling to file:
# ATS Settings
  LOG_FILE_DIR=/tmp/ats/log

# ATSVM Settings
  VM_STARTUP_TIMEOUT=300
  VM_STOP_TIMEOUT=20
  SSH=ssh
  SSH_TEST_OPTIONS=" -o connectTimeout=3"

* mkdir ~/.ats/clients
* create conf file for virtual machine:
  [MACHINE NAME].conf

* Add the following to the conf file, adjust as needed:

VM_NAME="VBoxname"
VM_TYPE="VirtualBox"
VM_IP_ADDRESS=192.168.x.x
VM_USER=$USER
VM_SUPERUSER=root
SSH_PORT=22
SSH_SHUTDOWN_COMMAND="shutdown -h now"

* copy public key to machine																									       	    * copy public key to /root/.ssh/authorized_keys

run install-ats.sh
run /tmp/ats-tmp-install/bin/ats-client --start-client $VBOXNAME

Usage:

/tmp/ats-tmp-install/ats-client --check-client-status  $VBOXNAME
/tmp/ats-tmp-install/bin/ats-client --check-client-status  $VBOXNAME
/tmp/ats-tmp-install/bin/ats-client --check-client-ssh  $VBOXNAME
/tmp/ats-tmp-install/bin/ats-client --client-exec $VBOXNAME "pkcs15-tool -L"

