#!/bin/sh

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://nwalsh.com/emacs/docbookide/docbookide01.zip'
WRKSRC="${WRKDIR}/docbookide"
USE_EMACS=true
ELC_SHAREABLE=true

. ../target.sh

build_emacs () {
    (cd ${WRKSRC}; \
	echo '(setq load-path (cons "." load-path))' > tmp.el; \
	${emacs} ${EMACS_COMPILE_ARGS} -l tmp.el -f batch-byte-compile *.el; \
	rm -f tmp.el)
}

install_emacs () {
    mkdir -p ${BASEDIR}/share/emacs/site-lisp/docbookide
    cp -p ${WRKSRC}/*.el ${BASEDIR}/share/emacs/site-lisp/docbookide
    cp -p ${WRKSRC}/*.elc ${BASEDIR}/share/emacs/site-lisp/docbookide
}

init
eval $1
