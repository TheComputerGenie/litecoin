#!/bin/bash
# LTC & 3P Coins build script for Ubuntu & Debian (c) Decker
HOST=$(depends/config.guess)

make -C ${PWD}/depends v=1 NO_PROTON=1 HOST=${HOST} -j8

./autogen.sh

CXXFLAGS="-g0 -O2" \
CONFIG_SITE="$PWD/depends/${HOST}/share/config.site" ./configure --disable-tests --disable-bench --without-miniupnpc --enable-experimental-asm --with-gui=yes --disable-bip70

make V=1 -j8
