#!/bin/sh

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://www.xmlsmartdoc.org/download/beta.zip'
WRKSRC=${WRKDIR}
ELC_SHAREABLE=true

. ../target.sh

patch_emacs () {
	:
}

build_emacs () {
	(cd ${WRKSRC}; jar xvf archive.jar etc)
	(cd ${WRKSRC}; patch -p0 -N < ${PKG_TOPDIR}/patch/patch-emacs)
	(cd ${WRKSRC}/etc; \
	  ${emacs} ${EMACS_COMPILE_ARGS} -l ./sdoc-helper.el -f batch-byte-compile *.el)
}

install_emacs () {
	local sitelispdir=${BASEDIR}/share/emacs/site-lisp
	cp -p ${WRKSRC}/etc/*.el[c] ${sitelispdir}
}

init
eval $1
