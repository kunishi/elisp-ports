#!/bin/sh
# $Id: build.sh,v 1.2 2003/06/02 03:10:46 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.apache.org/dist/ant/binaries/apache-ant-1.6.1-bin.zip'
WRKSRC="${WRKDIR}/apache-ant-1.6.1"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

build_target () {
    : targets for non-Emacsen ports
}

install_target () {
    : install targets for non-Emacsen ports
    install_java apache-ant-1.6.0 apache-ant
    rm -f ${BASEDIR}/bin/ant
    if [ ${SYSTEM} = 'win32' ]; then
	cp ${BASEDIR}/share/java/apache-ant-1.6.1/bin/ant.bat ${BASEDIR}/bin
    else
	ln -s ${BASEDIR}/share/java/apache-ant/bin/ant ${BASEDIR}/bin/ant
    fi
}

init
eval $1
