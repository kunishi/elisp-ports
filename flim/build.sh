#!/bin/sh

. ../config.sh

PKG_TOPDIR=`pwd`

DISTFILES='ftp://ftp.m17n.org/pub/mule/flim/flim-1.14.4.tar.gz'
WRKSRC=${WRKDIR}/flim-1.14.4
ELC_SHAREABLE=false

. ../target.sh

build-emacs () {
    (cd ${WRKSRC}; make EMACS=${BASEDIR}/${emacs_ver}/bin/emacs elc)
}

install-emacs () {
    (cd ${WRKSRC}; make EMACS=${BASEDIR}/${emacs_ver}/bin/emacs install)
}

init
eval $1
