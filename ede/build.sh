#!/bin/sh

. ../config.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://us.dl.sourceforge.net/cedet/EDE-1.0.beta2.tar.gz'
WRKSRC=${WRKDIR}/EDE-1.0.beta2
ELC_SHAREABLE=true
EMACSEN='emacs-21.2'

. ../target.sh

build-emacs () {
    (cd ${WRKSRC}; ${GMAKE} EMACS=${BASEDIR}/${emacs_ver}/bin/emacs)
}

install-emacs () {
    local sitelispdir=${BASEDIR}/share/emacs/site-lisp/ede
    mkdir -p ${sitelispdir}
    cp -p ${WRKSRC}/*.el ${WRKSRC}/*.elc ${sitelispdir}
    cp -p ${WRKSRC}/ede.info* ${BASEDIR}/info
    install-info ${BASEDIR}/info/ede.info ${BASEDIR}/info/dir
}

init
eval $1
