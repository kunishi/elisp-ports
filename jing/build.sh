#!/bin/sh
# $Id: build.sh,v 1.2 2003/06/23 01:32:59 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://www.thaiopensource.com/download/jing-20030619.zip'
WRKSRC="${WRKDIR}/jing-20030619"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

. ../target.sh

build_target () {
    : targets for non-Emacsen ports
}

install_target () {
    : install targets for non-Emacsen ports
    install_java jing-20030619 jing
}

init
eval $1
