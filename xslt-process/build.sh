#!/bin/sh

. ../config.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://us.dl.sourceforge.net/xslt-process/xslt-process-2.1.tar.gz'
WRKSRC=${WRKDIR}/xslt-process-2.1
#PATCHFILES='If you have some official patch, write them'
ELC_SHAREABLE=true
EMACSEN='emacs-21.2'

. ../target.sh

build-emacs () {
# do nothing
}

install-emacs () {
    local sitelispdir=${BASEDIR}/share/emacs/site-lisp/xslt-process
    mkdir -p ${sitelispdir}
    cp -pR ${WRKSRC}/* ${sitelispdir}
}

init
eval $1
