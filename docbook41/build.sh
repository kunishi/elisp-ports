#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/12 02:55:52 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://www.oasis-open.org/docbook/xml/4.1/docbkx41.zip'
WRKSRC="${WRKDIR}"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

. ../target.sh

build_target () {
    : targets for non-Emacsen ports
    cp -p ${PKG_TOPDIR}/docbook41.catalog.xml ${WRKSRC}
}

install_target () {
    : install targets for non-Emacsen ports
    install_xml docbook-4.1
}

init
eval $1
