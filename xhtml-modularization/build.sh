#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/11 09:41:36 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://www.w3.org/TR/2001/REC-xhtml-modularization-20010410/xhtml-modularization.tgz'
WRKSRC="${WRKDIR}/xhtml-modularization-20010410/DTD"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

DIST_BASEURI="http://www.w3.org/TR/xhtml-modularization/DTD/"
LOCAL_BASEURI="file://${BASEDIR}/share/xml/xhtml-modularization-20010410/"

. ../target.sh

build_target () {
    : targets for non-Emacsen ports
    sed -e "s|${DIST_BASEURI}|${LOCAL_BASEURI}|" \
	< ${PKG_TOPDIR}/xhtml-modularization.catalog.xml \
	> ${WRKSRC}/xhtml-modularization.catalog.xml
}

install_target () {
    : install targets for non-Emacsen ports
    install_xml xhtml-modularization-20010410 xhtml-modularization
}

init
eval $1
