#!/bin/sh

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://us.dl.sourceforge.net/xslt-process/xslt-process-2.2.tar.gz'
WRKSRC=${WRKDIR}/xslt-process-2.2
#PATCHFILES='If you have some official patch, write them'
ELC_SHAREABLE=true

. ../target.sh

build_emacs () {
:
}

install_emacs () {
    local sitelispdir=${BASEDIR}/share/emacs/site-lisp/xslt-process
    mkdir -p ${sitelispdir}
    cp -pR ${WRKSRC}/* ${sitelispdir}
}

init
eval $1
