# Using Virtual Machine Manager

Regardless of the underlying virtual machine you manage the machine in
one way. We provide the most basic uses of VMM here and encourage you
to read the complete list of command line options in the last section
of the manual.

## Starting

### Starting with guest operating system visible

`vmm --start-client <CLIENTNAME>`

Example:

`vmm --start-client Ubuntu-10`

### Starting without showing guest operating system (headless)

`vmm --start-client-headless <CLIENTNAME>`

Example:

`vmm --start-client-headless Ubuntu-10`

## Checking status

`vmm --check-client-status <CLIENTNAME>`

Example:

`vmm --check-client-status Ubuntu-10`

## Stopping

`vmm --stop-client <CLIENTNAME>`

Example:

`vmm --stop-client Ubuntu-10`

