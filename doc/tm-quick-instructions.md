# Installation 

### Via a dist file (.tar.gz)

 Coming later

## Building and installing Virtual Machine Manager

* Go to the vvm directory

  `cd vvm`

* Configure the software

  `./configure --prefix <installationdir>`

* Build the software

  `make`

* Install the software

  `sudo make install`

* Verify the installation

  `<installationdir>/bin/tm-vmm --list-clients`


## Setup 

* Create the directory $HOME/.testingmachine

  `mkdir $HOME/.testingmachine`

* Create tm-vmm.conf in .testingmachine, typically with your favorite editor (emacs?)

  `emacs ~/.testingmachine/tm-vmm.conf`

In this file you can configure settings you want to use as default in
your clients. It is perfectly possible to override these settings in
your individual client configurations.

For a list of variables, see section Configuration syntax below.

## Creating a client

First of all you need to decide what machine you want to use with your client. In the example below we will assume it is called Debian6.0

* Use the command line option:

    `--create-client-conf`

Example usage of the option.

    `tm-vmm --create-client-conf  Debian-6.0`


* Copy the public ssh key to the machine, e.g

  `ssh-copy-id 192.168.1.2`

