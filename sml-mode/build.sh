#!/bin/sh

. ../config.sh

PKG_TOPDIR=`pwd`

DISTFILES='ftp://ftp.research.bell-labs.com/dist/smlnj/contrib/emacs/sml-mode-3.9.3.tar.gz'
WRKSRC=${WRKDIR}/sml-mode-3.9.3
ELC_SHAREABLE=true
EMACSEN='emacs-21.2'

. ../target.sh

build-emacs () {
    (cd ${WRKSRC}; \
	make EMACS=${BASEDIR}/${emacs_ver}/bin/emacs elcfiles)
}

install-emacs () {
    (cd ${WRKSRC}; \
	make EMACS=${BASEDIR}/${emacs_ver}/bin/emacs install_el install)
}

init
eval $1
