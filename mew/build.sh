#!/bin/sh

. ../config.sh

PKG_TOPDIR=`pwd`

DISTFILES='ftp://ftp.mew.org/pub/Mew/beta/mew-3.0.71.tar.gz'
WRKSRC=${WRKDIR}/mew-3.0.71
ELC_SHAREABLE=true
EMACS_BUILD_TARGET=''
EMACS_INSTALL_TARGET='install install-info install-jinfo install-etc'

. ../target.sh

build_emacs () {
    (cd ${WRKSRC}; make emacs=${emacs} ${EMACS_BUILD_TARGET})
}

install_emacs () {
    (cd ${WRKSRC}; make emacs=${emacs} prefix=${BASEDIR} ${EMACS_INSTALL_TARGET})
}

init
eval $1
