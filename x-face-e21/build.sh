#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='ftp://ftp.jpl.org/pub/elisp/x-face-e21.el.gz'
WRKSRC=${WRKDIR}
USE_EMACS=true
ELC_SHAREABLE=false

build_emacs () {
    cp ${DISTDIR}/x-face-e21.el.gz ${WRKSRC}
    gunzip ${WRKSRC}/x-face-e21.el.gz
    (cd ${WRKSRC}; \
	${emacs} ${EMACS_COMPILE_ARGS} -f batch-byte-compile x-face-e21.el)
}

install_emacs () {
    cp -p ${WRKSRC}/x-face-e21.el ${VERSION_SPECIFIC_SITELISPDIR}
    cp -p ${WRKSRC}/x-face-e21.elc ${VERSION_SPECIFIC_SITELISPDIR}
}

install_init () {
    [ ! -d ${EMACS_INIT_D} ] && mkdir -p ${EMACS_INIT_D}
    cp -p dotemacs.el ${EMACS_INIT_D}/x-face-e21-init.el
}

init
eval $1
