#!/bin/sh
# $Id: build.sh.sample,v 1.4 2003/05/31 07:07:09 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES=${PKG_TOPDIR}/commonlib.el
WRKSRC="${WRKDIR}"
USE_EMACS=true
ELC_SHAREABLE=true

fetch () {
:
}

extract () {
    mkdir -p ${WRKSRC}
    cp -p ${DISTFILES} ${WRKSRC}
}

build_emacs () {
    : write how to build package
}

install_emacs () {
    : write how to install package
    [ ! -d ${EMACS_INIT_D} ] && mkdir -p ${EMACS_INIT_D}
    cp -p ${WRKSRC}/commonlib.el ${EMACS_INIT_D}
}

init
eval $1
