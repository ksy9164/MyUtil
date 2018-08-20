#!/bin/bash

#archive to daum
cd /etc/apt
sudo cp sources.list sources.list.org
sudo sed -i 's/kr.archive.ubuntu.com/ftp.daum.net/g' sources.list
sudo apt-get update
cd ~

#bashrc setting
echo "alias c='clear'">>~/.bashrc
echo "alias ..='cd ..'">>~/.bashrc
echo "alias ..2='cd ../..'">>~/.bashrc
echo "alias ..3='cd ../../..'">>~/.bashrc
echo "alias ..4='cd ../../../..'">>~/.bashrc
echo "alias ..5='cd ../../../../..'">>~/.bashrc
echo "">>~/.bashrc
echo "function whos { grep -R --color=auto -n --exclude-dir=".git" --exclude tags --exclude cscope.* -e "$1" .; }">>~/.bashrc
echo "# no binary files">>~/.bashrc
echo "function whosnb { grep -R -I --color=auto -n --exclude-dir=".git" --exclude tags --exclude cscope.* -e "$1" .; }">>~/.bashrc
echo "# alias whos='grep -R --color=auto -n -e '$1' .'">>~/.bashrc
echo "">>~/.bashrc
echo "alias whos='whos'">>~/.bashrc
echo "alias whosnb='whosnb'">>~/.bashrc
echo "alias where='find . -name'">>~/.bashrc
echo "alias gr='grep -Rnif - . <<<'">>~/.bashrc
echo "export TERM="xterm-256color"">>~/.bashrc
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

#Vim bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#vimrc setting
git clone https://github.com/ksy9164/MyUtil.git
cp ./MyUtil/.vimrc ~/

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
sudo apt-get install plank 
# you can setup plank at ->  
#$plank --preferences

#twaek tool
sudo apt-get install gnome-tweak-tool

#Numix theme
sudo add-apt-repository ppa:numix/ppa
sudo apt-get update
sudo apt-get install numix-* # you can setup theme at Tweak Tool

#cmake
sudo apt install cmake

#ddd install
sudo apt install ddd

#tmux
sudo apt-get install tmux

