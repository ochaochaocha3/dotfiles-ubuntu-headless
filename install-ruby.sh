#!/bin/bash

MAKEOPTS='-j4' RUBY_CONFIGURE_OPTS='--enable-shared' rbenv install --verbose $1
