#!/bin/sh

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='ftp://ftp.m17n.org/pub/mule/flim/flim-1.14/flim-1.14.4.tar.gz'
WRKSRC=${WRKDIR}/flim-1.14.4
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
