#!/bin/sh
# $Id: build.sh,v 1.1 2003/07/04 07:25:59 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://us.dl.sourceforge.net/ocamlnet/ocamlnet-0.96.tar.gz'
WRKSRC="${WRKDIR}/ocamlnet-0.96/src"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

. ../target.sh

build_target () {
    : targets for non-Emacsen ports
    (cd ${WRKSRC}; ./configure && ${GMAKE} all opt)
}

install_target () {
    : install targets for non-Emacsen ports
    (cd ${WRKSRC}; ${GMAKE} uninstall install)
}

init
eval $1
