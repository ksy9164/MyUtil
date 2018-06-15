#!/usr/bin/bash
cd ~
sudo apt-get update

#vi
sudo apt-get install vim

#chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb sudo apt-get
sudo apt-get install libxss1 libgconf2-4 libappindicator1 libindicator7
sudo dpkg -i google-chrome-stable_current_amd64.deb #google chrome

#git
sudo apt-get install git-core

#goldendict
sudo apt-get install goldendict
sudo apt-get install goldendict-wordnet

#clipboard copy vi
sudo apt-get install vim-gnome

