#!/bin/sh

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://www.kanji.zinbun.kyoto-u.ac.jp/~tomo/lemi/dist/flim/flim-1.14/flim-1.14.5.tar.gz'
WRKSRC=${WRKDIR}/flim-1.14.5
ELC_SHAREABLE=false

. ../target.sh

build_emacs () {
    (cd ${WRKSRC}; make EMACS=${emacs} elc)
}

install_emacs () {
    (cd ${WRKSRC}; make EMACS=${emacs} install)
}

init
eval $1
