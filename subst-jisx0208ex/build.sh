#!/bin/sh
# $Id: build.sh.sample,v 1.4 2003/05/31 07:07:09 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.nijino.com/ari/emacs/subst-jisx0208ex.el'
WRKSRC="${WRKDIR}"
USE_EMACS=true
ELC_SHAREABLE=false

build_emacs () {
    : write how to build package
}

install_emacs () {
    cp -p ${WRKSRC}/subst-jisx0208ex.el ${SITELISPDIR}
}

install_init () {
    [ ! -d ${EMACS_INIT_D} ] && mkdir -p ${EMACS_INIT_D}
    cp -p dotemacs.el ${EMACS_INIT_D}/subst-jisx0208ex-init.el
}

init
eval $1
