#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/02 03:17:17 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.apache.org/dist/xml/batik/batik-1.5.1.zip'
WRKSRC="${WRKDIR}/batik-1.5.1"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

build_target () {
    : targets for non-Emacsen ports
}

install_target () {
    : install targets for non-Emacsen ports
    install_java batik-1.5.1 batik
}

init
eval $1
