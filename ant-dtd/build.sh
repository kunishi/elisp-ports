#!/bin/sh
# $Id: build.sh.sample,v 1.4 2003/05/31 07:07:09 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.sdv.fr/pages/casa/arc/ant-dtd.zip'
WRKSRC="${WRKDIR}"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

build_target () {
    : targets for non-Emacsen ports
    local trangjar=${BASEDIR}/share/java/trang/trang.jar
    if [ -f ${trangjar} ]; then
	(cd ${WRKSRC}; \
	    java -jar ${trangjar} -I dtd -O rng project.dtd project.rng; \
	    java -jar ${trangjar} -I dtd -O rnc project.dtd project.rnc)
    fi
}

install_target () {
    : install targets for non-Emacsen ports
    install_xml ant-dtd
}

init
eval $1
