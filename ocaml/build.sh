#!/bin/sh

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTURL="http://caml.inria.fr/distrib/ocaml-3.06"
DISTFILES="${DISTURL}/ocaml-3.06.tar.gz ${DISTURL}/ocaml-3.06-refman.pdf \
${DISTURL}/ocaml-3.06-refman.ps.gz ${DISTURL}/ocaml-3.06-refman.dvi.gz \
${DISTURL}/ocaml-3.06-refman.html.tar.gz"
WRKSRC="${WRKDIR}/ocaml-3.06"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

. ../target.sh

build_target () {
    (cd ${WRKSRC}; ./configure)
    (cd ${WRKSRC}; make world.opt)
}

install_target () {
    (cd ${WRKSRC}; make install)
    mkdir -p ${BASEDIR}/share/doc/ocaml-3.06
    cp -rp ${WRKDIR}/htmlman ${BASEDIR}/share/doc/ocaml-3.06
    cp -p ${WRKDIR}/ocaml-3.06-refman.pdf ${BASEDIR}/share/doc/ocaml-3.06
    ${GZCAT} ${WRKDIR}/ocaml-3.06-refman.ps.gz > \
	${BASEDIR}/share/doc/ocaml-3.06/ocaml-3.06-refman.ps
    ${GZCAT} ${WRKDIR}/ocaml-3.06-refman.dvi.gz > \
	${BASEDIR}/share/doc/ocaml-3.06/ocaml-3.06-refman.dvi
}

init
eval $1
