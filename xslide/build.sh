#!/bin/sh

. ../config.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.menteith.com/xslide/data/xslide.zip'
WRKSRC=${WRKDIR}
#PATCHFILES='If you have some official patch, write them'
ELC_SHAREABLE=true

. ../target.sh

build_emacs () {
:
}

install_emacs () {
    local sitelispdir=${BASEDIR}/share/emacs/site-lisp/xslide
    mkdir -p ${sitelispdir}
    cp -p ${WRKSRC}/*.el ${sitelispdir}
}

init
eval $1
