#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/12 05:10:56 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://thaiopensource.com/relaxng/dtdinst/dtdinst.jar'
WRKSRC="${WRKDIR}"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

. ../target.sh

build_target () {
    : targets for non-Emacsen ports
}

install_target () {
    : install targets for non-Emacsen ports
    install_java dtdinst-20030122 dtdinst
}

init
eval $1
