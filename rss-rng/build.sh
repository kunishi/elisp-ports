#!/bin/sh
# $Id: build.sh.sample,v 1.4 2003/05/31 07:07:09 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.w3.org/2002/09/rss-rng/dc.rng http://www.w3.org/2002/09/rss-rng/rss.rng http://www.w3.org/2002/09/rss-rng/test.rss'
WRKSRC="${WRKDIR}/"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

build_target () {
    : targets for non-Emacsen ports
    local trangjar=${BASEDIR}/share/java/trang/trang.jar
    (cd ${WRKSRC}; \
	java -jar ${trangjar} -I rng -O rnc dc.rng dc.rnc)
}

install_target () {
    : install targets for non-Emacsen ports
    install_xml rss-rng
}

init
eval $1
