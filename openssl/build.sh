#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.openssl.org/source/openssl-0.9.7b.tar.gz'
WRKSRC="${WRKDIR}/openssl-0.9.7b"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

build_target () {
    : targets for non-Emacsen ports
    (cd ${WRKSRC}; \
	./config --prefix=${BASEDIR} --openssldir=${BASEDIR}/openssl)
    (cd ${WRKSRC}; make)
}

install_target () {
    : install targets for non-Emacsen ports
    (cd ${WRKSRC}; make install)
}

init
eval $1
