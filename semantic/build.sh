#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://telia.dl.sourceforge.net/cedet/semantic-1.4.4.tar.gz'
WRKSRC="${WRKDIR}/semantic-1.4.4"
USE_EMACS=true
ELC_SHAREABLE=true

build_emacs () {
    (cd ${WRKSRC}; ${GMAKE} EMACS=${emacs})
}

install_emacs () {
    local sitelispdir=${SITELISPDIR}/semantic
    mkdir -p ${sitelispdir}
    cp -p ${WRKSRC}/*.el ${WRKSRC}/*.elc ${WRKSRC}/*.bnf ${sitelispdir}
    cp -p ${WRKSRC}/semantic.info* ${INFODIR}
    install-info ${INFODIR}/semantic.info ${INFODIR}/dir
}

init
eval $1
