#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/02 03:30:05 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.apache.org/dist/jakarta/regexp/jakarta-regexp-1.2.zip'
WRKSRC="${WRKDIR}"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

build_target () {
    : targets for non-Emacsen ports
}

install_target () {
    : install targets for non-Emacsen ports
    install_java jakarta-regexp-1.2 jakarta-regexp
}

init
eval $1
