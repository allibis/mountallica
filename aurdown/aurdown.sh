#!/bin/bash

cd ~/

wget https://aur.archlinux.org/cgit/aur.git/snapshot/$1.tar.gz
tar -xf $1.tar.gz
cd $1/
makepkg -sic


