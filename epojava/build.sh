#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/02 03:48:07 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://downloads.sourceforge.jp/epojava/3890/epojava.zip'
WRKSRC="${WRKDIR}/epojava"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=true
ELC_SHAREABLE=true

build_emacs () {
    : write how to build package
}

install_emacs () {
    : write how to install package
    mkdir -p ${SITELISPDIR}/epojava
    (cd ${WRKSRC}; cp -p *.el *.jar ${SITELISPDIR}/epojava)
    mkdir -p ${BASEDIR}/share/doc/epojava
    cp -rp ${WRKSRC}/doc ${BASEDIR}/share/doc/epojava
}

init
eval $1
