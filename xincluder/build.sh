#!/bin/sh
# $Id: build.sh,v 1.1 2003/07/02 00:28:21 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='ftp://ftp.ibiblio.org/pub/languages/java/javafaq/xincluder-1.0d11.tar.gz'
WRKSRC="${WRKDIR}/xincluder"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

build_target () {
    : targets for non-Emacsen ports
}

install_target () {
    : install targets for non-Emacsen ports
    install_java xincluder-1.0d11 xincluder
}

init
eval $1
