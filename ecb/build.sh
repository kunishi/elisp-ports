#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://us.dl.sourceforge.net/ecb/ecb-2.26.tar.gz'
WRKSRC=${WRKDIR}/ecb-2.26
USE_EMACS=true
ELC_SHAREABLE=true

build_emacs () {
    (cd ${WRKSRC}; ${GMAKE} all EMACS=${emacs} CEDET="" \
	LOADPATH="${SITELISPDIR}/eieio ${SITELISPDIR}/semantic ${SITELISPDIR}/jde/lisp")
}

install_emacs () {
    local sitelispdir=${SITELISPDIR}/ecb
    mkdir -p ${sitelispdir}
    cp -p ${WRKSRC}/*.el ${WRKSRC}/*.elc ${sitelispdir}
    cp -p ${WRKSRC}/info-help/ecb.info* ${INFODIR}
    ${INSTALL_INFO} ${INFODIR}/ecb.info ${INFODIR}/dir
}

init
eval $1
