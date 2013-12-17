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


# Adding bash code or fixing bugs

## Add a new command line option

If you want to a new command line option to tm-vmm you should update
the bin/tm-vmm.tmpl file. Make sure to add code to parse the command
line and also as an entry in the help printout.

Update the documentation accordingly.

## Add bash functions

If you want to fix bugs or add new features add this in the scripts directory. 

If you add a bash file, make sure to update the Makefile.tmpl accordingly.	

# Writing documentation

All documentation is written in Markdown format. We use pandoc to
generate html and pdf.

Each chapter/section is written in separate files to make them more
easily re-usable. Since there's no *include* functionality in Markdown
we had used the Makefile to cp/cat together the various
manuals. Perhaps not the most optimal way of doing things - but it
works. If you have improvement suggestion you're more than welcome.

If you add a markdown file, make sure to update the doc/Makefile.tmpl
accordingly.



