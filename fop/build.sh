#!/bin/sh
# $Id: build.sh,v 1.2 2003/06/02 03:07:27 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://xml.apache.org/dist/fop/fop-0.20.5-bin.tar.gz'
WRKSRC="${WRKDIR}/fop-0.20.5"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

. ../target.sh

build_target () {
    : targets for non-Emacsen ports
}

install_target () {
    : install targets for non-Emacsen ports
    install_java fop-0.20.5 fop
}

init
eval $1
