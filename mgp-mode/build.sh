#!/bin/sh

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='ftp://TypeHack.aial.hiroshima-u.ac.jp/pub/Emacs/MagicPoint/mgp-mode.el'
WRKSRC=${WRKDIR}
ELC_SHAREABLE=true

. ../target.sh

build_emacs () {
	# write how to build package
	(cd ${WRKSRC}; \
	  ${emacs} ${EMACS_COMPILE_ARGS} -f batch-byte-compile *.el)
}

install_emacs () {
	# write how to install package
	local sitelispdir=${BASEDIR}/share/emacs/site-lisp
	cp -p ${WRKSRC}/*.el[c] ${sitelispdir}
}

init
eval $1
