#!/bin/sh

. ../config.sh

PKG_TOPDIR=`pwd`

DISTFILES='ftp://ftp.jpl.org/pub/elisp/bitmap-mule-8.5.tar.gz'
WRKSRC=${WRKDIR}/bitmap-mule-8.5
ELC_SHAREABLE=true

. ../target.sh

build-emacs () {
    (cd ${WRKSRC}; make EMACS=${BASEDIR}/${emacs_ver}/bin/emacs elc)
}

install-emacs () {
    (cd ${WRKSRC}; make EMACS=${BASEDIR}/${emacs_ver}/bin/emacs install)
}

init
eval $1
