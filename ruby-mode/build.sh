#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='ftp://ftp.ruby-lang.org/pub/ruby/stable/ruby-1.6.8.tar.gz'
WRKSRC="${WRKDIR}/ruby-1.6.8/misc"
USE_EMACS=true
ELC_SHAREABLE=true

build_emacs () {
    (cd ${WRKSRC}; \
	for file in *.el; do \
	${emacs} ${EMACS_COMPILE_ARGS} -f batch-byte-compile ${file}; \
	done)
}

install_emacs () {
    local sitelispdir=${SITELISPDIR}/ruby-mode
    mkdir -p ${sitelispdir}
    cp -p ${WRKSRC}/*.el ${WRKSRC}/*.elc ${sitelispdir}
}

init
eval $1
