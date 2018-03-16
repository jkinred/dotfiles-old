#!/bin/bash
# Sets up links for dotfiles
for file in .[a-zA-Z]*; do echo "Symlinking $file" && ln -sf `pwd`/$file $HOME/; done
