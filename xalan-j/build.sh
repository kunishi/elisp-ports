#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/02 02:29:52 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://xml.apache.org/dist/xalan-j/xalan-j_2_5_0-bin.zip'
WRKSRC="${WRKDIR}/xalan-j_2_5_0"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

. ../target.sh

build_target () {
    : targets for non-Emacsen ports
}

install_target () {
    : install targets for non-Emacsen ports
    mkdir -p ${BASEDIR}/share/java/xalan-j-2.5.0
    (cd ${WRKSRC}; tar cvf - .) | \
	(cd ${BASEDIR}/share/java/xalan-j-2.5.0; tar xfBp -)
    rm -f ${BASEDIR}/share/java/xalan-j
    ln -s xalan-j-2.5.0 ${BASEDIR}/share/java/xalan-j
}

init
eval $1
