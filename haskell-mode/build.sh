#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www-perso.iro.umontreal.ca/~monnier/elisp/haskell-mode-2.1.tar.gz'
WRKSRC="${WRKDIR}/haskell-mode-2.1"
USE_EMACS=true
ELC_SHAREABLE=true

build_emacs () {
    (cd ${WRKSRC}; make EMACS=${emacs})
}

install_emacs () {
    local sitelispdir=${SITELISPDIR}/haskell-mode
    mkdir -p ${sitelispdir}
    cp -p ${WRKSRC}/*.el ${WRKSRC}/*.elc ${WRKSRC}/*.hs ${sitelispdir}
}

install_init () {
    [ ! -d ${EMACS_INIT_D} ] && mkdir -p ${EMACS_INIT_D}
    cp -p dotemacs.el ${EMACS_INIT_D}/haskell-mode-init.el
}

init
eval $1
