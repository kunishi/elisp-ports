#!/bin/sh
# $Id: build.sh,v 1.2 2003/06/02 03:10:49 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://xml.apache.org/dist/xerces-j/Xerces-J-bin.2.5.0.zip'
WRKSRC="${WRKDIR}/xerces-2_5_0"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

build_target () {
    : targets for non-Emacsen ports
}

install_target () {
    : install targets for non-Emacsen ports
    install_java xerces-j-2.5.0 xerces-j
}

init
eval $1
