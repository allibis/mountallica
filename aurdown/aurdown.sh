#!/bin/bash

if ! pacman -Si $1 >&/dev/null; then
        cd $HOME                
        echo '+-------------------------------------------+'
        echo '|==> package not found in the official repos  |'
        echo '|==> searching it in the AUR                |'
        echo '+-------------------------------------------+'
        mkdir $1
        cd $HOME/$1
        if ! wget https://aur.archlinux.org/cgit/aur.git/snapshot/$1.tar.gz >&/dev/null; then
                if ! wget https://aur.archlinux/cgit/aur.git/snapshot/$1-git.tar.gz >&/dev/null ; then
                        echo '==> package not found'
		else
			tar -xf $1-git.tar.gz
			cd $1
			if ! makepkg -sic ; then
				echo '==> installation failed'
			else
				echo '==> installation complete'
			fi
		fi

        else
                tar -xf $1.tar.gz
                cd $1
                if ! makepkg -sic; then                 
                        echo '==> installation failed'
                else
                        echo '==> installation complete'
                fi
        fi
        rm -r $HOME/$1
else    
        sudo pacman -S $1
fi
exit
