#!/bin/sh

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://telia.dl.sourceforge.net/cedet/semantic-1.4.3.tar.gz'
WRKSRC=${WRKDIR}/semantic-1.4.3
ELC_SHAREABLE=true

. ../target.sh

build_emacs () {
    (cd ${WRKSRC}; ${GMAKE} EMACS=${emacs})
}

install_emacs () {
    local sitelispdir=${BASEDIR}/share/emacs/site-lisp/semantic
    mkdir -p ${sitelispdir}
    cp -p ${WRKSRC}/*.el ${WRKSRC}/*.elc ${WRKSRC}/*.bnf ${sitelispdir}
    cp -p ${WRKSRC}/semantic.info* ${BASEDIR}/info
    install-info ${BASEDIR}/info/semantic.info ${BASEDIR}/info/dir
}

init
eval $1
