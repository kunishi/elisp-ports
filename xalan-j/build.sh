#!/bin/sh
# $Id: build.sh,v 1.3 2003/06/05 09:22:04 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://xml.apache.org/dist/xalan-j/xalan-j_2_5_1-bin.zip'
WRKSRC="${WRKDIR}/xalan-j_2_5_1"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

. ../target.sh

build_target () {
    : targets for non-Emacsen ports
}

install_target () {
    : install targets for non-Emacsen ports
    install_java xalan-j-2.5.1 xalan-j
}

init
eval $1
