#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/11 03:34:30 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

# Real URL: http://wwws.sun.com/software/xml/developers/relaxngconverter/
DISTFILES='http://www.chorusroom.org/~kunishi/distfiles/rngconv.20030225.zip'
WRKSRC="${WRKDIR}/rngconv-20030225"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

build_target () {
    : targets for non-Emacsen ports
}

install_target () {
    : install targets for non-Emacsen ports
    install_java rngconv-20030225 rngconv
}

init
eval $1
