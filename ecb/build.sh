#!/bin/sh

. ../config.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://us.dl.sourceforge.net/ecb/ecb-1.80.tar.gz'
WRKSRC=${WRKDIR}/ecb-1.80
ELC_SHAREABLE=true
EMACSEN='emacs-21.2'

. ../target.sh

build-emacs () {
    (cd ${WRKSRC}; ${GMAKE} EMACS=${BASEDIR}/${emacs_ver}/bin/emacs)
}

install-emacs () {
    local sitelispdir=${BASEDIR}/share/emacs/site-lisp/ecb
    mkdir -p ${sitelispdir}
    cp -p ${WRKSRC}/*.el ${WRKSRC}/*.elc ${sitelispdir}
    cp -p ${WRKSRC}/ecb.info ${BASEDIR}/info
    install-info ${BASEDIR}/info/ecb.info ${BASEDIR}/info/dir
}

init
eval $1
