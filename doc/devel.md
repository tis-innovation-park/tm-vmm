# Introduction to the directory and file layout

## Libraries

The main bulk of the funtionality can be found in the scripts
folders. The files in this folder are described below.

### functions

This file contains functions used by the various scripts.

### generate-conf

This file contains functions for generating configuration files.

### Loggers

A folder containing functions for logging.

### vmm-client-functions

Support functions primarily for the vmm script.

## Programs

### vmm

When adding a new option to vmm we suggest you do the following to
vmm:

* add parsing of the option to the vmm
* add help text to vmm

The implementation is probably better added to the library files above. This makes it easier to reuse in other scripts.

### vmm-auto

A scripts that makes it possible to write pretty advanced one-liners.

# Developing VMM

VMM is written in bash. 
