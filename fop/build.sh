#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/02 02:40:34 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://xml.apache.org/dist/fop/fop-0.20.5rc3a-bin.tar.gz'
WRKSRC="${WRKDIR}/fop-0.20.5rc3a"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

. ../target.sh

build_target () {
    : targets for non-Emacsen ports
}

install_target () {
    : install targets for non-Emacsen ports
    mkdir -p ${BASEDIR}/share/java/fop-0.20.5rc3a
    (cd ${WRKSRC}; tar cvf - .) | \
	(cd ${BASEDIR}/share/java/fop-0.20.5rc3a; tar xfBp -)
    rm -f ${BASEDIR}/share/java/fop
    ln -s fop-0.20.5rc3a ${BASEDIR}/share/java/fop
}

init
eval $1
