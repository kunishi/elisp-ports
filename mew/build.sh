#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='ftp://ftp.mew.org/pub/Mew/alpha/mew-4.0.61.tar.gz'
WRKSRC="${WRKDIR}/mew-4.0.61"
USE_EMACS=true
ELC_SHAREABLE=true
EMACS_BUILD_TARGET=''
EMACS_INSTALL_TARGET='install install-info install-jinfo install-etc'

build_emacs () {
    (cd ${WRKSRC}; make emacs=${emacs} prefix=${EMACS_PREFIX} ${EMACS_BUILD_TARGET})
}

install_emacs () {
    (cd ${WRKSRC}; make emacs=${emacs} \
	prefix=${EMACS_PREFIX} \
	elispdir=${SITELISPDIR}/mew \
	infodir=${EMACS_PREFIX}/info \
	etcdir=${EMACS_ETCDIR}/mew ${EMACS_INSTALL_TARGET})
}

install_init () {
    [ ! -d ${EMACS_INIT_D} ] && mkdir -p ${EMACS_INIT_D}
    cp -p dotemacs.el ${EMACS_INIT_D}/mew-init.el
    cp -p dotmew.el ${HOME}/.mew.el
}

init
eval $1
