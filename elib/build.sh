#!/bin/sh

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='ftp://ftp.gnu.org/pub/gnu/emacs/elib-1.0.tar.gz'
WRKSRC=${WRKDIR}/elib-1.0
ELC_SHAREABLE=true

. ../target.sh

build_emacs () {
    (cd ${WRKSRC}; make EMACS=${emacs} prefix=${BASEDIR})
}

install_emacs () {
    (cd ${WRKSRC}; make EMACS=${emacs} prefix=${BASEDIR} install)
}

init
eval $1
