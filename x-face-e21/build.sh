#!/bin/sh

. ../config.sh

PKG_TOPDIR=`pwd`

DISTFILES='ftp://ftp.jpl.org/pub/elisp/x-face-e21.el.gz'
WRKSRC=${WRKDIR}
ELC_SHAREABLE=false

. ../target.sh

build-emacs () {
    cp ${DISTDIR}/x-face-e21.el.gz ${WRKSRC}
    gunzip ${WRKSRC}/x-face-e21.el.gz
    (cd ${WRKSRC}; \
	${BASEDIR}/${emacs_ver}/bin/emacs ${EMACS_COMPILE_ARGS} \
	    -f batch-byte-compile x-face-e21.el)
}

install-emacs () {
    cp -p ${WRKSRC}/x-face-e21.el ${BASEDIR}/share/emacs/${version_num}/site-lisp
    cp -p ${WRKSRC}/x-face-e21.elc ${BASEDIR}/share/emacs/${version_num}/site-lisp
}

init
eval $1
