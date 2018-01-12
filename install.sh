#!/bin/bash

for f in _*; do
  ln -sf "$PWD/$f" "$HOME/${f/_/.}"
done

BIN_DIR=$HOME/bin
mkdir -p $BIN_DIR
ln -sf "$PWD/install-ruby.sh" $BIN_DIR

RBENV_DIR=$HOME/.rbenv
mkdir -p $RBENV_DIR
ln -sf "$PWD/default-gems" $RBENV_DIR

NEOVIM_DIR=$HOME/.config/nvim
mkdir -p $NEOVIM_DIR
ln -sf "$PWD/nvim/init.vim" $NEOVIM_DIR
ln -sf "$PWD/nvim/plugins.toml" $NEOVIM_DIR
