#!/bin/sh

. ../config.sh

PKG_TOPDIR=`pwd`

DISTFILES='ftp://ftp.gohome.org/wl/stable/wl-2.8.1.tar.gz'
WRKSRC=${WRKDIR}/wl-2.8.1
ELC_SHAREABLE=true

. ../target.sh

build_emacs () {
    (cd ${WRKSRC}; \
	make EMACS=${emacs} PIXMAPDIR=${BASEDIR}/share/wanderlust elc info)
}

install_emacs () {
    (cd ${WRKSRC}; \
	make EMACS=${emacs} \
	     PIXMAPDIR=${BASEDIR}/share/wanderlust \
	     INFODIR=${BASEDIR}/info install install-info)
    install-info --dir-file=${BASEDIR}/info/dir --info-file=${BASEDIR}/info/wl-ja.info
    install-info --dir-file=${BASEDIR}/info/dir --info-file=${BASEDIR}/info/wl.info
}

init
eval $1
