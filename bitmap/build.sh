#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='ftp://ftp.jpl.org/pub/elisp/bitmap/bitmap-mule-8.5.tar.gz'
WRKSRC="${WRKDIR}/bitmap-mule-8.5"
USE_EMACS=true
ELC_SHAREABLE=true

build_emacs () {
    (cd ${WRKSRC}; make EMACS=${emacs} LISPDIR=${SITELISPDIR} VERSION_SPECIFIC_LISPDIR=${VERSION_SPECIFIC_SITELISPDIR} elc)
}

install_emacs () {
    (cd ${WRKSRC}; make EMACS=${emacs} LISPDIR=${SITELISPDIR} VERSION_SPECIFIC_LISPDIR=${VERSION_SPECIFIC_SITELISPDIR} install)
}

init
eval $1
