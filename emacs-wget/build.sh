#!/bin/sh

. ../config.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://pop-club.hp.infoseek.co.jp/emacs/emacs-wget/emacs-wget-0.4.0.tar.gz'
WRKSRC=${WRKDIR}/emacs-wget-0.4.0
ELC_SHAREABLE=true

. ../target.sh

build_emacs () {
    (cd ${WRKSRC}; \
	${emacs} ${EMACS_COMPILE_ARGS} -l wget-sysdep.el \
	-f batch-byte-compile *.el)
}

install_emacs () {
    local sitelispdir=${BASEDIR}/share/emacs/site-lisp
    mkdir -p ${sitelispdir}/emacs-wget
    cp -p ${WRKSRC}/*.el ${sitelispdir}/emacs-wget/
    cp -p ${WRKSRC}/*.elc ${sitelispdir}/emacs-wget/
}

init
eval $1
