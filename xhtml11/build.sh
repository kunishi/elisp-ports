#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/11 09:56:26 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.w3.org/TR/2001/REC-xhtml11-20010531/xhtml11.tgz'
WRKSRC="${WRKDIR}/xhtml11-20010531/DTD"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

DIST_BASEURI="http://www.w3.org/TR/xhtml11/DTD/"
LOCAL_BASEURI="file://${BASEDIR}/share/xml/xhtml11-20010531/"

build_target () {
    : targets for non-Emacsen ports
    sed -e "s|${DIST_BASEURI}|${LOCAL_BASEURI}|" \
	< ${PKG_TOPDIR}/xhtml11.catalog.xml > ${WRKSRC}/xhtml11.catalog.xml
}

install_target () {
    : install targets for non-Emacsen ports
    install_xml xhtml11-20010531 xhtml11
}

init
eval $1
