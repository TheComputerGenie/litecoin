# AnyCoin compile script (q) Decker, 2021-2022
make clean
make -C ${PWD}/depends v=1 NO_PROTON=1 NO_QT=1 HOST=$(depends/config.guess) -j10

./autogen.sh

CXXFLAGS="-g0 -O2" \
CONFIG_SITE="$PWD/depends/$(depends/config.guess)/share/config.site" ./configure --disable-tests --disable-bench --without-miniupnpc --enable-experimental-asm --with-gui=yes --disable-bip70

make V=1 -j10
