#!/bin/sh
# $Id: build.sh.sample,v 1.4 2003/05/31 07:07:09 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.pantor.com/RncMode-1_0b3.tgz'
WRKSRC="${WRKDIR}"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=true
ELC_SHAREABLE=true

build_emacs () {
    : write how to build package
    (cd ${WRKSRC}; \
        ${emacs} ${EMACS_COMPILE_ARGS} -f batch-byte-compile rnc-mode.el)
}

install_emacs () {
    : write how to install package
    cp -p ${WRKSRC}/*.el ${WRKSRC}/*.elc ${SITELISPDIR}
}

build_target () {
    : targets for non-Emacsen ports
}

install_target () {
    : install targets for non-Emacsen ports
}

init
eval $1
