#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://www.gentei.org/~yuuji/tmp/yatex10609301333.tar.gz'
WRKSRC=${WRKDIR}/yatex1.72.zv
USE_EMACS=true
ELC_SHAREABLE=true

build_emacs () {
:
}

install_emacs () {
    (cd ${WRKSRC}; \
	make EMACS=${emacs} PREFIX=${EMACS_PREFIX} \
	     LISPDIR=${SITELISPDIR}/yatex HELPDIR=${SITELISPDIR} \
	     INFODIR=${INFODIR} install)
    ${INSTALL_INFO} --dir-file=${INFODIR}/dir \
	--info-file=${INFODIR}/yatexj \
	--entry='* YaTeX: (yatexj).	Yet Another tex-mode for Emacs. (Japanese).' \
	--section='Miscellaneous'
    ${INSTALL_INFO} --dir-file=${INFODIR}/dir \
	--info-file=${INFODIR}/yatexe \
	--entry='* YaTeX-e: (yatexe).	Yet Another tex-mode for Emacs. (English).' \
	--section='Miscellaneous'
    ${INSTALL_INFO} --dir-file=${INFODIR}/dir \
	--info-file=${INFODIR}/yahtmlj \
	--entry='* yahtml: (yahtmlj).	Yet Another HTML-mode for Emacs. (Japanese).' \
	--section='Miscellaneous'
    ${INSTALL_INFO} --dir-file=${INFODIR}/dir \
	--info-file=${INFODIR}/yahtmle \
	--entry='* yahtml-e: (yahtmle).	Yet Another HTML-mode for Emacs. (English).' \
	--section='Miscellaneous'
}

install_init () {
    [ ! -d ${EMACS_INIT_D} ] && mkdir -p ${EMACS_INIT_D}
    cp -p dotemacs.el ${EMACS_INIT_D}/yatex-init.el
}

init
eval $1
