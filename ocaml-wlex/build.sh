#!/bin/sh
# $Id: build.sh,v 1.1 2003/07/04 06:56:41 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://www.eleves.ens.fr/home/frisch/info/wlex-20021107.tar.gz http://caml.inria.fr/distrib/ocaml-3.06/ocaml-3.06.tar.gz'
WRKSRC="${WRKDIR}/wlex-20021107"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

. ../target.sh

build_target () {
    : targets for non-Emacsen ports
    (cd ${WRKSRC}; \
	${GMAKE} all OCAMLLEX_SRC=${PKG_TOPDIR}/${WRKDIR}/ocaml-3.06/lex)
}

install_target () {
    : install targets for non-Emacsen ports
    (cd ${WRKSRC}; ${GMAKE} uninstall && make install)
}

init
eval $1
