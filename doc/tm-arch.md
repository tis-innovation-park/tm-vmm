# Architecture

## Directory overview

### bin

Directory containing all programs visible to the user.

* tm-vmm - main program for the management of virtual machines. This
  script is basically a parser for the functions as stored in the
  scripts in the scripts directory.

* tm-vmm-auto - outdated script previously used to automate stuff

### devel-stuff

A directory containing scripts and other files that can be used while
developing Teting Machine. Nothing of this stuff need be included in
the distribution.

* bin - contains scripts 

     * create-dist.sh - script to create a new distribution

### doc

This is the directory conataining the manuals and other
documentation. The manuals are written in Markdown format.

* *.md - Source version of the manuals 
* generated-files - all files generated from the .md files are placed here
* pics - pictures used in the manuals
* faq-pics - pictures related to the FAQ

### examples

Various examples of how to Testing Machine. We will remove this
directory since we switched to using a separate repository
(tm-examples) for this purpose.

### scripts

This is where the functionality of Testing Machine is stored. 

* functions
* generate-conf
* vmm-client-android-specific
* vmm-client-qemu-specific
* vmm-client-functions

* loggers - directory containing various scripts that implements
  different logging functionalities.
     * debug 
     * debug-logger
     * txt 
     * txt-logger

