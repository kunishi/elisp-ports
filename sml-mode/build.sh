#!/bin/sh

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='ftp://ftp.research.bell-labs.com/dist/smlnj/contrib/emacs/sml-mode-3.9.3.tar.gz'
WRKSRC=${WRKDIR}/sml-mode-3.9.3
ELC_SHAREABLE=true

. ../target.sh

build_emacs () {
    (cd ${WRKSRC}; make EMACS=${emacs} prefix=${BASEDIR} elcfiles)
}

install_emacs () {
    (cd ${WRKSRC}; make EMACS=${emacs} prefix=${BASEDIR} install_el install)
}

init
eval $1
