#!/bin/sh

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://emacs-w3m.namazu.org/emacs-w3m-1.3.3.tar.gz'
WRKSRC="${WRKDIR}/emacs-w3m-1.3.3"
USE_EMACS=true
ELC_SHAREABLE=true

. ../target.sh

build_emacs () {
    (cd ${WRKSRC}; \
	./configure --prefix=${BASEDIR} \
	            --with-icondir=${BASEDIR}/share/emacs-w3m \
	            --with-emacs=${emacs})
    (cd ${WRKSRC}; ${GMAKE})
}

install_emacs () {
    (cd ${WRKSRC}; ${GMAKE} install install-icons)
}

init
eval $1
