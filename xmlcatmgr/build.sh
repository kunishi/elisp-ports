#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/17 05:55:01 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://us.dl.sourceforge.net/xmlcatmgr/xmlcatmgr-0.2.tar.gz'
WRKSRC="${WRKDIR}/xmlcatmgr-0.2"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

. ../target.sh

build_target () {
    : targets for non-Emacsen ports
    (cd ${WRKSRC}; \
	make -f Makefile.boot BT_DIR_CATALOG=${BASEDIR}/share/xml all)
}

install_target () {
    : install targets for non-Emacsen ports
    (cd ${WRKSRC}; \
	make -f Makefile.boot BT_DIR_CATALOG=${BASEDIR}/share/xml install)
}

init
eval $1
