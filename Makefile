############################
# Makefile for dotfile Setup
############################

help:
	@echo ""
	@echo "Usage: make <command>"
	@echo ""
	@echo "  install        Intial install of dotfiles on fresh macOS machine."
	@echo "  update         Pull latest changes from repo and update local files."
	@echo ""

update:
	touch ~/.secrets
	@echo `pwd`
	bash bootstrap.sh

install:
	bash ./macos.sh
	bash ./init.sh
	bash bootstrap.sh
