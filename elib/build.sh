#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='ftp://ftp.gnu.org/pub/gnu/emacs/elib-1.0.tar.gz'
WRKSRC="${WRKDIR}/elib-1.0"
USE_EMACS=true
ELC_SHAREABLE=true

build_emacs () {
    (cd ${WRKSRC}; make EMACS=${emacs} prefix=${EMACS_PREFIX})
}

install_emacs () {
    (cd ${WRKSRC}; make EMACS=${emacs} prefix=${EMACS_PREFIX} install)
}

init
eval $1
