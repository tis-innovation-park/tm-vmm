# Building Testing Machine

The scripts and Makefiles in Testing Machine contains variables used
to store the installation dir. This is needed to source all bash
files.

The scripts and Makefiles are created, with the variables descrbied
above updated according to the installation dir, from templates.

## Configure the scripts and Makfile

* Go to the vmm directory

  `cd vmm`

* Configure the software (you can use --prefix=<installationdir> to
  specify a non-default installation directory)

  `./configure`

## Build

* Build the software

  `make`

## Install and verify

* Install the software

  `sudo make install`

* Verify the installation (you might need to prepend the path to tm-vmm, if the
  installation directory is not in your $PATH)

  `tm-vmm --list-clients`

