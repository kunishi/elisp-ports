#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://us.dl.sourceforge.net/cedet/eieio-0.17.tar.gz'
WRKSRC="${WRKDIR}/eieio-0.17"
USE_EMACS=true
ELC_SHAREABLE=true

build_emacs () {
    (cd ${WRKSRC}; ${GMAKE} EMACS=${emacs})
}

install_emacs () {
    mkdir -p ${SITELISPDIR}/eieio
    cp -p ${WRKSRC}/*.el ${WRKSRC}/*.elc ${SITELISPDIR}/eieio
    cp -p ${WRKSRC}/eieio.info ${INFODIR}
    install-info ${INFODIR}/eieio.info ${INFODIR}/dir
}

init
eval $1
