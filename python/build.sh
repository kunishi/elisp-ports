#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/01 12:32:19 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://www.python.org/ftp/python/2.2.3/Python-2.2.3.tgz'
WRKSRC="${WRKDIR}/Python-2.2.3"
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
