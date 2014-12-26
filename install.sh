#!/bin/bash

for f in _*; do
  ln -sf "`pwd`/$f" "$HOME/${f/_/.}"
done

BIN_DIR=$HOME/bin
mkdir -p $BIN_DIR
ln -sf "`pwd`/install-ruby.sh" $BIN_DIR

RBENV_DIR=$HOME/.rbenv
mkdir -p $RBENV_DIR
ln -sf "`pwd`/default-gems" $RBENV_DIR
