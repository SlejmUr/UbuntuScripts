#!/bin/bash

# - Itt ird at ha mas driver kell!
driver="nvidia-driver-470"

if dpkg -s $driver>/dev/null
then
	echo "Installed,more nvidia things..."

	# - NVidia cuccok kezdete
	echo NVidia cuccok kezdete

	# Azonnal megnyitja a Nvidia Control Panelt Admin jogokkal
	# Ezzel legeneralod a config file-t amihez a kovetkezo sor lesz hozzaadva
	sudo nvidia-settings

	# Nvidia Control Panel OC Engedelyezes
	sudo nvidia-xconfig -a --cool-bits=28

	# Faszom se tudja mik ezek, de kellenek
	sudo apt install libgconf-2-4 libappindicator1 libc++1 -y

	# GreenWithEnvy Nvidia OC Tool
	sudo apt install git meson python3-pip python3-setuptools libcairo2-dev libgirepository1.0-dev libglib2.0-dev libdazzle-1.0-dev gir1.2-gtksource-3.0 gir1.2-appindicator3-0.1 python3-gi-cairo appstream-util -y
	git clone --recurse-submodules -j4 https://gitlab.com/leinardi/gwe.git
	cd gwe
	git checkout release
	sudo -H pip3 install -r requirements.txt
	meson . build --prefix /usr
	ninja -v -C build
	sudo ninja -v -C build install
	cd ..

	echo NVidia cuccok vege
	# - NVidia cuccok vege
	./0restart.sh
else
	echo "Nem!"
	echo $driver install

	sudo apt install $driver -y
	# - Restart
	./0restart.sh
fi
