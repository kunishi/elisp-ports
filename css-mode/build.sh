#!/bin/sh
# $Id$

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.garshol.priv.no/download/software/css-mode/css-mode.el'
WRKSRC=${WRKDIR}
USE_EMACS=true
ELC_SHAREABLE=true

build_emacs () {
    (cd ${WRKSRC}; \
	${emacs} ${EMACS_COMPILE_ARGS} -f batch-byte-compile css-mode.el)
}

install_emacs () {
    cp -p ${WRKSRC}/css-mode.el ${SITELISPDIR}
    cp -p ${WRKSRC}/css-mode.elc ${SITELISPDIR}
}

install_init () {
    [ ! -d ${EMACS_INIT_D} ] && mkdir -p ${EMACS_INIT_D}
    cp -p dotemacs.el ${EMACS_INIT_D}/css-mode-init.el
}

init
eval $1
