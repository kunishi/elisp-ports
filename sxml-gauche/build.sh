#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/21 16:43:03 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://us.dl.sourceforge.net/gauche/SXML-gauche-0.9.tgz'
WRKSRC="${WRKDIR}/SXML-gauche-0.9"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

. ../target.sh

build_target () {
    : targets for non-Emacsen ports
    (cd ${WRKSRC}; ./configure && make && make test)
}

install_target () {
    : install targets for non-Emacsen ports
    (cd ${WRKSRC}; make install)
}

init
eval $1
