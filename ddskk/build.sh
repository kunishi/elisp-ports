#!/bin/sh

. ../config.sh

PKG_TOPDIR=`pwd`

DISTFILES='http://openlab.ring.gr.jp/skk/maintrunk/ddskk11.6.0.tar.bz2'
WRKSRC=${WRKDIR}/ddskk-11.6.0
ELC_SHAREABLE=false
EMACSEN='emacs-20.7 emacs-21.3.50 emacs-21.2'

. ../target.sh

build-emacs () {
    (cd ${WRKSRC}; make EMACS=${BASEDIR}/${emacs_ver}/bin/emacs elc)
}

install-emacs () {
    (cd ${WRKSRC}; make EMACS=${BASEDIR}/${emacs_ver}/bin/emacs install)
}

init
eval $1
