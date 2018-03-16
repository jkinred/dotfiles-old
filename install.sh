#!/bin/bash
# Sets up links for dotfiles
for file in .*; do ln -sf `pwd`/$file $HOME/; done
