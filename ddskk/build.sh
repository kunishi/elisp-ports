#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://openlab.ring.gr.jp/skk/maintrunk/ddskk-12.2.0.tar.gz'
WRKSRC="${WRKDIR}/ddskk-12.2.0"
USE_EMACS=true
ELC_SHAREABLE=false

build_emacs () {
    (cd ${WRKSRC}; make EMACS=${emacs} LISPDIR=${SITELISPDIR} VERSION_SPECIFIC_LISPDIR=${VERSION_SPECIFIC_SITELISPDIR} INFODIR=${INFODIR} elc)
}

install_emacs () {
    (cd ${WRKSRC}; make EMACS=${emacs} LISPDIR=${SITELISPDIR} VERSION_SPECIFIC_LISPDIR=${VERSION_SPECIFIC_SITELISPDIR} INFODIR=${INFODIR} install)
}

init
eval $1
