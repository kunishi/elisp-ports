#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/17 05:39:00 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://www.xmlconsortium.org/wg/contact/data/ContactXML_01_01a.zip'
WRKSRC="${WRKDIR}"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

. ../target.sh

build_target () {
    : targets for non-Emacsen ports
}

install_target () {
    : install targets for non-Emacsen ports
    install_xml ContactXML-1.1a ContactXML
}

init
eval $1
