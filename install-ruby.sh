#!/bin/bash

MAKEOPTS='-j9' RUBY_CONFIGURE_OPTS='--enable-shared' rbenv install --verbose $1
