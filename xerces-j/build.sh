#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/02 00:27:37 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://xml.apache.org/dist/xerces-j/Xerces-J-bin.2.4.0.zip'
WRKSRC="${WRKDIR}/xerces-2_4_0"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

. ../target.sh

build_target () {
    : targets for non-Emacsen ports
}

install_target () {
    : install targets for non-Emacsen ports
    mkdir -p ${BASEDIR}/share/java/xerces-j-2.4.0
    (cd ${WRKSRC}; tar cvf - .) | \
	(cd ${BASEDIR}/share/java/xerces-j-2.4.0; tar xfBp -)
    rm -f ${BASEDIR}/share/java/xerces-j
    ln -s xerces-j-2.4.0 ${BASEDIR}/share/java/xerces-j
}

init
eval $1
