#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/01 23:32:06 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://www.haskell.org/happy/dist/1.13/happy-1.13-src.tar.gz'
WRKSRC="${WRKDIR}/happy-1.13"
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
