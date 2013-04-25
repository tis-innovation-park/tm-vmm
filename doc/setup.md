* Create the directory $HOME/.vmm

  `mkdir $HOME/.vmm`

* Create vmm.conf in .vmm, typically with your favorite editor (emacs?)

  `emacs ~/.vmm/vmm.conf`

In this file you can configure settings you want to use as default in your clients. It is perfectly possible to override these settings in your individual client configurations.

For a list of variables, see section Configuration syntax below.

## Creating a machine

To create a machine vvm relies on the virtualization software. So if you want to manage a Virtualbox machine you (at least for now) create it with Virtualbox. For information about how to do this, read the chapter "Creating a Virtualbox machine".


## Creating a client

First of all you need to decide what machine you want to use with your client. In the example below we will assume it is called Debian6.0


* Create a directory for all clients:

  `mkdir ~/.vmm/clients`

* Create a configuration file for the client (using a virtual machine):

  [CLIENT NAME].conf

* Set the variables as you find suitable for your project.

* Example of a client configuration:


    `   VM_NAME="Debian6.0"`

    `   VM_TYPE="VirtualBox"`

    `   VM_IP_ADDRESS=192.168.1.2`

    `   VM_USER=$USER`

    `   VM_SUPERUSER=root`

    `   SSH_PORT=22`

    `   SSH_SHUTDOWN_COMMAND="shutdown -h now"`


 For more variables see section Configuration syntax below

* Copy the public ssh key to the machine, e.g

  `ssh-copy-id 192.168.1.2`

## Client management

*Command line options*:

`--list-clients` - lists all configured clients

`--start-clients client` - starts client 

`  --start-client-headless CLIENT_NAME` - Start client called CLIENT_NAME as headless (no screen)

`--stop-clients client` - stops client

`--list-running-clients` - Lists all clients currently running

`--check-client-ssh` - Checks if ssh is up on client

`--check-client-status` - Checks if clients is up and running

`--client-exec CLIENT cmd` - Execeute cmd on client

`--client-exec-as-root` - Execeute cmd on client as root

`--client-x11 CLIENT` - Checks if X11 is up and running on CLIENT

`--client-screenshot CLIENT` - Take a screenshot on CLIENT (not 100% ready)

`--print-client CLIENT` - Print the configuration for CLIENT

`--wait-for-ssh CLIENT` - Wait until ssh is up and running on CLIENT

`--open-ssh CLIENT` - Open an interactive shell (using ssh) on CLIENT

`--check-client-online CLIENT` - Check if CLIENT can ping the outside world



# Machine management

`  --list-machines` - lists all machines known to VVM

`  --start-machine client` - starts machine 


` --start-machine-headless VM_NAME` - Start machine called VM_NAME as headless (no screen)

`  --stop-machine client`  - stops machine

`--check-machine`


` --stop-client CLIENT_NAME` - Stop client called CLIENT_NAME


` --stop-machine VM_NAME` - Stop machine called VM_NAME


