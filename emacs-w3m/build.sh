#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://emacs-w3m.namazu.org/emacs-w3m-1.4.4.tar.gz'
WRKSRC="${WRKDIR}/emacs-w3m-1.4.4"
USE_EMACS=true
ELC_SHAREABLE=true

build_emacs () {
    (cd ${WRKSRC}; \
	./configure --prefix=${EMACS_PREFIX} \
	            --with-icondir=${EMACS_ETCDIR}/w3m \
	            --with-emacs=${emacs} \
		    --with-lispdir=${SITELISPDIR}/w3m \
		    --infodir=${INFODIR})
    (cd ${WRKSRC}; ${GMAKE})
}

install_emacs () {
    (cd ${WRKSRC}; ${GMAKE} install install-icons)
}

install_init () {
    [ ! -d ${EMACS_INIT_D} ] && mkdir -p ${EMACS_INIT_D}
    cp -p dotemacs.el ${EMACS_INIT_D}/emacs-w3m-init.el
}

init
eval $1
