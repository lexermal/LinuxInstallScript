#!/bin/bash
#
# Version 2.4
# 2025-09-20
#
apt-get update
apt-get dist-upgrade -y
apt-get upgrade -y
#
echo "______________________Install software______________________"
apt install virtualbox vlc nmap traceroute compizconfig-settings-manager apt-transport-https curl git nextcloud-desktop -y

snap install brave
snap install insomnia 
snap install mailspring
snap install chromium
snap install telegram-desktop
snap install wps-office
snap install spotify
snap install slack


echo "______________________Finished______________________"
echo Reboot this device to finish the setup.
