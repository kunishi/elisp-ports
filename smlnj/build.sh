#!/bin/sh
# $Id: build.sh,v 1.2 2003/06/02 14:05:14 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='ftp://ftp.research.bell-labs.com/dist/smlnj/working/110.42/config.tgz'
WRKSRC="${WRKDIR}"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

build () {
    : all build process are done by install_target phase.
}

build_target () {
    : targets for non-Emacsen ports
}

install_target () {
    : install targets for non-Emacsen ports
    mkdir -p ${BASEDIR}/smlnj-110.42
    (cd ${BASEDIR}/smlnj-110.42; \
	${GZCAT} ${DISTDIR}/config.tgz | ${GTAR} xvf -; \
	config/install.sh)
    rm -f ${BASEDIR}/bin/sml
    ln -s ${BASEDIR}/smlnj-110.42/bin/sml ${BASEDIR}/bin/sml
}

init
eval $1
