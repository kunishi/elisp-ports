#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/02 03:38:44 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://www.relaxer.org/download/beta.zip'
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
    java -jar ${DISTDIR}/beta.zip setup
    chmod 755 ${BASEDIR}/bin/relaxer
}

init
eval $1
