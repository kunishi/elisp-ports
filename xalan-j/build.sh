#!/bin/sh
# $Id: build.sh,v 1.3 2003/06/05 09:22:04 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.apache.org/dist/xml/xalan-j/binaries/xalan-j_2_6_0-bin.zip'
WRKSRC="${WRKDIR}/xalan-j_2_6_0"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

build_target () {
    : targets for non-Emacsen ports
}

install_target () {
    : install targets for non-Emacsen ports
    install_java xalan-j-2.6.0 xalan-j
}

init
eval $1
