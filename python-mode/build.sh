#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='ftp://ftp.python.org/pub/python/2.3.3/Python-2.3.3.tgz'
WRKSRC="${WRKDIR}/Python-2.3.3/Misc"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=true
ELC_SHAREABLE=true

build_emacs () {
    (cd ${WRKSRC}; \
	${emacs} ${EMACS_COMPILE_ARGS} -f batch-byte-compile python-mode.el)
}

install_emacs () {
    cp -p ${WRKSRC}/python-mode.el ${WRKSRC}/python-mode.elc ${SITELISPDIR}
}

install_init () {
    [ ! -d ${EMACS_INIT_D} ] && mkdir -p ${EMACS_INIT_D}
    cp -p dotemacs.el ${EMACS_INIT_D}/python-mode-init.el
}

init
eval $1
