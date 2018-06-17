#!/usr/bin/bash

#archive to daum
cd /etc/apt
sudo cp sources.list sources.list.org
sudo sed -i 's/kr.archive.ubuntu.com/ftp.daum.net/g' sources.list
sudo apt-get update
cd ~

sudo apt-get update

#vi
sudo apt-get install vim

#clipboard copy vi
sudo apt-get install vim-gnome

#chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb sudo apt-get
sudo apt-get install libxss1 libgconf2-4 libappindicator1 libindicator7
sudo dpkg -i google-chrome-stable_current_amd64.deb #google chrome

#git
sudo apt-get install git-core

#vimrc setting
git clone https://github.com/ksy9164/MyUtil.git
cd MyUtill
mv .vimrc ~
cd ~

#goldendict
sudo apt-get install goldendict
sudo apt-get install goldendict-wordnet

#ctag
sudo apt-get install ctags

#htop
sudo apt install htop

#tig
sudo apt-get install tig

#plank
sudo apt-get install plank # you can setup plank at ->  $plank --preferences

#twaek tool
sudo apt-get install gnome-tweak-tool

#plank setup
plank --preferences

#Numix theme
sudo add-apt-repository ppa:numix/ppa
sudo apt-get update
sudo apt-get install numix-* # you can setup theme at Tweak Tool

