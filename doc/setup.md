# Setup 

* Create the directory $HOME/.testingmachine

  `mkdir $HOME/.testingmachine`

* Create tm-vmm.conf in .testingmachine, typically with your favorite editor (emacs?)

  `emacs ~/.testingmachine/tm-vmm.conf`

In this file you can configure settings you want to use as default in
your clients. It is perfectly possible to override these settings in
your individual client configurations.

For a list of variables, see section Configuration syntax below.

## Creating a machine

To create a machine vmm relies on the virtualization software. So if
you want to manage a Virtualbox machine you (at least for now) create
it with Virtualbox. For information about how to do this, read the
chapter "Creating a Virtualbox machine" or "Creating an Android
Virtual Device".


## Preparing for creating a client

First of all you need to decide what machine you want to use with your
client. 

* Create a directory for all clients:

  `mkdir ~/.testingmachine/clients`

## Create a VirtualBox client

In the example below we will assume it is called Debian-6.0

### Create a client configuration file

You can create client configuration in two different ways:

* Manually
* Automatically

#### Create a configuration file manually

* Manually create a configuration file for the client (bound to a virtual machine):

      [CLIENT_NAME].conf

    * Set the variables as you find suitable for your project.

#### Create a configuration file automatically

* Use the command line option:

    `--create-client-conf`

Example usage of the option.

    `tm-vmm --create-client-conf  Debian-6.0`

It is assumed that Debian-6.0 is a VirtualBox image.

### Example of a client configuration:

`   VM_NAME=Debian6.0`

`   VM_TYPE="VirtualBox"`

`   VM_IP_ADDRESS=192.168.1.2`

`   VM_USER=$USER`

`   VM_SUPERUSER=root`

`   SSH_PORT=22`

`   SSH_SHUTDOWN_COMMAND="shutdown -h now"`

For more variables see section Configuration syntax below

* Copy your public ssh key to the machine's root account, e.g

  `ssh-copy-id -p 2256 `

## Create an Android client




In the example below we will assume it is called Nexus-10

### Create a client configuration file

You can create client configuration in two different ways:

* Manually
* Automatically

#### Create a configuration file manually

* Manually create a configuration file for the client (bound to a virtual machine):

      [CLIENT_NAME].conf

    * Set the variables as you find suitable for your project.

#### Create a configuration file automatically

* Use the command line option:

    `--create-client-conf`

Example usage of the option.

    `tm-vmm --create-client-conf  Nexus-10`

It is assumed that Debian-6.0 and Nexus-10 is the name either a VirtualBox or Android image.

### Example of a client configuration:


`VM_NAME="eGov-android-machine"`

`VM_TYPE="Android"`

`ANDROID_SYS=emulator64-arm`

For more variables see section Configuration syntax below

