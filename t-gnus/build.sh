#!/bin/sh

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://www.jpl.org/elips/t-gnus-6.15/snapshots/t-gnus-6_15_8-05-quimby.tar.gz'
WRKSRC=${WRKDIR}/t-gnus-6_15_8-05-quimby
ELC_SHAREABLE=true

. ../target.sh

build_emacs () {
    (cd ${WRKSRC}; ./configure --prefix=${BASEDIR} --with-emacs=${emacs})
    (cd ${WRKSRC}; ${GMAKE})
}

install_emacs () {
    (cd ${WRKSRC}; ${GMAKE} install-lisp install-etc install-info-ja)
}

init
eval $1
