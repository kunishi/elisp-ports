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
    ${INSTALL_INFO} ${INFODIR}/semantic.info ${INFODIR}/dir
}

install_init () {
    [ ! -d ${EMACS_INIT_D} ] && mkdir -p ${EMACS_INIT_D}
    cp -p dotemacs.el ${EMACS_INIT_D}/semantic-init.el
}

init
eval $1
