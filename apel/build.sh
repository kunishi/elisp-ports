#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='ftp://ftp.m17n.org/pub/mule/apel/apel-10.6.tar.gz'
WRKSRC="${WRKDIR}/apel-10.6"
USE_EMACS=true
ELC_SHAREABLE=false

build_emacs () {
    (cd ${WRKSRC}; make EMACS=${emacs} LISPDIR=${SITELISPDIR} VERSION_SPECIFIC_LISPDIR=${VERSION_SPECIFIC_SITELISPDIR} elc)
}

install_emacs () {
    (cd ${WRKSRC}; make EMACS=${emacs} LISPDIR=${SITELISPDIR} VERSION_SPECIFIC_LISPDIR=${VERSION_SPECIFIC_SITELISPDIR} install)
}

install_init () {
    [ ! -d ${EMACS_INIT_D} ] && mkdir -p ${EMACS_INIT_D}
    cp -p dotemacs.el ${EMACS_INIT_D}/apel-init.el
}

init
eval $1
