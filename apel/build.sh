#!/bin/sh

. ../config.sh

PKG_TOPDIR=`pwd`

DISTFILES='ftp://ftp.m17n.org/pub/mule/apel/apel-10.3.tar.gz'
WRKSRC=${WRKDIR}/apel-10.3
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
