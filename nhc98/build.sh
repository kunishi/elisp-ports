#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/01 22:45:34 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='ftp://ftp.cs.york.ac.uk/pub/haskell/nhc98/nhc98src-1.16.tar.gz'
WRKSRC="${WRKDIR}/nhc98-1.16"
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
