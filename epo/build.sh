#!/bin/sh

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://www.yatex.org/epo/epo-1.4e.tar.gz'
WRKSRC="${WRKDIR}/epo-1.4e"
#PATCHFILES='If you have some official patch, write them'
USE_EMACS=true
ELC_SHAREABLE=true

. ../target.sh

build_emacs () {
:
}

install_emacs () {
    (cd ${WRKSRC}; \
	make EMACS=${emacs} PREFIX=${BASEDIR} EMACSDIR=${BASEDIR}/share/emacs install)
    install-info --section='Miscellaneous' \
	--entry='* EPO: (epoj).	EPO - Editing Process Organizer (Japanese).' \
	${BASEDIR}/info/epoj ${BASEDIR}/info/dir
}

init
eval $1
