# Setting Up a Linux Machine

Follow these steps (in order) to set up a macOS machine.

## Prepare OS

- Download all OS updates


## Install Homebrew

Navigate to [brew.sh](https://brew.sh) and install it.

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

After installation, you may need to execute `eval "$(/opt/homebrew/bin/brew shellenv)"` to get `brew` in your `PATH`.

Finally, install some base packages with `brew`:

```sh
brew install zsh gcc git bash make jq neovim vim curl wget
```

## Setup Dotfiles

Clone the [dotfiles](https://github.com/nickgerace/dotfiles) and get started with the `Makefile`.
Use `zsh` from `brew` as our default shell:

```sh
ZSH=$(command -v zsh)
echo ${ZSH} | sudo tee -a /etc/shells
chsh -s ${ZSH}
```

Now, install the previous `Brewfile`.

```sh
brew bundle install --no-lock --file $BJK_DOTFILES/linux/brewfile-linux.rb
```

## Setup Rust

Navigate to [rustup.sh](https://rustup.sh) and install it.
Add the following arguments to the installation script: `-s -- --no-modify-path -y`

With the dotfiles loaded and `zsh` as your shell, execute the loaded function: `rust-setup`

## Cargo Update

```
export LDFLAGS="-L/home/linuxbrew/.linuxbrew/opt/openssl@1.1/lib"
export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/openssl@1.1/include"
cargo install cargo-update
```