#!/bin/sh

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://www.python.org/ftp/python/2.2.1/Python-2.2.1.tgz'
WRKSRC="${WRKDIR}/Python-2.2.1/Misc"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=true
ELC_SHAREABLE=true

. ../target.sh

build_emacs () {
    (cd ${WRKSRC}; \
	${emacs} ${EMACS_COMPILE_ARGS} -f batch-byte-compile python-mode.el)
}

install_emacs () {
    cp -p ${WRKSRC}/python-mode.el ${WRKSRC}/python-mode.elc \
	${BASEDIR}/share/emacs/site-lisp
}

init
eval $1
