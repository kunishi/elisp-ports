#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES=http://quimby.gnus.org/gnus/dist/ngnus-0.1.tar.gz
WRKSRC="${WRKDIR}/ngnus-0.1"
USE_EMACS=true
ELC_SHAREABLE=true

build_emacs () {
    (cd ${WRKSRC}; \
	./configure --prefix=${EMACS_PREFIX} \
	    --with-emacs=${emacs} \
	    --with-etcdir=${EMACS_ETCDIR}/gnus \
	    --with-lispdir=${SITELISPDIR}/gnus \
	    --infodir=${INFODIR})
    (cd ${WRKSRC}; ${GMAKE})
}

install_emacs () {
    (cd ${WRKSRC}; ${GMAKE} install)
}

init
eval $1
