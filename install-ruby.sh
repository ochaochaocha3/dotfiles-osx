#!/bin/bash

MAKEOPTS='-j13' RUBY_CONFIGURE_OPTS='--enable-shared' rbenv install --verbose $1
