#!/bin/sh
# $Id: build.sh,v 1.1 2003/07/04 05:51:41 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.ocaml-programming.de/packages/findlib-0.8.1.tar.gz'
WRKSRC="${WRKDIR}/findlib-0.8.1"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

build_target () {
    : targets for non-Emacsen ports
    (cd ${WRKSRC}; ./configure && ${GMAKE} all opt)
}

install_target () {
    : install targets for non-Emacsen ports
    (cd ${WRKSRC}; ${GMAKE} install)
}

init
eval $1
