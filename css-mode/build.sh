#!/bin/sh

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

init
eval $1
