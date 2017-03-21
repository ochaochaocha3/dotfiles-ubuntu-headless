#!/bin/bash

MAKEOPTS='-j4' RUBY_CONFIGURE_OPTS='--enable-shared --disable-install-rdoc' rbenv install --verbose $1
