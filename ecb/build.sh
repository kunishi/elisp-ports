#!/bin/sh

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://us.dl.sourceforge.net/ecb/ecb-1.80.tar.gz'
WRKSRC=${WRKDIR}/ecb-1.80
ELC_SHAREABLE=true

. ../target.sh

build_emacs () {
    (cd ${WRKSRC}; ${GMAKE} EMACS=${emacs} \
	LOADPATH="${BASEDIR}/share/emacs/site-lisp/eieio ${BASEDIR}/share/emacs/site-lisp/semantic ${BASEDIR}/share/emacs/site-lisp/jde/lisp")
}

install_emacs () {
    local sitelispdir=${BASEDIR}/share/emacs/site-lisp/ecb
    mkdir -p ${sitelispdir}
    cp -p ${WRKSRC}/*.el ${WRKSRC}/*.elc ${sitelispdir}
    cp -p ${WRKSRC}/ecb.info ${BASEDIR}/info
    install-info ${BASEDIR}/info/ecb.info ${BASEDIR}/info/dir
}

init
eval $1
