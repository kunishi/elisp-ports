#!/bin/sh
# $Id: build.sh,v 1.2 2003/06/02 03:10:47 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://xml.apache.org/dist/crimson/crimson-1.1.3-bin.tar.gz'
WRKSRC="${WRKDIR}/crimson-1.1.3"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

. ../target.sh

build_target () {
    : targets for non-Emacsen ports
}

install_target () {
    : install targets for non-Emacsen ports
    install_java crimson-1.1.3 crimson
}

init
eval $1
