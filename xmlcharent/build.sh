#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/12 05:20:40 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.oasis-open.org/docbook/xmlcharent/0.3/xmlcharent-0.3.zip'
WRKSRC="${WRKDIR}"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

build_target () {
    : targets for non-Emacsen ports
}

install_target () {
    : install targets for non-Emacsen ports
    install_xml xmlcharent-0.3
}

init
eval $1
