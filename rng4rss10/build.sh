#!/bin/sh
# $Id: build.sh.sample,v 1.4 2003/05/31 07:07:09 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.horobi.com/xml/RNG4RSS10/rss-1_0.rng'
WRKSRC="${WRKDIR}"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

build_target () {
    : targets for non-Emacsen ports
    local trang_jar=${BASEDIR}/share/java/trang/trang.jar
    (cd ${WRKSRC}; \
	java -jar ${trang_jar} -I rng -O rnc rss-1_0.rng rss-1_0.rnc)
}

install_target () {
    : install targets for non-Emacsen ports
    install_xml rng4rss10
}

init
eval $1
