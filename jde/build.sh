#!/bin/sh

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://jdee.sunsite.dk/jde-latest.tar.gz'
WRKSRC="${WRKDIR}/jde-2.3.2"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=true
ELC_SHAREABLE=true

. ../target.sh

build_emacs () {
    local sitelispbase=${BASEDIR}/share/emacs/site-lisp
    (cd ${WRKSRC}/lisp; \
	make EMACS=${emacs} \
	     EIEIO=${sitelispbase}/eieio \
	     ELIB=${sitelispbase}/elib \
	     SEMANTIC=${sitelispbase}/semantic \
	     SPEEDBAR=${sitelispbase}/speedbar)
}

install_emacs () {
    local sitelispdir=${BASEDIR}/share/emacs/site-lisp/jde
    mkdir -p ${sitelispdir}/lisp
    cp -p ${WRKSRC}/lisp/*.el ${WRKSRC}/lisp/*.elc ${sitelispdir}/lisp
    cp -p ${WRKSRC}/lisp/*.bnf ${sitelispdir}/lisp
    cp -pR ${WRKSRC}/java ${sitelispdir}/java
    cp -pR ${WRKSRC}/doc ${sitelispdir}/doc
    cp -p ${WRKSRC}/lisp/ReleaseNotes.txt ${sitelispdir}/doc
    cp -p ${WRKSRC}/lisp/ChangeLog ${sitelispdir}/doc
    cp -p ${WRKSRC}/lisp/jtags ${BASEDIR}/bin
    chmod 755 ${BASEDIR}/bin/jtags
}

init
eval $1
