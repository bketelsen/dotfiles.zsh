MAKEPATH:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

all:
	@-rm -rf $(HOME)/.zshrc
	ln -s $(MAKEPATH)/zshrc $(HOME)/.zshrc
	@-rm -rf $(HOME)/.zshenv
	ln -s $(MAKEPATH)/zshenv $(HOME)/.zshenv
	@-rm -rf $(HOME)/.env.zsh
	ln -s $(MAKEPATH)/env.zsh $(HOME)/.env.zsh
	@-rm -rf $(HOME)/.p10k.zsh
	ln -s $(MAKEPATH)/p10k.zsh $(HOME)/.p10k.zsh
	@-rm -rf $(HOME)/.tmux.conf
	ln -s $(MAKEPATH)/tmux.conf $(HOME)/.tmux.conf
	@-rm -rf $(HOME)/.gitconfig
	ln -s $(MAKEPATH)/gitconfig $(HOME)/.gitconfig
	@-rm -rf $(HOME)/.editorconfig
	ln -s $(MAKEPATH)/editorconfig $(HOME)/.editorconfig

brew:
	./scripts/homebrew.sh

zsh:
	./scripts/zsh-setup.sh

