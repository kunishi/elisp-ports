#!/bin/sh

. ../config.sh

PKG_TOPDIR=`pwd`

DISTFILES='ftp://ftp.lysator.liu.se/pub/sgml/ALPHA/psgml-1.3.0.tar.gz'
WRKSRC=${WRKDIR}/psgml-1.3.0
ELC_SHAREABLE=true
EMACSEN='emacs-21.2'

. ../target.sh

build-emacs () {
    (cd ${WRKSRC}; \
	for file in *.el *.info *.texi; do \
	    mv ${file} ${file}.bak; \
	    sed -e 's|\([^-p]\)sgml-|\1psgml-|g' \
	        -e 's|\([^-p]\)xml-|\1pxml-|g' ${file}.bak > ${file}; \
	done)
    (cd ${WRKSRC}; ./configure --prefix=${BASEDIR})
    (cd ${WRKSRC}; make EMACS=${BASEDIR}/${emacs_ver}/bin/emacs)
}

install-emacs () {
    (cd ${WRKSRC}; \
	make lispdir=${BASEDIR}/share/emacs/site-lisp/psgml \
	     infodir=${BASEDIR}/info install install-info)
    cp -p ${WRKSRC}/*.el ${BASEDIR}/share/emacs/site-lisp/psgml
}

init
eval $1
