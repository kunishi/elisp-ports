#!/bin/sh
# $Id: build.sh,v 1.2 2003/06/01 12:34:25 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://us.dl.sourceforge.net/gauche/Gauche-0.6.8.tgz'
WRKSRC="${WRKDIR}/Gauche-0.6.8"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

if [ `uname -s` = 'Darwin' ]; then
    CONFIGURE_ARGS='--with-iconv=/usr/local --with-iconv-lib=iconv'
fi

. ../target.sh

build_target () {
    : targets for non-Emacsen ports
    (cd ${WRKSRC}; ./configure --enable-threads=pthreads ${CONFIGURE_ARGS})
    (cd ${WRKSRC}; make)
    (cd ${WRKSRC}; make test)
}

install_target () {
    : install targets for non-Emacsen ports
    (cd ${WRKSRC}; make install install-doc)
}

init
eval $1
