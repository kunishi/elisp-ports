#!/bin/sh

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://www.menteith.com/tdtd/data/tdtd071.zip'
WRKSRC=${WRKDIR}
USE_EMACS=true
ELC_SHAREABLE=true

. ../target.sh

build_emacs () {
:
}

install_emacs () {
    local sitelispdir=${BASEDIR}/share/emacs/site-lisp/tdtd
    mkdir -p ${sitelispdir}
    cp -p ${WRKSRC}/*.el ${sitelispdir}
}

init
eval $1
