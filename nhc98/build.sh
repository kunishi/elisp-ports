#!/bin/sh
# $Id: build.sh,v 1.2 2003/07/05 04:58:13 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='ftp://ftp.cs.york.ac.uk/pub/haskell/nhc98/nhc98src-1.16.tar.gz'
WRKSRC="${WRKDIR}/nhc98-1.16"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

build_target () {
    : targets for non-Emacsen ports
    (cd ${WRKSRC}; ./configure --buildwith=gcc)
    (cd ${WRKSRC}; ${GMAKE})
}

install_target () {
    : install targets for non-Emacsen ports
    (cd ${WRKSRC}; ${GMAKE} install)
}

init
eval $1
