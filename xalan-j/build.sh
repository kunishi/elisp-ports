#!/bin/sh
# $Id: build.sh,v 1.2 2003/06/02 03:10:48 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://xml.apache.org/dist/xalan-j/xalan-j_2_5_0-bin.zip'
WRKSRC="${WRKDIR}/xalan-j_2_5_0"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

. ../target.sh

build_target () {
    : targets for non-Emacsen ports
}

install_target () {
    : install targets for non-Emacsen ports
    install_java xalan-j-2.5.0 xalan-j
}

init
eval $1
