#!/bin/sh
# $Id: build.sh,v 1.2 2003/06/01 14:23:45 kunishi Exp $

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://us.dl.sourceforge.net/clisp/clisp-2.30.tar.bz2'
WRKSRC="${WRKDIR}/clisp-2.30"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

. ../target.sh

build_target () {
    : targets for non-Emacsen ports
    (cd ${WRKSRC}; ./configure build)
    if [ `uname -s` = 'Darwin' ]; then
	(cd ${WRKSRC}/build; ./makemake debug \
	    | sed -e 's|--traditional-cpp|-no-cpp-precomp|' > Makefile)
    else
	(cd ${WRKSRC}/build; ./makemake > Makefile)
    fi
    (cd ${WRKSRC}/src; make config.lisp)
    if [ `uname -s` = 'Darwin' ]; then
	(cd ${WRKSRC}/build; ulimit -S -s 8192; make)
    else
	(cd ${WRKSRC}/build; make)
    fi
    (cd ${WRKSRC}/build; make check)
}

install_target () {
    : install targets for non-Emacsen ports
    (cd ${WRKSRC}/build; make install)
}

init
eval $1
