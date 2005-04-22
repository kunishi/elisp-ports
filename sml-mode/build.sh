#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.iro.umontreal.ca/~monnier/elisp/sml-mode-4.0.tar.gz'
WRKSRC="${WRKDIR}/sml-mode-4.0"
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
	    lispdir=${SITELISPDIR} install)
    install-info --info-dir=${INFODIR} ${INFODIR}/sml-mode.info
}

install_init () {
    [ ! -d ${EMACS_INIT_D} ] && mkdir -p ${EMACS_INIT_D}
    cp -p dotemacs.el ${EMACS_INIT_D}/sml-mode-init.el
}

init
eval $1
