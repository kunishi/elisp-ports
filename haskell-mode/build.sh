#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.haskell.org/haskell-mode/haskell-mode-1.44.tar.gz'
WRKSRC="${WRKDIR}/haskell-mode-1.44"
USE_EMACS=true
ELC_SHAREABLE=true

build_emacs () {
:
}

install_emacs () {
    local sitelispdir=${SITELISPDIR}/haskell-mode
    mkdir -p ${sitelispdir}
    cp -p ${WRKSRC}/*.el ${WRKSRC}/*.hs ${sitelispdir}
}

init
eval $1
