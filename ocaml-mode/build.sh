#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://wwwfun.kurims.kyoto-u.ac.jp/soft/olabl/dist/ocaml-mode-3.05.tar.gz'
WRKSRC="${WRKDIR}/ocaml-mode-3.05"
USE_EMACS=true
ELC_SHAREABLE=true

build_emacs () {
:
}

install_emacs () {
    (cd ${WRKSRC}; \
	make EMACS=${emacs} \
	     EMACSDIR=${SITELISPDIR}/ocaml-mode \
	     install install-ocamltags)
}

install_init () {
    [ ! -d ${EMACS_INIT_D} ] && mkdir -p ${EMACS_INIT_D}
    cp -p dotemacs.el ${EMACS_INIT_D}/ocaml-mode-init.el
}

init
eval $1
