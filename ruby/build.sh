#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='ftp://ftp.ruby-lang.org/pub/ruby/ruby-1.6.8.tar.gz'
WRKSRC="${WRKDIR}/ruby-1.6.8"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

build_target () {
    : targets for non-Emacsen ports
    (cd ${WRKSRC}; ./configure)
    (cd ${WRKSRC}; make)
    (cd ${WRKSRC}; make test)
}

install_target () {
    : install targets for non-Emacsen ports
    (cd ${WRKSRC}; make install)
}

init
eval $1
