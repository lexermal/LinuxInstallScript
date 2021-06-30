#!/bin/bash
#
# Version 2.2
# 2020-11-10
#
apt-get update
apt-get dist-upgrade -y
apt-get upgrade -y
apt-get remove dragonplayer cheese rhythmbox firefox -y -m
#
echo "______________________Install software______________________"
apt-get install virtualbox gimp vlc clamav bleachbit nmap traceroute dia filezilla obs-studio compizconfig-settings-manager gnome-tweak-tool flameshot libreoffice  apt-transport-https curl git -y

add-apt-repository ppa:linuxuprising/shutter -y
apt-get install shutter -y

add-apt-repository ppa:nextcloud-devs/client -y
apt-get install nextcloud-client -y

snap install intellij-idea-ultimate --classic --edge
snap install insomnia 
snap install mailspring
snap install teams-for-linux
snap install chromium
snap install keepassxc 
snap install telegram-desktop
snap install drawio
snap install brave 
snap install rpi-imager


apt-add-repository ppa:qos/pulseaudio-dlna
apt-get install pulseaudio-dlna


echo "______________________Install yarn______________________"
apt-get install nodejs -y
apt-get remove cmdtest -y
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
apt-get update
apt-get install --no-install-recommends yarn -y


echo "______________________Install gnome extentions______________________"
echo "install gnome-shell-extension-installer"
wget -O gnome-shell-extension-installer "https://github.com/brunelli/gnome-shell-extension-installer/raw/master/gnome-shell-extension-installer"
chmod +x gnome-shell-extension-installer
mv gnome-shell-extension-installer /usr/bin/

echo "install extentensions"
gnome-shell-extension-installer 751 3.26   #Audio Output Switcher
gnome-shell-extension-installer 1401 3.30  #Bluetooth quick connect

echo "Add pulseaudio-dlna to autostart"
gnome-session-properties 

echo "Change Gnome settings"
gsettings set org.gnome.desktop.interface gtk-theme "Yaru-dark"
gsettings set org.gnome.shell favorite-apps "[]"

echo "Install brave addons"
install_chrome_extension () {
  preferences_dir_path="/home/mmobil/.config/BraveSoftware/Brave-Browser/Default/Extensions"
  pref_file_path="$preferences_dir_path/$1.json"
  upd_url="https://clients2.google.com/service/update2/crx"
  mkdir -p "$preferences_dir_path"
  echo "{" > "$pref_file_path"
  echo "  \"external_update_url\": \"$upd_url\"" >> "$pref_file_path"
  echo "}" >> "$pref_file_path"
  echo Added \""$pref_file_path"\" ["$2"]
}

install_chrome_extension "fhcgjolkccmbidfldomjliifgaodjagh" "Cookie AutoDelete"
install_chrome_extension "kbfnbcaeplbcioakkpcpgfkobkghlhen" "Grammarly for Chrome"
install_chrome_extension "fihnjjcciajhdojfnbdddfaoknhalnja" "I don't care about cookies"
install_chrome_extension "oboonakemofpalcgghocfoadofidjkkk" "KeePassXC-Browser"
install_chrome_extension "cjpalhdlnbpafiamejdnhcphjbkeiagm" "uBlock Origin"
install_chrome_extension "nlkaejimjacpillmajjnopmpbkbnocid" "YouTube NonStop"


echo "______________________Finished______________________"
echo You should reboot now.

echo TODO SCRIPT: Am Desktop Ordner mit VPN Config files die heruntergeladen wurden erstellen.

echo -shortcuts für terminal ändern auf strg c und strg-v
echo -Sound aus
echo -Change color theme to dark
echo -Auto install vpn files from https://nordvpn.com/ovpn/
echo TODO SCRIPT: Automatically handle startup shortcuts: brave, nextcloud, keepassxc, pulseaudio-dlna https://askubuntu.com/questions/37957/how-do-i-manage-applications-on-startup-in-gnome-3



