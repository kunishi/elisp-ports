#!/bin/sh

. ../config.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://us.dl.sourceforge.net/cedet/semantic-1.4.tar.gz'
WRKSRC=${WRKDIR}/semantic-1.4
ELC_SHAREABLE=true
EMACSEN='emacs-21.2'

. ../target.sh

build-emacs () {
    (cd ${WRKSRC}; ${GMAKE} EMACS=${BASEDIR}/${emacs_ver}/bin/emacs)
}

install-emacs () {
    local sitelispdir=${BASEDIR}/share/emacs/site-lisp/semantic
    mkdir -p ${sitelispdir}
    cp -p ${WRKSRC}/*.el ${WRKSRC}/*.elc ${WRKSRC}/*.bnf ${sitelispdir}
    cp -p ${WRKSRC}/semantic.info* ${BASEDIR}/info
    install-info ${BASEDIR}/info/semantic.info ${BASEDIR}/info/dir
}

init
eval $1
