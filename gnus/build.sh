#!/bin/sh

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://quimby.gnus.org/gnus/dist/ognus-0.14.tar.gz'
WRKSRC=${WRKDIR}/ognus-0.14
ELC_SHAREABLE=true

. ../target.sh

build_emacs () {
    (cd ${WRKSRC}; ./configure --prefix=${BASEDIR} --with-emacs=${emacs})
    (cd ${WRKSRC}; ${GMAKE})
}

install_emacs () {
    (cd ${WRKSRC}; ${GMAKE} install)
}

init
eval $1
