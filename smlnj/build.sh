#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/02 00:07:36 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='ftp://ftp.research.bell-labs.com/dist/smlnj/working/110.42/config.tgz'
WRKSRC="${WRKDIR}"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

. ../target.sh

build_target () {
    : targets for non-Emacsen ports
    (cd ${WRKSRC}; config/install.sh)
}

install_target () {
    : install targets for non-Emacsen ports
    mkdir -p ${BASEDIR}/smlnj-110.42
    (cd ${WRKSRC}; tar cf - .) | (cd ${BASEDIR}/smlnj-110.42; tar xfBp -)
    rm -f ${BASEDIR}/bin/sml
    ln -s ${BASEDIR}/smlnj-110.42/bin/sml ${BASEDIR}/bin/sml
}

init
eval $1
