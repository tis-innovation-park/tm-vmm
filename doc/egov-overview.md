## eGov Overview

VMM is used to test eGovernment services that can only be accessed using a smart card. eGovernment services can vary from country to country but generally it grants citizens access to important documents and information. In most EU countries there are additional services like paying property tax that can be done online. Most governments in Europe are leaning in this direction in order to decrease administrative overhead. 

The drivers that are currently being used for the smart card testing are the OpenSC drivers and so far they have been working really well.

There are two types of cards that are currently being tested in Italy. 

* Running pkcs15-tool -D from a shell outputs the following:

`pkcs15-tool -D
Using reader with a card: ACS ACR38U-CCID 00 00
PKCS#15 Card [USER]:
	Version        : 0
	Serial number  : 6041110748903908
	Manufacturer ID: IC: Infineon; mask: Siemens
	Flags          : 
`

* A newer card has recently been released:

`pkcs15-tool -D
Using reader with a card: ACS ACR38U-CCID 00 00
PKCS#15 Card [BEATRICE CORALIA DALI]:
	Version        : 0
	Serial number  : 6041500113627001
	Manufacturer ID: IC: ATMEL; mask: Athena
	Flags          : 
`

With the OpenSC drivers installed (found in the repos of most major Linux distributions) and Firefox setup everything works.
