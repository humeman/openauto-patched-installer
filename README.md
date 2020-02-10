# OAInstaller Script
Installer for openauto on RPi which patches various issues with newer GSP/touchscreen/device detection issues.

Tested using latest Raspbian Buster (2019-09-26) on 3B

# Installation Instructions - Raspberry Pi 3
* Install git, if it's not already installed: `sudo apt install git`
* CD to user directory: `cd ~`
* Clone this repo: `git clone https://github.com/humeman/openauto-patched-installer`
* Mark as executable: `sudo chmod +x openauto-patched-installer/installer.sh`
* Run the installer: `openauto-patched-installer/installer.sh`
* Open OpenAuto (add to crontab or other autorun to start at boot): `sudo ~/openauto/bin/autoapp`
* Configure as necessary, plug in your phone, and you're good to go!

# Installation Instructions - Other Environments
* Install git, if it's not already installed: `sudo apt install git`
* CD to user directory: `cd ~`
* Clone this repo: `git clone https://github.com/humeman/openauto-patched-installer`
* Mark as executable: `sudo chmod +x openauto-patched-installer/pi4-install.sh`
* Run the installer: `openauto-patched-installer/pi4-install.sh`
* Open OpenAuto (add to crontab or other autorun to start at boot): `sudo ~/openauto/bin/autoapp`
* Configure as necessary, plug in your phone, and you're good to go!

# Any issues?
Please notify me (issues tab) so I can attempt to find a solution.

# Uses:
**AASDK**: [abraha2d/aasdk](https://github.com/abraha2d/aasdk), forked from: [opencardev/aasdk](https://github.com/opencardev/aasdk), forked from: [f1xpl/aasdk](https://github.com/f1xpl/aasdk)

**OpenAuto**: [humeman/openauto](https://github.com/humeman/openauto), forked from: [Oper92/openauto](https://github.com/Oper92/openauto), forked from: [f1xpl/openauto](https://github.com/f1xpl/openauto)

*humeman's openauto repo uses a fix to VideoService to stop compile errors, found at [abraha2d/openauto](https://github.com/abraha2d/openauto)*

*thanks to humeman for doing the hard work writing the original script and helping me figure out how to get this running on a pi4; my updated version should work on non-pi3 environments since I have removed the pi3 build target*
