#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/11 09:25:43 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://www.w3.org/TR/2000/REC-xhtml-basic-20001219/xhtml-basic.tgz'
WRKSRC="${WRKDIR}/REC-xhtml-basic-20001219"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

DIST_BASEURI="http://www.w3.org/TR/xhtml-basic/"
LOCAL_BASEURI="file://${BASEDIR}/share/xml/xhtml-basic-20001219"

. ../target.sh

build_target () {
    : targets for non-Emacsen ports
    sed -e "s|${DIST_BASEURI}|${LOCAL_BASEURI}|" \
	< ${PKG_TOPDIR}/xhtml-basic10.xml > ${WRKSRC}/xhtml-basic10.catalog.xml
}

install_target () {
    : install targets for non-Emacsen ports
    install_xml xhtml-basic-20001219 xhtml-basic
}

init
eval $1
