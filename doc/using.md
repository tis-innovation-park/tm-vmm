# Using Virtual Machine Manager

Regardless of the underlying virtual machine you manage the machine in
one way. We provide the most basic uses of tm-vmm here and encourage you
to read the complete list of command line options in the last section
of the manual.

## Starting

### Starting with guest operating system visible

`tm-vmm --start-client <CLIENTNAME>`

Example:

`tm-vmm --start-client Ubuntu-10`

### Starting without showing guest operating system (headless)

`tm-vmm --start-client-headless <CLIENTNAME>`

Example:

`tm-vmm --start-client-headless Ubuntu-10`

## Checking status

`tm-vmm --check-client-status <CLIENTNAME>`

Example:

`tm-vmm --check-client-status Ubuntu-10`

## Stopping

`tm-vmm --stop-client <CLIENTNAME>`

Example:

`tm-vmm --stop-client Ubuntu-10`

