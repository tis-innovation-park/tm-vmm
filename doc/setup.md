## Setup 

* Create the directory $HOME/.testingmachine

  `mkdir $HOME/.testingmachine`

* Create tm-vmm.conf in .testingmachine, typically with your favorite editor (emacs?)

  `emacs ~/.testingmachine/tm-vmm.conf`

In this file you can configure settings you want to use as default in
your clients. It is perfectly possible to override these settings in
your individual client configurations.

For a list of variables, see section Configuration syntax below.

## Creating a machine

To create a machine vvm relies on the virtualization software. So if
you want to manage a Virtualbox machine you (at least for now) create
it with Virtualbox. For information about how to do this, read the
chapter "Creating a Virtualbox machine".


## Creating a client

First of all you need to decide what machine you want to use with your client. In the example below we will assume it is called Debian6.0


* Create a directory for all clients:

  `mkdir ~/.testingmachine/clients`

## Create a client configuration

You can create client configuration in two different ways:

* Manually create a configuration file for the client (using a virtual machine):

      [CLIENT NAME].conf

    * Set the variables as you find suitable for your project.

* Use the command line option:

    `--create-client-conf`

Example usage of the option.

    `tm-vmm --create-client-conf  Debian-6.0`

## Example of a client configuration:


`   VM_NAME=Debian6.0`
`   VM_TYPE="VirtualBox"`
`   VM_IP_ADDRESS=192.168.1.2`
`   VM_USER=$USER`
`   VM_SUPERUSER=root`
`   SSH_PORT=22`
`   SSH_SHUTDOWN_COMMAND="shutdown -h now"`

For more variables see section Configuration syntax below

* Copy the public ssh key to the machine, e.g

  `ssh-copy-id 192.168.1.2`



