#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='ftp://ftp.gohome.org/wl/stable/wl-2.10.1.tar.gz'
WRKSRC="${WRKDIR}/wl-2.10.1"
USE_EMACS=true
ELC_SHAREABLE=true

build_emacs () {
    (cd ${WRKSRC}; \
	make EMACS=${emacs} PIXMAPDIR=${EMACS_PREFIX}/etc/wl elc info)
}

install_emacs () {
    (cd ${WRKSRC}; \
	make EMACS=${emacs} \
	     PIXMAPDIR=${EMACS_PREFIX}/etc/wl \
	     INFODIR=${INFODIR} \
	     LISPDIR=${SITELISPDIR} install install-info)
    install-info --dir-file=${INFODIR}/dir --info-file=${INFODIR}/wl-ja.info
    install-info --dir-file=${INFODIR}/dir --info-file=${INFODIR}/wl.info
}

init
eval $1
