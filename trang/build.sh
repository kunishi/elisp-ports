#!/bin/sh
# $Id: build.sh,v 1.2 2003/06/23 01:34:33 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.thaiopensource.com/download/trang-20030619.zip'
WRKSRC="${WRKDIR}/trang-20030619"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

build_target () {
    : targets for non-Emacsen ports
}

install_target () {
    : install targets for non-Emacsen ports
    install_java trang-20030619 trang
}

init
eval $1
