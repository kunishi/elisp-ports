#!/bin/sh

. ../config.sh

PKG_TOPDIR=`pwd`

DISTFILES='ftp://ftp.ruby-lang.org/pub/ruby/stable/ruby-1.6.7.tar.gz'
WRKSRC=${WRKDIR}/ruby-1.6.7/misc
ELC_SHAREABLE=true

. ../target.sh

build-emacs () {
    (cd ${WRKSRC}; \
	for file in *.el; do \
	${BASEDIR}/${emacs_ver}/bin/emacs ${EMACS_COMPILE_ARGS} \
	   -f batch-byte-compile ${file}; \
	done)
}

install-emacs () {
    local sitelispdir=${BASEDIR}/share/emacs/site-lisp/ruby-mode
    mkdir -p ${sitelispdir}
    cp -p ${WRKSRC}/*.el ${WRKSRC}/*.elc ${sitelispdir}
}

init
eval $1
