#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.yatex.org/yatex1.71.tar.gz'
WRKSRC=${WRKDIR}/yatex1.71
USE_EMACS=true
ELC_SHAREABLE=true

build_emacs () {
:
}

install_emacs () {
    (cd ${WRKSRC}; \
	make EMACS=${emacs} PREFIX=${EMACS_PREFIX} EMACSDIR=${EMACS_PREFIX}/share/emacs/ install)
    install-info --dir-file=${INFODIR}/dir \
	--info-file=${INFODIR}/yatexj \
	--entry='* YaTeX: (yatexj).	Yet Another tex-mode for Emacs. (Japanese).' \
	--section='Miscellaneous'
    install-info --dir-file=${INFODIR}/dir \
	--info-file=${INFODIR}/yatexe \
	--entry='* YaTeX-e: (yatexe).	Yet Another tex-mode for Emacs. (English).' \
	--section='Miscellaneous'
    install-info --dir-file=${INFODIR}/dir \
	--info-file=${INFODIR}/yahtmlj \
	--entry='* yahtml: (yahtmlj).	Yet Another HTML-mode for Emacs. (Japanese).' \
	--section='Miscellaneous'
    install-info --dir-file=${INFODIR}/dir \
	--info-file=${INFODIR}/yahtmle \
	--entry='* yahtml-e: (yahtmle).	Yet Another HTML-mode for Emacs. (English).' \
	--section='Miscellaneous'
}

init
eval $1
