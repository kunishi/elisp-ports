#!/bin/sh

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTURL="http://caml.inria.fr/distrib/ocaml-3.06"
DISTFILES="${DISTURL}/ocaml-3.06.tar.gz ${DISTURL}/ocaml-3.06-refman.pdf \
${DISTURL}/ocaml-3.06-refman.ps.gz ${DISTURL}/ocaml-3.06-refman.dvi.gz \
${DISTURL}/ocaml-3.06-refman.html.tar.gz"
WRKSRC="${WRKDIR}/ocaml-3.06"
USE_EMACS=false

if [ `uname -s` = 'Darwin' ]; then
    PATCHFILES="${DISTURL}/ocaml-3.06-macosx-5.patch"
fi

. ../target.sh

if [ `uname -s` = 'Darwin' ]; then
    patch_dist () {
	(cd ${WRKSRC}; ${PATCH} -p0 -N < ${DISTDIR}/ocaml-3.06-macosx-5.patch)
    }
fi

build_target () {
    (cd ${WRKSRC}; ./configure)
    if [ `uname -s` = 'Darwin' ]; then
	(cd ${WRKSRC}; ulimit -s 1536; make world.opt)
    else
	(cd ${WRKSRC}; make world.opt)
    fi
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
