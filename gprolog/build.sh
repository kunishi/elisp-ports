#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/01 15:13:31 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTURL='ftp://ftp.inria.fr/INRIA/Projects/contraintes/gprolog'
DISTFILES="${DISTURL}/gprolog-1.2.16.tar.gz ${DISTURL}/manual-html.tar.gz ${DISTURL}/manual.pdf.gz"
WRKSRC="${WRKDIR}/gprolog-1.2.16"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

. ../target.sh

build_target () {
    : targets for non-Emacsen ports
    (cd ${WRKSRC}/src; ./configure)
    (cd ${WRKSRC}/src; make)
}

install_target () {
    : install targets for non-Emacsen ports
    (cd ${WRKSRC}/src; make install)
    mkdir -p ${BASEDIR}/share/doc/gprolog-1.2.16
    (cd ${WRKDIR}; tar cf - manual-html) | \
	(cd ${BASEDIR}/share/doc/gprolog-1.2.16; tar xfBp -)
    ${GZCAT} ${WRKDIR}/manual.pdf.gz \
	> ${BASEDIR}/share/doc/gprolog-1.2.16/manual.pdf
}

init
eval $1
