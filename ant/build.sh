#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/01 14:38:51 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://www.apache.org/dist/ant/binaries/apache-ant-1.5.3-1-bin.zip'
WRKSRC="${WRKDIR}/apache-ant-1.5.3-1"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

. ../target.sh

build_target () {
    : targets for non-Emacsen ports
}

install_target () {
    : install targets for non-Emacsen ports
    (cd ${WRKDIR}; tar cf - apache-ant-1.5.3-1) | \
	(cd ${BASEDIR}/share/java; tar xfBp -)
    rm -f ${BASEDIR}/share/java/apache-ant && \
	ln -s apache-ant-1.5.3-1 ${BASEDIR}/share/java/apache-ant
    rm -f ${BASEDIR}/bin/ant && \
	ln -s ${BASEDIR}/share/java/apache-ant/bin/ant ${BASEDIR}/bin/ant
}

init
eval $1
