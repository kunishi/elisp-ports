#!/bin/sh

. ../config.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.haskell.org/haskell-mode/haskell-mode-1.43.tar.gz'
WRKSRC=${WRKDIR}
ELC_SHAREABLE=true

. ../target.sh

build_emacs () {
:
}

install_emacs () {
    local sitelispdir=${BASEDIR}/share/emacs/site-lisp/haskell-mode
    mkdir -p ${sitelispdir}
    cp -p ${WRKSRC}/*.el ${WRKSRC}/*.hs ${sitelispdir}
}

init
eval $1
