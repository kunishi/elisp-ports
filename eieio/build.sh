#!/bin/sh

. ../config.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://us.dl.sourceforge.net/cedet/eieio-0.17.tar.gz'
WRKSRC=${WRKDIR}/eieio-0.17
ELC_SHAREABLE=true
EMACSEN='emacs-21.2'

. ../target.sh

build-emacs () {
    (cd ${WRKSRC}; ${GMAKE} EMACS=${BASEDIR}/${emacs_ver}/bin/emacs)
}

install-emacs () {
    mkdir -p ${BASEDIR}/share/emacs/site-lisp/eieio
    cp -p ${WRKSRC}/*.el ${WRKSRC}/*.elc ${BASEDIR}/share/emacs/site-lisp/eieio
    cp -p ${WRKSRC}/eieio.info ${BASEDIR}/info
    install-info ${BASEDIR}/info/eieio.info ${BASEDIR}/info/dir
}

init
eval $1
