#!/bin/sh
# $Id: build.sh,v 1.3 2003/06/03 12:02:13 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://us.dl.sourceforge.net/sourceforge/gauche/Gauche-0.7.1.tgz'
WRKSRC="${WRKDIR}/Gauche-0.7.1"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

if [ `uname -s` = 'Darwin' ]; then
    CONFIGURE_ARGS='--with-iconv=/usr/local --with-iconv-lib=iconv'
fi

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
