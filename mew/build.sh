#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='ftp://ftp.mew.org/pub/Mew/alpha/mew-4.0.57.tar.gz'
WRKSRC="${WRKDIR}/mew-4.0.57"
USE_EMACS=true
ELC_SHAREABLE=true
EMACS_BUILD_TARGET=''
EMACS_INSTALL_TARGET='install install-info install-jinfo install-etc'

build_emacs () {
    (cd ${WRKSRC}; make emacs=${emacs} ${EMACS_BUILD_TARGET})
}

install_emacs () {
    (cd ${WRKSRC}; make emacs=${emacs} prefix=${EMACS_PREFIX} ${EMACS_INSTALL_TARGET})
}

install_init () {
    mkdir -p ${WRKSRC}
    [ ! -d ${EMACS_INIT_D} ] && mkdir -p ${EMACS_INIT_D}
    cp -p dotemacs.el ${EMACS_INIT_D}/mew-setup.el
    diff -e ${HOME}/.mew.el dotmew.el > ${WRKSRC}/dotmew.ed
    ed ${HOME}/.mew.el < ${WRKSRC}/dotmew.ed
}

init
eval $1
