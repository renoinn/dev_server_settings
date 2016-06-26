#!/bin/bash

cd ../
ln -s dev_server_settings/.vim/ .vim
ln -s dev_server_settings/.vimrc .vimrc
ln -s dev_server_settings/.bash_profile .bash_profile
source ~/.bash_profile
cp dev_server_settings/.git-completion.bash ./
cp dev_server_settings/.git-prompt.sh ./
ln -s dev_server_settings/.inputrc .inputrc
ls
