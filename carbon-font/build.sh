#!/bin/sh
# $Id: build.sh.sample,v 1.4 2003/05/31 07:07:09 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://macemacsjp.sourceforge.jp/downloads/elips/carbon-font.el'
WRKSRC="${WRKDIR}"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=true
ELC_SHAREABLE=true

build_emacs () {
    : write how to build package
}

install_emacs () {
    : write how to install package
    [ ! -d ${EMACS_INIT_D} ] && mkdir -p ${EMACS_INIT_D}
    cp -p ${WRKSRC}/carbon-font.el ${EMACS_INIT_D}
    cp -p dotemacs.el ${EMACS_INIT_D}/carbon-font-init.el
}

init
eval $1
