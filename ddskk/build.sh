#!/bin/sh

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://openlab.ring.gr.jp/skk/maintrunk/ddskk-12.2.0.tar.gz'
WRKSRC="${WRKDIR}/ddskk-12.2.0"
USE_EMACS=true
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
