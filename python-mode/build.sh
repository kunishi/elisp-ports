#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://keihanna.dl.sourceforge.net/sourceforge/python-mode/python-mode-1.0alpha.tar.gz'
WRKSRC="${WRKDIR}/python-mode-1.0alpha"
USE_EMACS=true
ELC_SHAREABLE=true

build_emacs () {
    (cd ${WRKSRC}; \
	${emacs} ${EMACS_COMPILE_ARGS} -f batch-byte-compile *.el)
}

install_emacs () {
    local sitelispdir=${SITELISPDIR}/python-mode
    mkdir -p ${sitelispdir}
    cp -p ${WRKSRC}/* ${sitelispdir}
}

install_init () {
    [ ! -d ${EMACS_INIT_D} ] && mkdir -p ${EMACS_INIT_D}
    cp -p dotemacs.el ${EMACS_INIT_D}/python-mode-init.el
}

init
eval $1
