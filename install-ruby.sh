#!/bin/bash

MAKEOPTS='-j5' RUBY_CONFIGURE_OPTS='--enable-shared --disable-install-rdoc' rbenv install --verbose $1
