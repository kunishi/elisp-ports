#!/bin/sh
# $Id: build.sh,v 1.2 2003/07/05 05:09:48 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://swissnet.ai.mit.edu/ftpdir/scm/slib2d6.zip'
WRKSRC="${WRKDIR}/slib"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

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
