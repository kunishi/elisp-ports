#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://nwalsh.com/emacs/docbookide/docbookide01.zip'
WRKSRC="${WRKDIR}/docbookide"
USE_EMACS=true
ELC_SHAREABLE=true

build_emacs () {
    (cd ${WRKSRC}; \
	echo '(setq load-path (cons "." load-path))' > tmp.el; \
	${emacs} ${EMACS_COMPILE_ARGS} -l tmp.el -f batch-byte-compile *.el; \
	rm -f tmp.el)
}

install_emacs () {
    mkdir -p ${SITELISPDIR}/docbookide
    cp -p ${WRKSRC}/*.el ${SITELISPDIR}/docbookide
    cp -p ${WRKSRC}/*.elc ${SITELISPDIR}/docbookide
}

init
eval $1
