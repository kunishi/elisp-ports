#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/12 04:41:24 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://us.dl.sourceforge.net/relaxng/relaxngDatatype-1.0.zip'
WRKSRC="${WRKDIR}/relaxngDatatype-1.0"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

. ../target.sh

build_target () {
    : targets for non-Emacsen ports
}

install_target () {
    : install targets for non-Emacsen ports
    install_java relaxngDatatype-1.0 relaxngDatatype
}

init
eval $1
