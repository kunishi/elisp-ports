#!/bin/sh
# $Id: build.sh,v 1.2 2003/06/02 03:10:46 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://www.apache.org/dist/ant/binaries/apache-ant-1.5.4-bin.zip'
WRKSRC="${WRKDIR}/apache-ant-1.5.4"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

. ../target.sh

build_target () {
    : targets for non-Emacsen ports
}

install_target () {
    : install targets for non-Emacsen ports
    install_java apache-ant-1.5.4 apache-ant
    rm -f ${BASEDIR}/bin/ant && \
	ln -s ${BASEDIR}/share/java/apache-ant/bin/ant ${BASEDIR}/bin/ant
}

init
eval $1
