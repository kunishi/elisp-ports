#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.menteith.com/tdtd/data/tdtd071.zip'
WRKSRC=${WRKDIR}
USE_EMACS=true
ELC_SHAREABLE=true

build_emacs () {
:
}

install_emacs () {
    local sitelispdir=${SITELISPDIR}/tdtd
    mkdir -p ${sitelispdir}
    cp -p ${WRKSRC}/*.el ${sitelispdir}
}

init
eval $1
