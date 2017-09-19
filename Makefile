############################
# Makefile for dotfile Setup
############################

help:
	@echo ""
	@echo "Usage: make <command>"
	@echo ""
	@echo "  install        Intial install of dotfiles on fresh macOS machine."
	@echo "  update         Pull latest changes from repo and update local files."
	@echo "  uninstall      Remove dotfiles from your home directory."
	@echo ""

update:
	bash ./init.sh

install:
	bash ./macos.sh
	bash ./brew.sh
	bash ./init.sh

uninstall:
	bash uninstall.sh
