#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://jdee.sunsite.dk/jde-latest.tar.gz'
WRKSRC="${WRKDIR}/jde-2.3.3"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=true
ELC_SHAREABLE=true

build_emacs () {
    local sitelispbase=${SITELISPDIR}
    (cd ${WRKSRC}/lisp; \
	make EMACS=${emacs} \
	     EIEIO=${sitelispbase}/eieio \
	     ELIB=${sitelispbase}/elib \
	     SEMANTIC=${sitelispbase}/semantic \
	     SPEEDBAR=${sitelispbase}/speedbar)
}

install_emacs () {
    local sitelispdir=${SITELISPDIR}/jde
    mkdir -p ${sitelispdir}/lisp
    cp -p ${WRKSRC}/lisp/*.el ${WRKSRC}/lisp/*.elc ${sitelispdir}/lisp
    cp -p ${WRKSRC}/lisp/*.bnf ${sitelispdir}/lisp
    cp -pR ${WRKSRC}/java ${sitelispdir}/java
    cp -pR ${WRKSRC}/doc ${sitelispdir}/doc
    cp -p ${WRKSRC}/lisp/ReleaseNotes.txt ${sitelispdir}/doc
    cp -p ${WRKSRC}/lisp/ChangeLog ${sitelispdir}/doc
    cp -p ${WRKSRC}/lisp/jtags ${EMACS_PREFIX}/bin
    chmod 755 ${EMACS_PREFIX}/bin/jtags
}

install_init () {
    [ ! -d ${EMACS_INIT_D} ] && mkdir -p ${EMACS_INIT_D}
    cp -p dotemacs.el ${EMACS_INIT_D}/jde-init.el
}

init
eval $1
