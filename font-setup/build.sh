#!/bin/sh
# $Id: build.sh.sample,v 1.4 2003/05/31 07:07:09 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.fan.gr.jp/~ring/doc/misc/font-setup.el'
WRKSRC="${WRKDIR}"
USE_EMACS=true
ELC_SHAREABLE=true

build_emacs () {
    : write how to build package
}

install_emacs () {
    : write how to install package
    cp -p ${WRKSRC}/font-setup.el ${SITELISPDIR}
}

install_init () {
    [ ! -d ${EMACS_INIT_D} ] && mkdir -p ${EMACS_INIT_D}
    cp -p dotemacs.el ${EMACS_INIT_D}/font-setup-init.el
}

init
eval $1
