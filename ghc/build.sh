#!/bin/sh
# $Id: build.sh,v 1.2 2003/06/09 12:01:39 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.haskell.org/ghc/dist/6.0/ghc-6.0-src.tar.bz2'
WRKSRC="${WRKDIR}/ghc-6.0"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

build_target () {
    : targets for non-Emacsen ports
    (cd ${WRKSRC}; ./configure)
    (cd ${WRKSRC}; ${GMAKE})
}

install_target () {
    : install targets for non-Emacsen ports
    (cd ${WRKSRC}; ${GMAKE} install)
}

init
eval $1
