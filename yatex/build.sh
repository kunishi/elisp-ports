#!/bin/sh

. ../${CONFIG_SH:-config.sh}

PKG_TOPDIR=`pwd`

DISTFILES='http://www.yatex.org/yatex1.71.tar.gz'
WRKSRC=${WRKDIR}/yatex1.71
USE_EMACS=true
ELC_SHAREABLE=true

. ../target.sh

build_emacs () {
:
}

install_emacs () {
    (cd ${WRKSRC}; \
	make EMACS=${emacs} PREFIX=${BASEDIR} EMACSDIR=${BASEDIR}/share/emacs/ install)
    install-info --dir-file=${BASEDIR}/info/dir \
	--info-file=${BASEDIR}/info/yatexj \
	--entry='* YaTeX: (yatexj).	Yet Another tex-mode for Emacs. (Japanese).' \
	--section='Miscellaneous'
    install-info --dir-file=${BASEDIR}/info/dir \
	--info-file=${BASEDIR}/info/yatexe \
	--entry='* YaTeX-e: (yatexe).	Yet Another tex-mode for Emacs. (English).' \
	--section='Miscellaneous'
    install-info --dir-file=${BASEDIR}/info/dir \
	--info-file=${BASEDIR}/info/yahtmlj \
	--entry='* yahtml: (yahtmlj).	Yet Another HTML-mode for Emacs. (Japanese).' \
	--section='Miscellaneous'
    install-info --dir-file=${BASEDIR}/info/dir \
	--info-file=${BASEDIR}/info/yahtmle \
	--entry='* yahtml-e: (yahtmle).	Yet Another HTML-mode for Emacs. (English).' \
	--section='Miscellaneous'
}

init
eval $1
