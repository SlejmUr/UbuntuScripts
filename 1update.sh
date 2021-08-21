#!/bin/bash

# Rendszer Frissitesek es Nem Kello Modulok Torlese
echo Rendszer Frissitesek es Nem Kello Modulok Torlese

sudo apt update

sudo apt upgrade -y

sudo apt autoremove -y

./0restart.sh