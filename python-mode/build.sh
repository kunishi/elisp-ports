#!/bin/sh

. ../config.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.python.org/ftp/python/2.2.1/Python-2.2.1.tgz'
WRKSRC=${WRKDIR}/Python-2.2.1/Misc
#PATCHFILES='If you have some official patch, write them'
ELC_SHAREABLE=true
EMACSEN='emacs-21.2'

. ../target.sh

build-emacs () {
    (cd ${WRKSRC}; \
	${BASEDIR}/${emacs_ver}/bin/emacs ${EMACS_COMPILE_ARGS} \
	  -f batch-byte-compile python-mode.el)
}

install-emacs () {
    cp -p ${WRKSRC}/python-mode.el ${WRKSRC}/python-mode.elc \
	${BASEDIR}/share/emacs/site-lisp
}

init
eval $1
