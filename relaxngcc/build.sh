#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/02 03:52:47 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://us.dl.sourceforge.net/relaxngcc/relaxngcc-20021023.zip'
WRKSRC="${WRKDIR}/relaxngcc-20021023"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

. ../target.sh

build_target () {
    : targets for non-Emacsen ports
}

install_target () {
    : install targets for non-Emacsen ports
    install_java relaxngcc-20021023 relaxngcc
}

init
eval $1
