#!/bin/sh

. ../config.sh

PKG_TOPDIR=`pwd`

DISTFILES='ftp://ftp.jpl.org/pub/elisp/x-face-1.3.6.20.tar.gz'
WRKSRC=${WRKDIR}/x-face-1.3.6.20
ELC_SHAREABLE=false
EMACSEN='emacs-20.7'

. ../target.sh

build-emacs () {
    (cd ${WRKSRC}; \
	make EMACS=${BASEDIR}/${emacs_ver}/bin/emacs all)
}

install-emacs () {
    (cd ${WRKSRC}; \
	make EMACS=${BASEDIR}/${emacs_ver}/bin/emacs \
	     LISPDIR=${BASEDIR}/share/emacs/${version_num}/site-lisp \
	     install)
}

init
eval $1
