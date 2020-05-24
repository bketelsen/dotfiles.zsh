# DOTFILES
# https://nickgerace.dev

MAKEPATH:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
CURRENT:=$(MAKEPATH)/current

install:
	cp $(CURRENT)/.zshrc $(HOME)/
	cp $(CURRENT)/.tmux.conf $(HOME)/
	cp $(CURRENT)/.vimrc $(HOME)/
	-mkdir -p $(HOME)/.config/Code/User/
	cp $(CURRENT)/settings.json $(HOME)/.config/Code/User/
	-mkdir -p $(HOME)/.oh-my-zsh/themes/
	cp $(CURRENT)/nickgerace.zsh-theme $(HOME)/.oh-my-zsh/themes/
	@printf "\nNow, install oh-my-zsh: https://ohmyz.sh/\n"

push:
	-cp $(HOME)/.zshrc $(CURRENT)/
	-cp $(HOME)/.tmux.conf $(CURRENT)/
	-cp $(HOME)/.vimrc $(CURRENT)/
	-cp $(HOME)/.config/Code/User/settings.json $(CURRENT)/
	-cp $(HOME)/.oh-my-zsh/themes/nickgerace.zsh-theme $(CURRENT)/

cargo:
	cargo install exa ripgrep fd-find bat
	cargo install --git https://github.com/nickgerace/gfold
	@printf "Should probably publish gfold to crates.io at some point...\n"

.PHONY: neovim
neovim:
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	nvim +PlugInstall +qall
	nvim +"CocInstall coc-rust-analyzer" +qall

dnf:
	sudo dnf check-update
	sudo dnf install \
		fish \
		zsh \
		tree \
		cloc \
		speedtest-cli \
		llvm \
		llvm-dev \
		wget \
		curl \
		make \
		tmux \
		vim \
		neovim \
		nvme-cli \
		neofetch \
		aspell \
		htop \
		fwupd \
		efibootmgr \
		git \
		openssl-devel \
		zlib-devel \
		@development-tools \
		util-linux-user 
	sudo dnf install \
		https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
		https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
	sudo dnf check-update
	sudo dnf groupupdate Multimedia
	sudo dnf autoremove
	@printf "\nInstall the following...\n\
		oh-my-zsh\n\
		docker\n\
		kind\n\
		kubectl\n\
		helm\n\
		go\n\
		rust (rustup)\n\
		\n"

apt:
	sudo apt update
	sudo apt install \
		libssl-dev \
		build-essential \
		ubuntu-restricted-extras
	sudo apt upgrade
	sudo apt autoremove

