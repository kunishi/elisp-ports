#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://wwwfun.kurims.kyoto-u.ac.jp/soft/olabl/dist/ocaml-mode-3.01.tar.gz'
WRKSRC="${WRKDIR}/ocaml-mode-3.01"
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

init
eval $1
