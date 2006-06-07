#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.mew.org/Beta/mew-5.0.53.tar.gz'
WRKSRC="${WRKDIR}/mew-5.0.53"
USE_EMACS=true
ELC_SHAREABLE=true
EMACS_BUILD_TARGET=''
EMACS_INSTALL_TARGET='install install-info install-jinfo install-etc'

build_emacs () {
    (cd ${WRKSRC}; ./configure --prefix=${EMACS_PREFIX} \
			--infodir=${EMACS_PREFIX}/info)
    (cd ${WRKSRC}; make emacs=${emacs} prefix=${EMACS_PREFIX} ${EMACS_BUILD_TARGET})
}

install_emacs () {
    (cd ${WRKSRC}; make emacs=${emacs} \
	prefix=${EMACS_PREFIX} \
	elispdir=${SITELISPDIR}/mew \
	infodir=${EMACS_PREFIX}/info \
	${EMACS_INSTALL_TARGET})
}

install_init () {
    [ ! -d ${EMACS_INIT_D} ] && mkdir -p ${EMACS_INIT_D}
    cp -p dotemacs.el ${EMACS_INIT_D}/mew-init.el
    cp -p dotmew.el ${HOME}/.mew.el
}

init
eval $1
