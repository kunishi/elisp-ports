#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www2u.biglobe.ne.jp/~hsaka/w3m/patch/w3m-0.4.1-m17n-20030308.tar.gz'
WRKSRC="${WRKDIR}/w3m-0.4.1-m17n-20030308"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

build_target () {
    : targets for non-Emacsen ports
    (cd ${WRKSRC};\
	./configure --nonstop --lang=JA --model=monster --charset=EUC-JP)
    (cd ${WRKSRC}; make)
}

install_target () {
    : install targets for non-Emacsen ports
    (cd ${WRKSRC}; make install)
}

init
eval $1
