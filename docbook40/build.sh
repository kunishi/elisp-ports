#!/bin/sh
# $Id: build.sh,v 1.3 2003/06/17 06:51:20 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.oasis-open.org/docbook/xml/4.0/docbkx40.zip'
WRKSRC="${WRKDIR}"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

DIST_BASEURI="http://www.oasis-open.org/docbook/xml/4.0/"
LOCAL_BASEURI="file://${BASEDIR}/share/xml/docbook-4.0/"

build_target () {
    : targets for non-Emacsen ports
    sed -e "s|${DIST_BASEURI}|${LOCAL_BASEURI}|" \
	< ${PKG_TOPDIR}/docbook40.catalog.xml > ${WRKSRC}/docbook40.catalog.xml
}

install_target () {
    : install targets for non-Emacsen ports
    install_xml docbook-4.0
    if [ -f ${BASEDIR}/bin/xmlcatmgr ]; then
	xmlcatmgr add public '-//USA-DOD//DTD Table Model 951010//EN' docbook-4.0/calstblx.mod
	xmlcatmgr add public '-//OASIS//ENTITIES DocBook XML Character Entities V4.0//EN' docbook-4.0/dbcentx.mod
	xmlcatmgr add public '-//OASIS//ENTITIES DocBook Additional General Entities V4.0//EN' docbook-4.0/dbgenent.ent
	xmlcatmgr add public '-//OASIS//ELEMENTS DocBook XML Document Hierarchy V4.0//EN' docbook-4.0/dbhierx.mod
	xmlcatmgr add public '-//OASIS//ENTITIES DocBook XML Notations V4.0//EN' docbook-4.0/dbnotnx.mod
	xmlcatmgr add public '-//OASIS//ELEMENTS DocBook XML Information Pool V4.0//EN' docbook-4.0/dbpoolx.mod
	xmlcatmgr add public '-//OASIS//DTD DocBook XML V4.0//EN' docbook-4.0/docbookx.dtd
	xmlcatmgr add public '-//OASIS//DTD XML Exchange Table Model 19990315//EN' docbook-4.0/soextblx.dtd
    fi
}

init
eval $1
