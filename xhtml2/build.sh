#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/11 10:03:34 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.w3.org/TR/2003/WD-xhtml2-20030506/xhtml2.tgz'
WRKSRC="${WRKDIR}/xhtml2-20030506"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

build_target () {
    : targets for non-Emacsen ports
}

install_target () {
    : install targets for non-Emacsen ports
    install_xml xhtml2-20030506 xhtml2
}

init
eval $1
