#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/01 14:59:33 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://cvs.haskell.org/Hugs/downloads/Nov2002/hugs98-Nov2002.tar.gz'
WRKSRC="${WRKDIR}/hugs98-Nov2002"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

. ../target.sh

build_target () {
    : targets for non-Emacsen ports
    (cd ${WRKSRC}/src/unix; ./configure)
    (cd ${WRKSRC}/src; make)
}

install_target () {
    : install targets for non-Emacsen ports
    (cd ${WRKSRC}/src; make install)
}

init
eval $1
