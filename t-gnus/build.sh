#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.jpl.org/elips/t-gnus-6.15/snapshots/t-gnus-6_15_11-00-quimby.tar.gz'
WRKSRC="${WRKDIR}/t-gnus-6_15_11-00-quimby"
USE_EMACS=true
ELC_SHAREABLE=true

build_emacs () {
    (cd ${WRKSRC}; ./configure --prefix=${EMACS_PREFIX} --with-emacs=${emacs})
    (cd ${WRKSRC}; ${GMAKE})
}

install_emacs () {
    (cd ${WRKSRC}; ${GMAKE} install-lisp install-etc install-info-ja)
}

init
eval $1
