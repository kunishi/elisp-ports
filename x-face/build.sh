#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='ftp://ftp.jpl.org/pub/elisp/x-face-1.3.6.20.tar.gz'
WRKSRC="${WRKDIR}/x-face-1.3.6.20"
USE_EMACS=true
ELC_SHAREABLE=false

build_emacs () {
    (cd ${WRKSRC}; make EMACS=${emacs} all)
}

install_emacs () {
    (cd ${WRKSRC}; \
	make EMACS=${emacs} \
	     LISPDIR=${VERSION_SPECIFIC_SITELISPDIR} \
	     install)
}

init
eval $1
