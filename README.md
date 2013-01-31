vmm - Virtual Machine Manager
===

Installation
----------------------

* Download git code

  `git://github.com/tis-innovation-park/vvm.git`

* Go to the vvm directory

  `cd vvm`

* Configure the software

  `./configure --prefix <installationdir>`

* Build the software

  `make`

* Install the software

  `make install`

* Verify the installation

  `<installationdir>/bin/ats-client --list-clients`


Setup (currently not in sync)
----------------------


* create dir $HOME/.ats

  `mkdir $HOME/.ats`

* create ats.conf in .ats, typically with your favorite editor (emacs?)

  `emacs ~/.ats/ats.conf`

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

* copy public key to machine

* copy public key to /root/.ssh/authorized_keys

 ./configure --prefix <install dir>

* Try it out:

 /tmp/ats-tmp-install/bin/ats-client --list-clients

Usage:

/tmp/ats-tmp-install/ats-client --check-client-status  $VBOXNAME
/tmp/ats-tmp-install/bin/ats-client --check-client-status  $VBOXNAME
/tmp/ats-tmp-install/bin/ats-client --check-client-ssh  $VBOXNAME
/tmp/ats-tmp-install/bin/ats-client --client-exec $VBOXNAME "pkcs15-tool -L"

