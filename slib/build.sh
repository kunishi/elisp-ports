#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/03 15:28:26 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://swissnet.ai.mit.edu/ftpdir/scm/slib2d5.zip'
WRKSRC="${WRKDIR}/slib"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

. ../target.sh

build_target () {
    : targets for non-Emacsen ports
}

install_target () {
    : install targets for non-Emacsen ports
    mkdir -p ${BASEDIR}/lib/slib
    (cd ${WRKSRC}; ${GTAR} cvf - .) | \
	(cd ${BASEDIR}/lib/slib; ${GTAR} xfBp -)
}

init
eval $1
