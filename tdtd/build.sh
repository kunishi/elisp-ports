#!/bin/sh

. ../config.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.menteith.com/tdtd/data/tdtd071.zip'
WRKSRC=${WRKDIR}
ELC_SHAREABLE=true

. ../target.sh

build-emacs () {
# do nothing
}

install-emacs () {
    local sitelispdir=${BASEDIR}/share/emacs/site-lisp/tdtd
    mkdir -p ${sitelispdir}
    cp -p ${WRKSRC}/*.el ${sitelispdir}
}

init
eval $1
