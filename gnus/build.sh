#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES=http://quimby.gnus.org/gnus/dist/gnus-5.10.2.tar.gz
WRKSRC="${WRKDIR}/gnus-5.10.2"
USE_EMACS=true
ELC_SHAREABLE=true

build_emacs () {
    (cd ${WRKSRC}; \
	./configure --prefix=${EMACS_PREFIX} \
	    --with-emacs=${emacs} \
	    --with-etcdir=${EMACS_PREFIX}/etc/gnus \
	    --with-lispdir=${SITELISPDIR}/gnus \
	    --infodir=${INFODIR})
    (cd ${WRKSRC}; ${GMAKE})
}

install_emacs () {
    (cd ${WRKSRC}; ${GMAKE} install)
}

init
eval $1
