############################
# Makefile for dotfile Setup
############################

help:
	@echo ""
	@echo "Usage: make <command>"
	@echo ""
	@echo "  install        Install MacOS defaults, Homebrew formulas, and symlink dotfiles"
	@echo "  update         Pull latest changes from repo and update local files."
	@echo "  uninstall      Remove dotfiles from your home directory."
	@echo ""

update:
	bash install.sh

install:
	bash macos.sh
	bash brew.sh
	bash install.sh

uninstall:
	bash uninstall.sh
