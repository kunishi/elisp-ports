#!/bin/sh

. ../${CONFIG_SH:-config.sh}
. ../target.sh

PKG_TOPDIR=`pwd`

DISTFILES='ftp://ftp.m17n.org/pub/mule/Mule-UCS/test/Mule-UCS-current.tar.gz'
WRKSRC="${WRKDIR}/Mule-UCS-current"
USE_EMACS=true
ELC_SHAREABLE=false

#patch_dist () {
#    local tats_patch='mule-ucs-0.84+tats20021216.diff'
#    cp ${DISTDIR}/${tats_patch}.gz ${WRKSRC}
#    gunzip ${WRKSRC}/${tats_patch}.gz
#    (cd ${WRKSRC}; patch -p1 -N < ${tats_patch})
#}

build_emacs () {
    (cd ${WRKSRC}/lisp/big5conv; \
	${emacs} ${EMACS_COMPILE_ARGS} -l big5-comp.el)
    (cd ${WRKSRC}/lisp/jisx0213; \
	${emacs} ${EMACS_COMPILE_ARGS} -l x0213-comp.el)
    (cd ${WRKSRC}; \
	${emacs} ${EMACS_COMPILE_ARGS} -l mucs-comp.el)
}

install_emacs () {
    local sitelispdir=${VERSION_SPECIFIC_SITELISPDIR}
    mkdir -p ${sitelispdir}/mule-ucs
    (cd ${WRKSRC}/lisp; \
	for dir in . big5conv jisx0213;	do \
	mkdir -p ${sitelispdir}/mule-ucs/${dir}; \
	cp -p ${dir}/*.el ${sitelispdir}/mule-ucs/${dir}; \
	cp -p ${dir}/*.elc ${sitelispdir}/mule-ucs/${dir}; \
	done)
    mkdir -p ${sitelispdir}/mule-ucs/reldata
    cp -p ${WRKSRC}/lisp/reldata/*.el ${sitelispdir}/mule-ucs/reldata
    rm ${sitelispdir}/mule-ucs/big5conv/big5-comp.el
    rm ${sitelispdir}/mule-ucs/jisx0213/x0213-comp.el
}

install_init () {
    [ ! -d ${EMACS_INIT_D} ] && mkdir -p ${EMACS_INIT_D}
    cp -p dotemacs.el ${EMACS_INIT_D}/mule-ucs-init.el
}

init
eval $1
