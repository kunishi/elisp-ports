#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/26 05:05:17 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.apache.org/~andyc/neko/nekoxni-latest.tar.gz'
WRKSRC="${WRKDIR}/nekoxni-2003.09.30"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

build_target () {
    : targets for non-Emacsen ports
}

install_target () {
    : install targets for non-Emacsen ports
    install_java nekoxni-2003.09.30
}

init
eval $1
