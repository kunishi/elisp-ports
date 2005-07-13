#!/bin/sh
# $Id: build.sh.sample,v 1.4 2003/05/31 07:07:09 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www-rocq.inria.fr/~acohen/tuareg/mode/tuareg-mode-1.45.0.tar.gz'
WRKSRC="${WRKDIR}/tuareg-mode-1.45.0"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=true
ELC_SHAREABLE=false
EMACSEN='emacs-20.7 emacs-22.0.50 emacs-21.2'

build_emacs () {
    : write how to build package
}

install_emacs () {
    local sitelispdir=${SITELISPDIR}/tuareg-mode
    mkdir -p ${sitelispdir}
    cp -p ${WRKSRC}/* ${sitelispdir}
}

install_init () {
    [ ! -d ${EMACS_INIT_D} ] && mkdir -p ${EMACS_INIT_D}
    cp -p dotemacs.el ${EMACS_INIT_D}/tuareg-mode-init.el
}

init
eval $1
