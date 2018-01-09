#!/bin/bash

if ! pacman -Si $1 >&/dev/null; then
        cd $HOME
        if ping -c1 https://aur.archlinux.org/cgit/aur.git/snapshot/$1.tar.gz >&/dev/null; then
                echo '+-------------------------------------------+'
                echo '|==> package not found in the official repos|'
                echo '|==> searching it in the AUR                |'
                echo '+-------------------------------------------+'
                mkdir $1
                cd $HOME/$1
                wget https://aur.archlinux.org/cgit/aur.git/snapshot/$1.tar.gz
                tar -xf $1.tar.gz
                makepkg -sic
                echo 'installation complete'
        else
                echo 'package does exist'
        fi
else
        sudo pacman -S $1
fi
exit
