# Installation 

##  Software requirements

The bash, ssh and expect programs will be needed, but they are included in most
popular Linux distributions out-of-the-box.

You will also want at least one virtualization software (see list of supported
softwares below). The wmctrl package is optional, but with allow vmm to maximize
the window of your VirtualBox client systems.

In order to use vmm to run
[https://github.com/tis-innovation-park/tm-examples](the Testing Machine
examples), you will want a Java SDK and Ant. For Debian, run `apt-get install
default-jdk`. For Ubuntu, run `sudo apt-get install default-jdk ant`. For
Fedora, run `yum install java-1.7.0-openjdk ant`.

### Additional requirements for vmm developers

* pandoc - to generate documentation

* pdflatex - to generate documentation

## Supported Virtualization software

* Virtualbox (install it using `apt-get install linux-headers-$(uname -r|sed
  's,[^-]*-[^-]*-,,') virtualbox` on Debian-based systems (such as Debian and
  Ubuntu), or grab it from [https://www.virtualbox.org/wiki/Linux_Downloads](the
  VirtualBox Linux Downloads section))

* Android (install it by downloading
  [https://developer.android.com/sdk/index.html](the Android Development Toolkit
  Bundle), extract the ZIP archive, modify ~/.bashrc to include `export
  ANDROID_ADT_PATH=<Path to ADT bundle directory>`, and update your environment
  by executing `source ~/.bashrc`)

* qemu

We might support vmware in the future.

## Downloading Virtual Machine Manager

### Via git

* Download git code

  `git clone git://github.com/tis-innovation-park/vmm.git`

### Via a dist file (.tar.gz)

 Coming later

## Building and installing Virtual Machine Manager

* Go to the vmm directory

  `cd vmm`

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
