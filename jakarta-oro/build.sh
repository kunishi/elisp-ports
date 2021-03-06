#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/02 03:26:50 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.apache.org/dist/jakarta/oro/jakarta-oro-2.0.8.zip'
WRKSRC="${WRKDIR}/jakarta-oro-2.0.8"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

build_target () {
    : targets for non-Emacsen ports
}

install_target () {
    : install targets for non-Emacsen ports
    install_java jakarta-oro-2.0.8 jakarta-oro
}

init
eval $1
