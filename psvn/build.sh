#!/bin/sh
# $Id: build.sh.sample,v 1.4 2003/05/31 07:07:09 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://xsteve.nit.at/prg/emacs/psvn.el'
WRKSRC="${WRKDIR}"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=true
ELC_SHAREABLE=true

. ../target.sh

build_emacs () {
    : write how to build package
    (cd ${WRKSRC}; \
        ${emacs} ${EMACS_COMPILE_ARGS} -f batch-byte-compile psvn.el)
}

install_emacs () {
    : write how to install package
    cp -p ${WRKSRC}/psvn.el ${BASEDIR}/share/emacs/site-lisp
    cp -p ${WRKSRC}/psvn.elc ${BASEDIR}/share/emacs/site-lisp
}

init
eval $1
