# Testing eGov sites

The biggest obstacle we had to overcome was the login process. Since this is done using a smart card
and a pin we found no way to do this using Selenium and so Sikuli was used.
Once logged in, Selenium can be used to test the web services.

Getting Sikuli to perform an automatic login can be done in the following way:

## Sikuli

Installing Java is a prerequisite for running Sikuli. Install it with apt-get:

`sudo apt-get install openjdk-6-jdk`

The package “wmctrl” is used to resize windows.

`sudo apt-get install wmctrl`

The software can be installed on Ubuntu 12.04 LTS with the following command:

`sudo apt-get install sikuli`

In order to use Sikuli a test case has to be made. This is done within Sikuli to emulate the login process step by step.
A possible test case could look like this:

```python
wait("KJ2.png",60)
click("1352889207953.png")
sleep(5)
wait("Pleaseentert.png",60)
click("Pleaseentert-1.png")
type("96414648")
sleep(1)
click("OK.png")
sleep(2)
wait("Thlssltehasr.png",60)
click("1352890307684.png")
sleep(2)
wait("Tl2fIlHlKJlI.png",60)
```

The .png files are created with Sikuli. When running Sikuli you can take 'snapshots' of certain
parts of the screen that are captured and later used as a reference point where to perform certain
functions like emulating button presses or entering text. Sikuli then 'looks' for parts of the screen
that matches the 'snapshots' before it performs actions. This works well with web pages since 
Sikuli can wait until a page has loaded before executing a command.



