#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='ftp://ftp.lysator.liu.se/pub/sgml/ALPHA/psgml-1.3.1.tar.gz'
WRKSRC="${WRKDIR}/psgml-1.3.1"
USE_EMACS=true
ELC_SHAREABLE=true

build_emacs () {
    (cd ${WRKSRC}; \
	for file in *.el *.info *.texi; do \
	    mv ${file} ${file}.bak; \
	    sed -e 's|\([^-p]\)sgml-|\1psgml-|g' \
	        -e 's|\([^-p]\)xml-|\1pxml-|g' ${file}.bak > ${file}; \
	done)
    (cd ${WRKSRC}; ./configure --prefix=${EMACS_PREFIX})
    (cd ${WRKSRC}; ${GMAKE} EMACS=${emacs})
}

install_emacs () {
    (cd ${WRKSRC}; \
	make lispdir=${SITELISPDIR}/psgml \
	     infodir=${INFODIR} EMACS=${emacs} install install-info)
    cp -p ${WRKSRC}/*.el ${SITELISPDIR}/psgml
}

install_init () {
    [ ! -d ${EMACS_INIT_D} ] && mkdir -p ${EMACS_INIT_D}
    cp -p dotemacs.el ${EMACS_INIT_D}/psgml-init.el
}

init
eval $1
