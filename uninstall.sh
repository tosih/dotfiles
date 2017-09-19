#!/usr/bin/env bash
cd $HOME;

function cleanupDotFiles() {
	rm -rf .aliases
  rm -rf .exports
  rm -rf .functions
  rm -rf .work
  rm -rf .zshrc
  rm -rf .zpreztorc
}

function restoreZshrc() {
  tee ~/.zshrc <<EOS
# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
EOS
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
