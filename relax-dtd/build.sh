#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/12 04:55:06 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.xml.gr.jp/relax/relaxCore.dtd http://www.xml.gr.jp/relax/datatypes.dtd http://www.chorusroom.org/~kunishi/distfiles/relaxNamespace.dtd'
WRKSRC="${WRKDIR}"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

build_target () {
    : targets for non-Emacsen ports
    local trangjar=${BASEDIR}/share/java/trang/trang.jar
    if [ -f ${trangjar} ]; then
	(cd ${WRKSRC}; \
	    java -jar ${trangjar} -I dtd -O rng relaxCore.dtd relaxCore.rng; \
	    java -jar ${trangjar} -I dtd -O rng relaxNamespace.dtd relaxNamespace.rng; \
	    java -jar ${trangjar} -I dtd -O rnc relaxCore.dtd relaxCore.rnc; \
	    java -jar ${trangjar} -I dtd -O rnc relaxNamespace.dtd relaxNamespace.rnc)
    fi
}

install_target () {
    : install targets for non-Emacsen ports
    install_xml relaxDtd
}

init
eval $1
