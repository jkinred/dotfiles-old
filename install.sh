#!/bin/bash
# Sets up links for dotfiles
set -x
for file in .*; do echo "Symlinking $file" && ln -sf `pwd`/$file $HOME/; done
