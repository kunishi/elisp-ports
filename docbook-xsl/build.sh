#!/bin/sh
# $Id: build.sh,v 1.2 2003/06/23 08:10:39 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://us.dl.sourceforge.net/docbook/docbook-xsl-1.61.3.tar.gz'
WRKSRC="${WRKDIR}/docbook-xsl-1.61.3"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

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
