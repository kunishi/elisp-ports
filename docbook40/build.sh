#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/12 02:49:40 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://www.oasis-open.org/docbook/xml/4.0/docbkx40.zip'
WRKSRC="${WRKDIR}"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

DIST_BASEURI="http://www.oasis-open.org/docbook/xml/4.0/"
LOCAL_BASEURI="file://${BASEDIR}/share/xml/docbook-4.0/"

. ../target.sh

build_target () {
    : targets for non-Emacsen ports
    sed -e "s|${DIST_BASEURI}|${LOCAL_BASEURI}|" \
	< ${PKG_TOPDIR}/docbook40.catalog.xml > ${WRKSRC}/docbook40.catalog.xml
}

install_target () {
    : install targets for non-Emacsen ports
    install_xml docbook-4.0
}

init
eval $1
