#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/30 09:03:15 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://www.xmloperator.net/xmloperator_2_2_1.zip http://www.xmloperator.net/xx_2_2_1.zip'
WRKSRC="${WRKDIR}"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

. ../target.sh

build_target () {
    : targets for non-Emacsen ports
}

install_target () {
    : install targets for non-Emacsen ports
    install_java xmloperator-2.2.1 xmloperator
}

init
eval $1
