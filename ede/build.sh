#!/bin/sh

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://us.dl.sourceforge.net/cedet/EDE-1.0.beta2.tar.gz'
WRKSRC="${WRKDIR}/EDE-1.0.beta2"
USE_EMACS=true
ELC_SHAREABLE=true

. ../target.sh

build_emacs () {
    (cd ${WRKSRC}; ${GMAKE} EMACS=${emacs})
}

install_emacs () {
    local sitelispdir=${BASEDIR}/share/emacs/site-lisp/ede
    mkdir -p ${sitelispdir}
    cp -p ${WRKSRC}/*.el ${WRKSRC}/*.elc ${sitelispdir}
    cp -p ${WRKSRC}/ede.info* ${BASEDIR}/info
    install-info ${BASEDIR}/info/ede.info ${BASEDIR}/info/dir
}

init
eval $1
