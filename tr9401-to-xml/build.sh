#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/11 09:45:17 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.chorusroom.org/~kunishi/distfiles/tr9401-to-xml.pl'
WRKSRC="${WRKDIR}"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

build_target () {
    : targets for non-Emacsen ports
    chmod 755 ${WRKSRC}/tr9401-to-xml.pl
}

install_target () {
    : install targets for non-Emacsen ports
    cp ${WRKSRC}/tr9401-to-xml.pl ${BASEDIR}/bin
}

init
eval $1
