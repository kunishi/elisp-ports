#!/bin/sh
# $Id: build.sh,v 1.1 2003/05/31 07:07:09 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://us.dl.sourceforge.net/gauche/Gauche-0.6.8.tgz'
WRKSRC="${WRKDIR}/Gauche-0.6.8"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

. ../target.sh

build_target () {
    : targets for non-Emacsen ports
    (cd ${WRKSRC}; ./configure --enable-threads=pthreads)
    (cd ${WRKSRC}; make)
    (cd ${WRKSRC}; make test)
}

install_target () {
    : install targets for non-Emacsen ports
    (cd ${WRKSRC}; make install install-doc)
}

init
eval $1
