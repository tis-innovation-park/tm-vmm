# Installation 

##  Software requirements
 
* ssh (client)

* at least one virtualization software (see list of supported softwares below)

* bash

* expect (command-line utility needed for the Android-specific functionality)

### Additional requirements for VMM developers

* pandoc - to generate documentation

* pdflatex - to generate documentation

## Supported Virtualization software

* Virtualbox

* Android

* qemu

We're looking into supporting: vmware, 

## Downloading Virtual Machine Manager

### Via git

* Download git code

  `git clone git://github.com/tis-innovation-park/vmm.git`

### Via a dist file (.tar.gz)

 Coming later

## Building and installing Virtual Machine Manager

* Go to the vvm directory

  `cd vvm`

* Configure the software (you can use --prefix=<installationdir> to
  specify a non-default installation directory)

  `./configure`

* Build the software

  `make`

* Install the software

  `sudo make install`

* Verify the installation (you might need to prepend the path to tm-vmm, if the
  installation directory is not in your $PATH)

  `tm-vmm --list-clients`
