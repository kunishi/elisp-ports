#!/bin/sh
# $Id: build.sh,v 1.2 2003/06/16 23:18:04 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://www.relaxer.org/download/setup.zip'
WRKSRC="${WRKDIR}"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

. ../target.sh

build () {
    : nothing needed.
}

build_target () {
    : targets for non-Emacsen ports
}

install_target () {
    : install targets for non-Emacsen ports
    java -jar ${DISTDIR}/setup.zip setup
    chmod 755 ${BASEDIR}/bin/relaxer
}

init
eval $1
