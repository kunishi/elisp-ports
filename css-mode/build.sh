#!/bin/sh

. ../config.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.garshol.priv.no/download/software/css-mode/css-mode.el'
WRKSRC=${WRKDIR}
ELC_SHAREABLE=true

. ../target.sh

build_emacs () {
    (cd ${WRKSRC}; \
	${emacs} ${EMACS_COMPILE_ARGS} -f batch-byte-compile css-mode.el)
}

install_emacs () {
    cp -p ${WRKSRC}/css-mode.el ${BASEDIR}/share/emacs/site-lisp
    cp -p ${WRKSRC}/css-mode.elc ${BASEDIR}/share/emacs/site-lisp
}

init
eval $1
