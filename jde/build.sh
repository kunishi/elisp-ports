#!/bin/sh

. ../config.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://jdee.sunsite.dk/jde-beta.tar.gz'
WRKSRC=${WRKDIR}/jde-2.2.9beta10
#PATCHFILES='If you have some official patch, write them'
ELC_SHAREABLE=true
EMACSEN='emacs-21.2'

. ../target.sh

build-emacs () {
    local sitelispbase=${BASEDIR}/share/emacs/site-lisp
    (cd ${WRKSRC}/lisp; \
	make EMACS=${BASEDIR}/${emacs_ver}/bin/emacs \
	     EIEIO=${sitelispbase}/eieio \
	     ELIB=${sitelispbase}/elib \
	     SEMANTIC=${sitelispbase}/semantic \
	     SPEEDBAR=${sitelispbase}/speedbar)
}

install-emacs () {
    local sitelispdir=${BASEDIR}/share/emacs/site-lisp/jde
    mkdir -p ${sitelispdir}
    cp -p ${WRKSRC}/lisp/*.el ${WRKSRC}/lisp/*.elc ${sitelispdir}
    cp -p ${WRKSRC}/lisp/*.bnf ${sitelispdir}
    cp -pR ${WRKSRC}/java ${sitelispdir}/java
    cp -pR ${WRKSRC}/doc ${sitelispdir}/doc
    cp -p ${WRKSRC}/lisp/ReleaseNotes.txt ${sitelispdir}/doc
    cp -p ${WRKSRC}/lisp/ChangeLog ${sitelispdir}/doc
    cp -p ${WRKSRC}/lisp/jtags ${BASEDIR}/bin
    chmod 755 ${BASEDIR}/bin/jtags
}

init
eval $1
