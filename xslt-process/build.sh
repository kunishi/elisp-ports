#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://us.dl.sourceforge.net/xslt-process/xslt-process-2.2.tar.gz'
WRKSRC="${WRKDIR}/xslt-process-2.2"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=true
ELC_SHAREABLE=true

build_emacs () {
:
}

install_emacs () {
    local sitelispdir=${SITELISPDIR}/xslt-process
    mkdir -p ${sitelispdir}
    cp -pR ${WRKSRC}/* ${sitelispdir}
}

init
eval $1
