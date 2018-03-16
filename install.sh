#!/bin/bash
# Sets up links for dotfiles
for file in .*; do ln -s `pwd`/$file $HOME/; done
