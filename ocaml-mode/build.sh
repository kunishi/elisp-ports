#!/bin/sh

. ../config.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://wwwfun.kurims.kyoto-u.ac.jp/soft/olabl/dist/ocaml-mode-3.01.tar.gz'
WRKSRC=${WRKDIR}/ocaml-mode-3.01
ELC_SHAREABLE=true

. ../target.sh

build_emacs () {
:
}

install_emacs () {
    (cd ${WRKSRC}; \
	make EMACS=${emacs} \
	     EMACSDIR=${BASEDIR}/share/emacs/site-lisp/ocaml-mode \
	     install install-ocamltags)
}

init
eval $1
