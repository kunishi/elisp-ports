#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/12 06:56:43 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://us.dl.sourceforge.net/docbook/docbook-xsl-1.61.2.tar.gz'
WRKSRC="${WRKDIR}/docbook-xsl-1.61.2"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

. ../target.sh

build_target () {
    : targets for non-Emacsen ports
}

install_target () {
    : install targets for non-Emacsen ports
    mkdir -p ${BASEDIR}/share/docbook/xsl
    (cd ${WRKSRC}; ${GTAR} cvf - .) | \
	(cd ${BASEDIR}/share/docbook/xsl; ${GTAR} xfBp -)
}

init
eval $1
