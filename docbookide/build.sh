#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='ftp://ftp.freebsd.org/pub/FreeBSD/ports/distfiles/docbookide01.zip'
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

install_init () {
    [ ! -d ${EMACS_INIT_D} ] && mkdir -p ${EMACS_INIT_D}
    cp -p dotemacs.el ${EMACS_INIT_D}/docbookide-init.el
}

init
eval $1
