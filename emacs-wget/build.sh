#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://pop-club.hp.infoseek.co.jp/emacs/emacs-wget/emacs-wget-0.4.1.tar.gz'
WRKSRC="${WRKDIR}/emacs-wget-0.4.1"
USE_EMACS=true
ELC_SHAREABLE=true

build_emacs () {
    (cd ${WRKSRC}; \
	${emacs} ${EMACS_COMPILE_ARGS} -l wget-sysdep.el \
	-f batch-byte-compile *.el)
}

install_emacs () {
    local sitelispdir=${SITELISPDIR}
    mkdir -p ${sitelispdir}/emacs-wget
    cp -p ${WRKSRC}/*.el ${sitelispdir}/emacs-wget/
    cp -p ${WRKSRC}/*.elc ${sitelispdir}/emacs-wget/
}

install_init () {
    [ ! -d ${EMACS_INIT_D} ] && mkdir -p ${EMACS_INIT_D}
    cp -p dotemacs.el ${EMACS_INIT_D}/emacs-wget-init.el
}

init
eval $1
