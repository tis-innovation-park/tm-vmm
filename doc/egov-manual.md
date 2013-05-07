# e-Gov Testing Machine

The biggest hurdle to overcome in testing eGov services is getting past the login
prompt which requires a smart card and pin. Once login is successful testing can
begin using tools such as Selenium. Sikuli was used to overcome this obstacle since
we did not know how to do this with Selenium,

# Sikuli

Installing Java is a prerequisite for running Sikuli. Install it with apt-get:

`sudo apt-get install openjdk-6-jdk`

The package “wmctrl” is used to resize windows. This can also be installed with apt-get.

Sikuli can be installed on Ubuntu 12.04 LTS with the following command:

`sudo apt-get install sikuli`

In order to use Sikuli a test case has to be made. This is done within Sikuli to emulate the login process step by step.

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

The .png files are images that were made using Sikuli. The process simply captures the steps that were taken
to successfully login. Since Sikuli is vision based it takes 'snapshots' of the browser. Sikuli then uses these
snapshots to identify what to look for before executing a command.1

