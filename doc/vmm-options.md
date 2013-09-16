# Testing Machine VMM configuration

## Configuration file syntax

The syntax for setting a variable is the same as in bash scrips (no coincidence!). Basically you write:

`VARIABLE=VALUE`

### Variables 

`LOG_FILE_DIR=/tmp/vmm/log` - sets the log file base directory to /tmp/vmm/log. This means that all logs can be found here.

`VM_STARTUP_TIMEOUT=10` - the time to wait for a virtual machine to start up before considering it to be 'dead'.

`VM_STOP_TIMEOUT=20` - the time to wait for a virtual machine to start up before taking more drastic actions to take down the machine. Ultimately VVM will take down a machine with a `kill`.

`SSH=ssh` - the SSH program to use

`SSH_TEST_OPTIONS=" -o connectTimeout=3"` - the options to pass to the SSH program (see SSH variable above) when testing of the machine is up (or not).

`VM_NAME="Debian6.0"` - the name of the machine to use in this client. It is important that your Virtualization software can find this machine.

`VM_TYPE="VirtualBox"` - what type of Virtulization software this machine belongs to. Currently you can use: VirtualBox and qemu

`VM_IP_ADDRESS=192.168.x.x` - the IP address of the virtual machine 

`VM_USER=$USER` - the user you want to use when accessing the virtual machine

`VM_SUPERUSER=root` - the name of the super user/administrator account, typically used to reboot the machine 

`SSH_PORT=22` - the port where the SSH server is running on the client

`SSH_SHUTDOWN_COMMAND="shutdown -h now"` - VVM will do its very best to shut down a machine as gracefully as possible. One way to do this is to try to shut it down using SSH. The command in this variable will be used to do that.


# tm-vmm Command line options


## Client options

`--list-clients` - lists all configured clients

`--start-clients client` - starts client 

`--start-client-headless CLIENT_NAME` - Start client called CLIENT_NAME as headless (no screen)

`--stop-clients client` - stops client

`--list-running-clients` - Lists all clients currently running

 - Checks if ssh is up on client

`--check-client-status` - Checks if clients is up and running

`--client-exec CLIENT cmd` - Execeute cmd on client

`--client-exec-as-root` - Execeute cmd on client as root

`--client-x11 CLIENT` - Checks if X11 is up and running on CLIENT

`--client-screenshot CLIENT` - Take a screenshot on CLIENT (not 100% ready)

`--print-client CLIENT` - Print the configuration for CLIENT

`--wait-for-ssh CLIENT` - Wait until ssh is up and running on CLIENT

`--open-ssh CLIENT` - Open an interactive shell (using ssh) on CLIENT

`--check-client-online CLIENT` - Check if CLIENT can ping the outside world


## Machine options

`  --list-machines` - lists all machines known to VVM

`  --start-machine client` - starts machine 


` --start-machine-headless VM_NAME` - Start machine called VM_NAME as headless (no screen)

`  --stop-machine client`  - stops machine

`--check-machine`


` --stop-client CLIENT_NAME` - Stop client called CLIENT_NAME


` --stop-machine VM_NAME` - Stop machine called VM_NAME


