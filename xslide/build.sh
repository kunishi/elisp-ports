#!/bin/sh

. ../config.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.menteith.com/xslde/data/xslide.zip'
WRKSRC=${WRKDIR}
#PATCHFILES='If you have some official patch, write them'
ELC_SHAREABLE=true
EMACSEN='emacs-21.2'

. ../target.sh

build-emacs () {
# do nothing
}

install-emacs () {
    local sitelispdir=${BASEDIR}/share/emacs/site-lisp/xslide
    mkdir -p ${sitelispdir}
    cp -p ${WRKSRC}/*.el ${sitelispdir}
}

init
eval $1
