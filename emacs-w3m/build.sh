#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://emacs-w3m.namazu.org/emacs-w3m-1.3.6.tar.gz'
WRKSRC="${WRKDIR}/emacs-w3m-1.3.6"
USE_EMACS=true
ELC_SHAREABLE=true

build_emacs () {
    (cd ${WRKSRC}; \
	./configure --prefix=${EMACS_PREFIX} \
	            --with-icondir=${EMACS_PREFIX}/share/emacs-w3m \
	            --with-emacs=${emacs})
    (cd ${WRKSRC}; ${GMAKE})
}

install_emacs () {
    (cd ${WRKSRC}; ${GMAKE} install install-icons)
}

init
eval $1
