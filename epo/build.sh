#!/bin/sh

. ../config.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.yatex.org/epo/epo-1.4e.tar.gz'
WRKSRC=${WRKDIR}/epo-1.4e
#PATCHFILES='If you have some official patch, write them'
ELC_SHAREABLE=true

. ../target.sh

build-emacs () {
# do nothing
}

install-emacs () {
    (cd ${WRKSRC}; \
	make EMACS=${BASEDIR}/${emacs_ver}/bin/emacs \
	     EMACSDIR=${BASEDIR}/share/emacs install)
    install-info --section='Miscellaneous' \
	--entry='* EPO: (epoj).	EPO - Editing Process Organizer (Japanese).' \
	${BASEDIR}/info/epoj ${BASEDIR}/info/dir
}

init
eval $1
