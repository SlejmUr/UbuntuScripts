#!/bin/bash

# Alap programokat telepito script
# Minden benne van ami LINUX GAMING-hez kell!
# !!!! HA VALAMI INNEN NEM KELL CSAK TEGYEL AZOK A SOROK ELE #-ET !!!!

echo Mangohud MSI Afterburner Linux megfeleloje
# Mangohud MSI Afterburner Linux megfeleloje
git clone --recurse-submodules https://github.com/flightlessmango/MangoHud.git
cd MangoHud
./build.sh build 
./build.sh package 
cd ..

echo Felteszi a Steam Telepitojet
# Felteszi a Steam Telepitojet
sudo apt install steam-installer -y

echo ffmpeg install
# Ha Minimal install-t csinaltal akkor FFMPEG kell a bongeszoben video lejatszashoz
sudo apt install ffmpeg -y

echo OBS
# OBS meg ahhoz kello dolgok
sudo apt install v4l2loopback-dkms -y
sudo add-apt-repository ppa:obsproject/obs-studio -y
sudo apt update
sudo apt install obs-studio -y

echo heroic launcher install (EGS)
# Epic Games Store Linuxos megfeleloje
sudo apt install gawk libsigsegv2 -y
sudo apt install apt-transport-https curl
sudo curl https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v1.9.2/heroic_1.9.2_amd64.deb -o heroic.deb 
sudo dpkg -i heroic.deb

sudo apt --fix-broken install

# VLC media lejatszo
echo VLC
sudo apt install vlc

echo Brave Bongeszo telepitoje
# Brave Bongeszo Telepitoje
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser -y

echo Winehq/winetricks install
# WINE Linux Gaming-hez elengedhetetlen telepitoje
# Ha ez felment felugrik majd par ablak azokban nyomj ra az INSTALL Gombra
sudo dpkg --add-architecture i386
wget -qO- https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
sudo apt-add-repository "deb http://dl.winehq.org/wine-builds/ubuntu/ $(lsb_release -cs) main" -y
sudo apt install --install-recommends winehq-stable winetricks -y
winecfg

echo Lutris install
# Lutris Telepito Linux Gaming Alkalmazas
sudo add-apt-repository ppa:lutris-team/lutris
sudo apt update
sudo apt install lutris

sudo apt autoremove -y
# - Restart
./0restart.sh
