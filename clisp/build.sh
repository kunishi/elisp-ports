#!/bin/sh
# $Id: build.sh,v 1.1 2003/06/01 12:34:25 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://us.dl.sourceforge.net/clisp/clisp-2.30.tar.bz2'
WRKSRC="${WRKDIR}/clisp-2.30"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

. ../target.sh

if [ `uname -s` = 'Darwin' ]; then
    CONFIG_SHELL=/bin/bash
    CONFIGURE_ARGS='--without-dynamic-ffi'
fi

build_target () {
    : targets for non-Emacsen ports
    (cd ${WRKSRC}; ${CONFIG_SHELL} ./configure ${CONFIGURE_ARGS})
    if [ `uname -s` = 'Darwin' ]; then
	(cd ${WRKSRC}/src; ./makemake \
	    | sed -e 's|-O2|-no-cpp-precomp|' -e 's|--traditional-cpp||' \
	    > Makefile)
    else
	(cd ${WRKSRC}/src; ./makemake > Makefile)
    fi
    (cd ${WRKSRC}/src; make config.lisp)
    if [ `uname -s` = 'Darwin' ]; then
	(cd ${WRKSRC}/src; ulimit -S -s 8192; make)
    else
	(cd ${WRKSRC}/src; make)
    fi
    (cd ${WRKSRC}/src; make check)
}

install_target () {
    : install targets for non-Emacsen ports
    (cd ${WRKSRC}/src; make install)
}

init
eval $1
