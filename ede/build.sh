#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://us.dl.sourceforge.net/cedet/EDE-1.0.beta2.tar.gz'
WRKSRC="${WRKDIR}/EDE-1.0.beta2"
USE_EMACS=true
ELC_SHAREABLE=true

build_emacs () {
    (cd ${WRKSRC}; ${GMAKE} EMACS=${emacs})
}

install_emacs () {
    local sitelispdir=${SITELISPDIR}/ede
    mkdir -p ${sitelispdir}
    cp -p ${WRKSRC}/*.el ${WRKSRC}/*.elc ${sitelispdir}
    cp -p ${WRKSRC}/ede.info* ${INFODIR}
    install-info ${INFODIR}/ede.info ${INFODIR}/dir
}

init
eval $1
