#!/bin/sh

. ../config.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://emacs-w3m.namazu.org/emacs-w3m-1.3.2.tar.gz'
WRKSRC=${WRKDIR}/emacs-w3m-1.3.2
ELC_SHAREABLE=true
EMACSEN='emacs-21.2'

. ../target.sh

build-emacs () {
    (cd ${WRKSRC}; \
	./configure --prefix=${BASEDIR} \
	            --with-icondir=${BASEDIR}/share/emacs-w3m \
	            --with-emacs=${BASEDIR}/${emacs_ver}/bin/emacs)
    (cd ${WRKSRC}; ${GMAKE})
}

install-emacs () {
    (cd ${WRKSRC}; ${GMAKE} install install-icons)
}

init
eval $1
