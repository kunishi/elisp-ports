#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.xmlsmartdoc.org/download/beta.zip'
WRKSRC="${WRKDIR}"
USE_EMACS=true
ELC_SHAREABLE=true

patch () {
	:
}

build_emacs () {
	(cd ${WRKSRC}; jar xvf archive.jar)
	(cd ${WRKSRC}; patch -p0 -N < ${PKG_TOPDIR}/patch/patch-emacs)
	(cd ${WRKSRC}/etc; \
	  ${emacs} ${EMACS_COMPILE_ARGS} -l ./sdoc-helper.el -f batch-byte-compile *.el)
}

install_emacs () {
	local sitelispdir=${SITELISPDIR}
	cp -p ${WRKSRC}/etc/*.el ${WRKSRC}/etc/*.elc ${sitelispdir}
}

init
eval $1
