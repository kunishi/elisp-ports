#!/bin/sh

. ../config.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://us.dl.sourceforge.net/cedet/speedbar-0.14beta4.tar.gz'
WRKSRC=${WRKDIR}/speedbar-0.14beta4
ELC_SHAREABLE=true

. ../target.sh

build-emacs () {
    (cd ${WRKSRC}; ${GMAKE} EMACS=${BASEDIR}/${emacs_ver}/bin/emacs)
}

install-emacs () {
    local sitelispdir=${BASEDIR}/share/emacs/site-lisp/speedbar
    mkdir -p ${sitelispdir}
    cp -p ${WRKSRC}/*.el ${WRKSRC}/*.elc ${WRKSRC}/*.xpm ${sitelispdir}
    cp -p ${WRKSRC}/speedbar.info ${BASEDIR}/info
    install-info ${BASEDIR}/info/speedbar.info ${BASEDIR}/info/dir
}

init
eval $1
