#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.kanji.zinbun.kyoto-u.ac.jp/~tomo/lemi/dist/flim/flim-1.14/flim-1.14.6.tar.gz'
WRKSRC="${WRKDIR}/flim-1.14.6"
USE_EMACS=true
ELC_SHAREABLE=false

build_emacs () {
    (cd ${WRKSRC}; make EMACS=${emacs} LISPDIR=${SITELISPDIR} VERSION_SPECIFIC_LISPDIR=${VERSION_SPECIFIC_SITELISPDIR} elc)
}

install_emacs () {
    (cd ${WRKSRC}; make EMACS=${emacs} LISPDIR=${SITELISPDIR} VERSION_SPECIFIC_LISPDIR=${VERSION_SPECIFIC_SITELISPDIR} install)
}

init
eval $1
