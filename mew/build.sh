#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='ftp://ftp.mew.org/pub/Mew/alpha/mew-4.0.57.tar.gz'
WRKSRC="${WRKDIR}/mew-4.0.57"
USE_EMACS=true
ELC_SHAREABLE=true
EMACS_BUILD_TARGET=''
EMACS_INSTALL_TARGET='install install-info install-jinfo install-etc'

build_emacs () {
    (cd ${WRKSRC}; make emacs=${emacs} ${EMACS_BUILD_TARGET})
}

install_emacs () {
    (cd ${WRKSRC}; make emacs=${emacs} prefix=${EMACS_PREFIX} ${EMACS_INSTALL_TARGET})
}

init
eval $1
