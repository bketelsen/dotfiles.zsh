MAKEPATH:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

all:
	@-rm -rf $(HOME)/.zshrc
	ln -s $(MAKEPATH)/zshrc $(HOME)/.zshrc
	@-rm -rf $(HOME)/.zprofile
	ln -s $(MAKEPATH)/zprofile $(HOME)/.zprofile
	@-rm -rf $(HOME)/.tmux.conf
	ln -s $(MAKEPATH)/tmux.conf $(HOME)/.tmux.conf
	@-rm -rf $(HOME)/.gitconfig
	ln -s $(MAKEPATH)/gitconfig $(HOME)/.gitconfig
	@-rm -rf $(HOME)/.editorconfig
	ln -s $(MAKEPATH)/editorconfig $(HOME)/.editorconfig

