#!/bin/sh
# $Id: build.sh,v 1.1 2003/07/04 07:44:39 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.ocaml-programming.de/packages/pxp-1.1.94.tar.gz'
WRKSRC="${WRKDIR}/pxp-1.1.94"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

build_target () {
    : targets for non-Emacsen ports
    (cd ${WRKSRC}; ./configure && ${GMAKE} all opt)
}

install_target () {
    : install targets for non-Emacsen ports
}

init
eval $1
