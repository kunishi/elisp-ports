#!/bin/sh
# $Id: build.sh.sample,v 1.4 2003/05/31 07:07:09 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.mwolson.org/static/dist/muse/muse-3.02.93.tar.gz'
WRKSRC="${WRKDIR}/muse-3.02.93"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=true
ELC_SHAREABLE=true

build_emacs () {
    : write how to build package
    (cd ${WRKSRC}; ${GMAKE} EMACS=${emacs} PREFIX=${BASEDIR})
}

install_emacs () {
    : write how to install package
    (cd ${WRKSRC}; \
	${GMAKE} EMACS=${emacs} PREFIX=${BASEDIR} INFODIR=${INFODIR} install)
}

install_init () {
    [ ! -d ${EMACS_INIT_D} ] && mkdir -p ${EMACS_INIT_D}
    cp -p dotemacs.el ${EMACS_INIT_D}/emacs-muse-init.el
}

init
eval $1
