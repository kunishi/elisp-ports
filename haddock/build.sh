#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/01 23:49:25 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://www.haskell.org/haddock/haddock-0.4-src.tar.gz'
WRKSRC="${WRKDIR}/haddock-0.4"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

. ../target.sh

build_target () {
    : targets for non-Emacsen ports
    (cd ${WRKSRC}; ./configure && make)
}

install_target () {
    : install targets for non-Emacsen ports
    (cd ${WRKSRC}; make install)
}

init
eval $1
