#!/bin/sh

. ../config.sh

PKG_TOPDIR=`pwd`

DISTFILES='ftp://ftp.gnu.org/pub/emacs/elib-1.0.tar.gz'
WRKSRC=${WRKDIR}/elib-1.0
ELC_SHAREABLE=true

. ../target.sh

build-emacs () {
    (cd ${WRKSRC}; make EMACS=${BASEDIR}/${emacs_ver}/bin/emacs)
}

install-emacs () {
    (cd ${WRKSRC}; make EMACS=${BASEDIR}/${emacs_ver}/bin/emacs install)
}

init
eval $1
