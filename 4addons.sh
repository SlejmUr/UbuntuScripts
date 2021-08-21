#!/bin/bash

# RP fele kommentar:
# .DEB csomagok telepitese
# .DEB File-ok legyenek a script mellett ugyanabban a mappaban futtatas elott!
# Ne felejtsd el a scriptben atirni a file neveket futtatas elott
# File nev a sudo dpkg -i parancs utan szunettel elvalasztva legyen!
# Pelda: sudo dpkg -i vivaldi-stable_4.1.2369.18-1_amd64.deb

# Slejm fele kommentar:
# talalsz egy "installing_list.txt" fajlt letolteskor, oda ird be a deb nevet
# elotte toltsd le a .deb file-okat amik neked kellenek.

echo Addonsok telepitese

while read input_text
do
	sudo dpkg -i $input_text.deb

	sudo apt --fix-broken install

	sudo apt autoremove -y
done < installing_list.txt

	sudo apt --fix-broken install

	sudo apt autoremove -y
# - Restart
./0restart.sh