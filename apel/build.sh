#!/bin/sh

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='ftp://ftp.m17n.org/pub/mule/apel/apel-10.6.tar.gz'
WRKSRC="${WRKDIR}/apel-10.6"
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
