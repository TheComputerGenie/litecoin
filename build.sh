# from multiple sources and scripts (mostly from DeckerSU)
HOST=$(depends/config.guess)
buildEMC2() {

	make -C ${PWD}/depends v=1 NO_QT=0 HOST=$(depends/config.guess) -j10

	./autogen.sh

	CXXFLAGS="-g0 -O2" \
	CONFIG_SITE="$PWD/depends/$(depends/config.guess)/share/config.site"

	./configure LDFLAGS="-L$PWD/depends/$HOST/lib/" CPPFLAGS="-I$PWD/depends/$HOST/include/" --with-gui=yes --disable-tests --disable-bench --without-miniupnpc --enable-experimental-asm --enable-static --disable-shared
    make -j$(nproc)
}

buildEMC2
echo "Done building EMC2!"
