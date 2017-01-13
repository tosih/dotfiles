#!/usr/bin/env bash

cd $HOME;

function cleanupDotFiles() {
	rm -rf .aliases
  rm -rf .bash_profile
  rm -rf .bashrc
  rm -rf .config/powerline
  rm -rf .config/karabiner
  rm -rf .exports
  rm -rf .functions
  rm -rf .inputrc
  rm -rf .vim
  rm -rf .vimrc
  rm -rf .work
  touch ~/.bash_profile 
	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	cleanupDotFiles;
else
  read -p "This will uninstall dotfiles. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		cleanupDotFiles;
	fi;
fi;
unset cleanupDotFiles;
