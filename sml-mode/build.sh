#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='ftp://ftp.research.bell-labs.com/dist/smlnj/contrib/emacs/sml-mode-3.9.5.tar.gz'
WRKSRC="${WRKDIR}/sml-mode-3.9.5"
USE_EMACS=true
ELC_SHAREABLE=true

build_emacs () {
    (cd ${WRKSRC}; \
	make EMACS=${emacs} prefix=${EMACS_PREFIX} \
	    lispdir=${SITELISPDIR} elcfiles)
}

install_emacs () {
    (cd ${WRKSRC}; \
	make EMACS=${emacs} prefix=${EMACS_PREFIX} \
	    lispdir=${SITELISPDIR} install_el install)
}

install_init () {
    [ ! -d ${EMACS_INIT_D} ] && mkdir -p ${EMACS_INIT_D}
    cp -p dotemacs.el ${EMACS_INIT_D}/sml-mode-init.el
}

init
eval $1
