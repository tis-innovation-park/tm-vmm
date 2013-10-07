# Testing Machine vmm configuration

## Configuration file syntax

The syntax for setting a variable is the same as in bash scrips (no coincidence!). Basically you write:

`VARIABLE=VALUE`

### Variables 

`LOG_FILE_DIR=/tmp/tm-vmm/log` - sets the log file base directory to /tmp/vmm/log. This means that all logs can be found here.

`VM_STARTUP_TIMEOUT=10` - the time to wait for a virtual machine to start up before considering it to be 'dead'.

`VM_STOP_TIMEOUT=20` - the time to wait for a virtual machine to start up before taking more drastic actions to take down the machine. Ultimately vmm will take down a machine with a `kill`.

`SSH=ssh` - the SSH program to use

`SSH_TEST_OPTIONS=" -o connectTimeout=3"` - the options to pass to the SSH program (see SSH variable above) when testing of the machine is up (or not).

`VM_NAME="Debian6.0"` - the name of the machine to use in this client. It is important that your Virtualization software can find this machine.

`VM_TYPE="VirtualBox"` - what type of Virtulization software this machine belongs to. Currently you can use: VirtualBox and qemu

`VM_IP_ADDRESS=192.168.x.x` - the IP address of the virtual machine 

`VM_USER=$USER` - the user you want to use when accessing the virtual machine

`VM_SUPERUSER=root` - the name of the super user/administrator account, typically used to reboot the machine 

`SSH_PORT=22` - the port where the SSH server is running on the client

`SSH_SHUTDOWN_COMMAND="shutdown -h now"` - vmm will do its very best to shut down a machine as gracefully as possible. One way to do this is to try to shut it down using SSH. The command in this variable will be used to do that.

`ANDROID_ADT_PATH=/opt/adt-bundle-linux-x86_64-20130219` - Path to Android SDK installation. vmm will use this to find the commands adb and android. 

`ANDROID=~/example/bin/android` - Specify the android command. This overrides the android command as found using the environment variable ANDROID_ADT_PATH.

`ADB=~/example/bin/adb` - Specify the adb command. This overrides the android command as found using the environment variable ANDROID_ADT_PATH.


# tm-vmm Command line options


## Client options

`--list-clients` - Lists all configured clients

`--start-client CLIENT_NAME` - Starts the client called CLIENT_NAME

`--start-client-headless CLIENT_NAME` - Starts the client called CLIENT_NAME as headless (no screen)

`--stop-clients CLIENT_NAME` - Stops the client called CLIENT_NAME

`--list-running-clients` - Lists all clients currently running

`--check-client-ssh CLIENT_NAME` - Checks if ssh is up on the client called CLIENT_NAME

`--check-client-status CLIENT_NAME` - Checks if the client called CLIENT_NAME is up and running

`--client-exec CLIENT_NAME COMMAND` - Execeutes the COMMAND on the client called CLIENT_NAME

`--client-exec-as-root CLIENT_NAME COMMAND` - Execeutes the COMMAND on the client called CLIENT_NAME as root

`--client-x11 CLIENT_NAME` - Checks if X11 is up and running on the client called CLIENT_NAME

`--client-screenshot CLIENT_NAME` - Takes a screenshot on the client called CLIENT_NAME (not 100% ready)

`--print-client CLIENT_NAME` - Prints the configuration for the client called CLIENT_NAME

`--wait-for-ssh CLIENT_NAME TIMEOUT<optional>` - Waits until ssh is up and running on the client called CLIENT_NAME (Default TIMEOUT value is 120 if it is not set by the user)

`--wait-for-client CLIENT_NAME TIMEOUT<optional>` - (Needs updating) (Default TIMEOUT value is 120 if it is not set by the user)

`--open-ssh CLIENT_NAME TIMEOUT<optional>` - Opens an interactive shell (using ssh) on the client called CLIENT_NAME (Default TIMEOUT value is 120 if it is not set by the user)

`--check-client-online CLIENT_NAME` - Checks if the client called CLIENT_NAME can ping the outside world

`--pause-client CLIENT_NAME` - Pauses the running client

`--resume-client CLIENT_NAME` - Resumes the paused client

`--client-exec-fail CLIENT_NAME COMMAND` - Executes the COMMAND on the client called CLIENT_NAME and turns it off upon failure

`--create-client-conf CLIENT_NAME` - Creates the configuration for the client called CLIENT_NAME automatically

`--snapshot-client CLIENT_NAME` - Takes a screen shot on the client called CLIENT_NAME (not implemented for VirtualBox)

`--client-copy-file SRC DST` - Copies a file from a client to a host or from a host to a client; a host resource could be "~/myhostfile", and a client resource could be "[CLIENT_NAME]:~/myclientfile"

`--is-client-up CLIENT_NAME` - Checks whether the client called CLIENT_NAME is running

`--unlock-screen CLIENT_NAME` - Unlocks the screen of the virtual machine (Android only for now)

`--install-app CLIENT_NAME PACKAGE` - Installs application PACKAGE on the client called CLIENT_NAME (APK, DEB or RPM); APK files are not yet transferred to the client

`--uninstall-app CLIENT_NAME APP_NAME` - Uninstalls application APP_NAME on the client called CLIENT_NAME (APK, DEB or RPM)

`--print-client-settings CLIENT_NAME` - Prints the path to the client's configuration

`--get-client-os CLIENT_NAME` - Displays the operating system of the client called CLIENT_NAME


## Machine options

`  --list-machines` - Lists all machines known to vmm

`  --start-machine MACHINE_NAME` - Starts machine named MACHINE

` --start-machine-headless MACHINE_NAME` - Starts machine called VM_NAME as headless (no screen)

` --stop-machine MACHINE_NAME`  - Stops machine named MACHINE

` --check-machine-status MACHINE_NAME` - Checks status on the machine called MACHINE_NAME

`--list-running-machines` - Lists all machines currently running

`--pause-machine MACHINE_NAME` - Pauses the running virtual machine

`--resume-machine MACHINE_NAME` - Resumes the paused virtual machine


## Other

`--version` - Checks the current version of the tm-vmm

`--import-appliance APPLIANCE` - Imports an OVA file into VirtualBox (OVF, Open Virtualization Format, is a cross-platform standard for packaging ready-made virtual machines that can be imported to virtualizers, while OVA is the name of a tar archive file with the OVF directory inside)
