#!/bin/sh
# $Id: build.sh,v 1.3 2003/07/14 03:45:50 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.relaxer.org/download/relaxer-1.0.zip'
WRKSRC="${WRKDIR}"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

build () {
    : nothing needed.
}

build_target () {
    : targets for non-Emacsen ports
}

install_target () {
    : install targets for non-Emacsen ports
    java -jar ${DISTDIR}/relaxer-1.0.zip setup
    chmod 755 ${BASEDIR}/bin/relaxer
}

init
eval $1
