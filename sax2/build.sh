#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/22 11:23:02 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://us.dl.sourceforge.net/sax/sax2r2.jar'
WRKSRC="${WRKDIR}/sax2.0.1"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

build_target () {
    : targets for non-Emacsen ports
    (cd ${WRKDIR}; jar xvf sax2r2.jar)
}

install_target () {
    : install targets for non-Emacsen ports
    install_java sax-2.0.1 sax2
}

init
eval $1
