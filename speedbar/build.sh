#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://us.dl.sourceforge.net/cedet/speedbar-0.14beta4.tar.gz'
WRKSRC="${WRKDIR}/speedbar-0.14beta4"
USE_EMACS=true
ELC_SHAREABLE=true

build_emacs () {
    (cd ${WRKSRC}; ${GMAKE} EMACS=${emacs})
}

install_emacs () {
    local sitelispdir=${SITELISPDIR}/speedbar
    mkdir -p ${sitelispdir}
    cp -p ${WRKSRC}/*.el ${WRKSRC}/*.elc ${WRKSRC}/*.xpm ${sitelispdir}
    cp -p ${WRKSRC}/speedbar.info ${INFODIR}
    install-info ${INFODIR}/speedbar.info ${INFODIR}/dir
}

init
eval $1
