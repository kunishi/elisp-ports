#!/bin/sh

. ../config.sh

PKG_TOPDIR=`pwd`

DISTFILES='ftp://ftp.jpl.org/pub/elisp/x-face-1.3.6.20.tar.gz'
WRKSRC=${WRKDIR}/x-face-1.3.6.20
ELC_SHAREABLE=false

. ../target.sh

build_emacs () {
    (cd ${WRKSRC}; make EMACS=${emacs} all)
}

install_emacs () {
    (cd ${WRKSRC}; \
	make EMACS=${emacs} \
	     LISPDIR=${BASEDIR}/share/emacs/${version_num}/site-lisp \
	     install)
}

init
eval $1
