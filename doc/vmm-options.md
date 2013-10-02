# Testing Machine VMM configuration

## Configuration file syntax

The syntax for setting a variable is the same as in bash scrips (no coincidence!). Basically you write:

`VARIABLE=VALUE`

### Variables 

`LOG_FILE_DIR=/tmp/tm-vmm/log` - sets the log file base directory to /tmp/vmm/log. This means that all logs can be found here.

`VM_STARTUP_TIMEOUT=10` - the time to wait for a virtual machine to start up before considering it to be 'dead'.

`VM_STOP_TIMEOUT=20` - the time to wait for a virtual machine to start up before taking more drastic actions to take down the machine. Ultimately VMM will take down a machine with a `kill`.

`SSH=ssh` - the SSH program to use

`SSH_TEST_OPTIONS=" -o connectTimeout=3"` - the options to pass to the SSH program (see SSH variable above) when testing of the machine is up (or not).

`VM_NAME="Debian6.0"` - the name of the machine to use in this client. It is important that your Virtualization software can find this machine.

`VM_TYPE="VirtualBox"` - what type of Virtulization software this machine belongs to. Currently you can use: VirtualBox and qemu

`VM_IP_ADDRESS=192.168.x.x` - the IP address of the virtual machine 

`VM_USER=$USER` - the user you want to use when accessing the virtual machine

`VM_SUPERUSER=root` - the name of the super user/administrator account, typically used to reboot the machine 

`SSH_PORT=22` - the port where the SSH server is running on the client

`SSH_SHUTDOWN_COMMAND="shutdown -h now"` - VVM will do its very best to shut down a machine as gracefully as possible. One way to do this is to try to shut it down using SSH. The command in this variable will be used to do that.

`ANDROID_ADT_PATH=/opt/adt-bundle-linux-x86_64-20130219` - Path to Android SDK installation. VMM will use this to find the commands adb and android. 

`ANDROID=~/example/bin/android` - Specify the android command. This overrides the android command as found using the environment variable ANDROID_ADT_PATH.

`ADB=~/example/bin/adb` - Specify the adb command. This overrides the android command as found using the environment variable ANDROID_ADT_PATH.


# tm-vmm Command line options


## Client options

`--list-clients` - lists all configured clients

`--start-client CLIENT_NAME` - starts client name CLIENT_NAME

`--start-client-headless CLIENT_NAME` - Start client called CLIENT_NAME as headless (no screen)

`--stop-clients CLIENT_NAME` - stops client named CLIENT_NAME

`--list-running-clients` - Lists all clients currently running

`--check-client-ssh CLIENT_NAME` - Checks if ssh is up on CLIENT_NAME

`--check-client-status CLIENT_NAME` - Checks if clients is up and running

`--client-exec CLIENT_NAME cmd` - Execeute cmd on client

`--client-exec-as-root` - Execeute cmd on client as root

`--client-x11 CLIENT_NAME` - Checks if X11 is up and running on CLIENT_NAME

`--client-screenshot CLIENT_NAME` - Take a screenshot on CLIENT_NAME (not 100% ready)

`--print-client CLIENT_NAME` - Print the configuration for CLIENT_NAME

`--wait-for-ssh CLIENT_NAME` - Wait until ssh is up and running on CLIENT_NAME

`--open-ssh CLIENT_NAME` - Open an interactive shell (using ssh) on CLIENT_NAME

`--check-client-online CLIENT_NAME` - Check if CLIENT_NAME can ping the outside world


## Machine options

`  --list-machines` - lists all machines known to VVM

`  --start-machine MACHINE_NAME` - starts machine named MACHINE

` --start-machine-headless MACHINE_NAME` - Start machine called VM_NAME as headless (no screen)

` --stop-machine MACHINE_NAME`  - stops machine named MACHINE

` --check-machine MACHINE_NAME` - checks status on machine named MACHINE


