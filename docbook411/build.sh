#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/12 03:58:15 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://www.oasis-open.org/docbook/xml/4.1.1/docbkx411.zip'
WRKSRC="${WRKDIR}"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

. ../target.sh

build_target () {
    : targets for non-Emacsen ports
    cp ${PKG_TOPDIR}/docbook411.catalog.xml ${WRKSRC}
}

install_target () {
    : install targets for non-Emacsen ports
    install_xml docbook-4.1.1
}

init
eval $1
