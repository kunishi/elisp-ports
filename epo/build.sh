#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.yatex.org/epo/epo-1.4h.tar.gz'
WRKSRC="${WRKDIR}/epo-1.4h"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=true
ELC_SHAREABLE=true

build_emacs () {
:
}

install_emacs () {
    (cd ${WRKSRC}; \
	make EMACS=${emacs} PREFIX=${EMACS_PREFIX} \
	     LISPDIR=${SITELISPDIR}/epo HELPDIR=${SITELISPDIR} \
	     INFODIR=${INFODIR} install)
    install-info --section='Miscellaneous' \
	--entry='* EPO: (epoj).	EPO - Editing Process Organizer (Japanese).' \
	${INFODIR}/epoj ${INFODIR}/dir
}

install_init () {
    [ ! -d ${EMACS_INIT_D} ] && mkdir -p ${EMACS_INIT_D}
    cp -p dotemacs.el ${EMACS_INIT_D}/epo-init.el
}

init
eval $1
