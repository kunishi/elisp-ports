#!/bin/sh
# $Id: build.sh,v 1.1 2003/07/04 07:19:58 kunishi Exp $

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.ai.univie.ac.at/~markus/ocaml_sources/pcre-ocaml-5.03.3.tar.gz'
WRKSRC="${WRKDIR}/pcre-ocaml-5.03.3"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=false

case `uname` in
    'FreeBSD')
	INCDIRS=${BASEDIR}/pcre/include
	LIBDIRS=${BASEDIR}/pcre/lib
	;;
    *)
	INCDIRS=${BASEDIR}/include
	LIBDIRS=${BASEDIR}/lib
esac

build_target () {
    : targets for non-Emacsen ports
    echo ${INCDIRS}
    (cd ${WRKSRC}; env INCDIRS=${INCDIRS} LIBDIRS=${LIBDIRS} ${GMAKE})
}

install_target () {
    : install targets for non-Emacsen ports
    (cd ${WRKSRC}; ${GMAKE} uninstall install)
}

init
eval $1
