#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/02 02:35:11 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://xml.apache.org/dist/crimson/crimson-1.1.3-bin.tar.gz'
WRKSRC="${WRKDIR}/crimson-1.1.3"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

. ../target.sh

build_target () {
    : targets for non-Emacsen ports
}

install_target () {
    : install targets for non-Emacsen ports
    mkdir -p ${BASEDIR}/share/java/crimson-1.1.3
    (cd ${WRKSRC}; tar cvf - .) | \
	(cd ${BASEDIR}/share/java/crimson-1.1.3; tar xfBp -)
    rm -f ${BASEDIR}/share/java/crimson
    ln -s crimson-1.1.3 ${BASEDIR}/share/java/crimson
}

init
eval $1
