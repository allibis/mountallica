#!/bin/bash

sudo pacman -S $1


for errore in stdout

do
        echo '.......................................'
        echo '==> package not found in the official repos'
        echo '==> searching it in the AUR'
        echo '.......................................'
        cd $HOME
        mkdir $1
        cd $HOME/$1
        wget https://aur.archlinux.org/cgit/aur.git/snapshot/$1.tar.gz
        tar -xf $1.tar.gz
        makepkg -sic
done
~      

