#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/11 08:58:15 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.w3.org/TR/2002/REC-xhtml1-20020801/xhtml1.tgz'
WRKSRC="${WRKDIR}/xhtml1-20020801/DTD"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

DIST_BASEURI="http://www.w3.org/TR/xhtml1/DTD/"
LOCAL_BASEURI="file://${BASEDIR}/share/xml/xhtml1-20020801/"

build_target () {
    : targets for non-Emacsen ports
    sed -e "s|${DIST_BASEURI}|${LOCAL_BASEURI}|" \
	< ${PKG_TOPDIR}/xhtml10.xml > ${WRKSRC}/xhtml10.catalog.xml
}

install_target () {
    : install targets for non-Emacsen ports
    install_xml xhtml1-20020801 xhtml1
}

init
eval $1
