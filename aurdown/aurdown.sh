#!/bin/bash

cd ~/Scaricati/

echo 'write the package names:' && read pkg

wget https://aur.archlinux.org/cgit/aur.git/snapshot/$pkg.tar.gz
tar -xf $pkg.tar.gz
cd $pkg/
makepkg -sic --noconfirm


