#!/bin/sh
# $Id: build.sh.sample,v 1.4 2003/05/31 07:07:09 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.thaiopensource.com/download/nxml-mode-20030915.tar.gz'
WRKSRC="${WRKDIR}/nxml-mode-20030915"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=true
ELC_SHAREABLE=true

build_emacs () {
    : write how to build package
    (cd ${WRKSRC}; make EMACS=${emacs})
}

install_emacs () {
    : write how to install package
    mkdir -p ${SITELISPDIR}/nxml-mode
    cp -p ${WRKSRC}/*.el ${WRKSRC}/*.elc ${SITELISPDIR}/nxml-mode
    (cd ${WRKSRC}; \
      cp -p COPYING NEWS README TODO TUTORIAL VERSION ${SITELISPDIR}/nxml-mode)
    cp -rp ${WRKSRC}/schema ${SITELISPDIR}/nxml-mode
}

build_target () {
    : targets for non-Emacsen ports
}

install_target () {
    : install targets for non-Emacsen ports
}

install_init () {
    [ ! -d ${EMACS_INIT_D} ] && mkdir -p ${EMACS_INIT_D}
    cp -p dotemacs.el ${EMACS_INIT_D}/nxml-mode-init.el
}

init
eval $1