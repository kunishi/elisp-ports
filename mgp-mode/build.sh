#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='ftp://TypeHack.aial.hiroshima-u.ac.jp/pub/Emacs/MagicPoint/mgp-mode.el'
WRKSRC=${WRKDIR}
USE_EMACS=true
ELC_SHAREABLE=true

build_emacs () {
	# write how to build package
	(cd ${WRKSRC}; \
	  ${emacs} ${EMACS_COMPILE_ARGS} -f batch-byte-compile *.el)
}

install_emacs () {
	# write how to install package
	local sitelispdir=${SITELISPDIR}
	cp -p ${WRKSRC}/*.el[c] ${sitelispdir}
}

install_init () {
    [ ! -d ${EMACS_INIT_D} ] && mkdir -p ${EMACS_INIT_D}
    cp -p dotemacs.el ${EMACS_INIT_D}/mgp-mode-init.el
}

init
eval $1
