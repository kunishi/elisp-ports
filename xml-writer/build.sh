#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/22 11:06:20 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.megginson.com/Software/xml-writer-0.2.zip'
WRKSRC="${WRKDIR}/xml-writer-0.2"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

build_target () {
    : targets for non-Emacsen ports
}

install_target () {
    : install targets for non-Emacsen ports
    install_java xml-writer-0.2 xml-writer
}

init
eval $1
