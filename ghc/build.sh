#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/03 11:35:26 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://www.haskell.org/ghc/dist/6.0/ghc-6.0-src.tar.bz2'
WRKSRC="${WRKDIR}/ghc-6.0"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

. ../target.sh

build_target () {
    : targets for non-Emacsen ports
    (cd ${WRKSRC}; ./configure)
    (cd ${WRKSRC}; make)
}

install_target () {
    : install targets for non-Emacsen ports
    (cd ${WRKSRC}; make install)
}

init
eval $1
