#
# $Id: target.sh,v 1.8 2002/12/10 14:19:55 kunishi Exp $
#

init () {
    local file
    for url in ${DISTFILES}
    do
      file=`echo ${url} | sed -e 's|.*/||g'`
      srcs="${srcs} ${file}"
    done
}      

fetch () {
    local file
    for url in ${DISTFILES}
    do
      file=`echo ${url} | sed -e 's|.*/||g'`
      if [ ! -f ${DISTDIR}/${file} ]; then
	  (cd ${DISTDIR}; wget ${url})
      fi
    done
    if [ "${PATCHFILES}" != '' ]; then
	for url in ${PATCHFILES}
	do
	  file=`echo ${url} | sed -e 's|.*/||g'`
	  if [ ! -f ${DISTDIR}/${file} ]; then
	      (cd ${DISTDIR}; wget ${url})
	  fi
	done
    fi
}

refetch () {
    for file in ${srcs}
    do
      rm -f ${DISTDIR}/${file}
    done
    fetch
}

extract () {
    mkdir ${WRKDIR}
    for file in ${srcs}
    do
      if [ `basename ${file} .tar.gz` != "${file}" ]; then
	  (cd ${WRKDIR}; tar xzf ${DISTDIR}/${file})
	  continue
      fi
      if [ `basename ${file} .tgz` != "${file}" ]; then
	  (cd ${WRKDIR}; tar xzf ${DISTDIR}/${file})
	  continue
      fi
      if [ `basename ${file} .tar.bz2` != "${file}" ]; then
	  (cd ${WRKDIR}; bzcat ${DISTDIR}/${file} | tar xf -)
	  continue
      fi
      if [ `basename ${file} .zip` != "${file}" ]; then
	  (cd ${WRKDIR}; unzip ${DISTDIR}/${file})
	  continue
      fi
      cp ${DISTDIR}/${file} ${WRKDIR}
    done
}

patch_emacs () {
    if [ "${PATCHFILES}" != '' ]; then
	patch_dist
    fi
    if [ -f ${PKG_TOPDIR}/${PATCHDIR}/patch-common ]; then
	(cd ${WRKSRC}; patch -p1 -N < ${PKG_TOPDIR}/${PATCHDIR}/patch-common)
    fi
    if [ -f ${PKG_TOPDIR}/${PATCHDIR}/patch-emacs ]; then
	(cd ${WRKSRC}; patch -p1 -N < ${PKG_TOPDIR}/${PATCHDIR}/patch-emacs)
    fi
}

clean () {
    rm -rf ${WRKDIR}
}

build () {
    local emacs_ver version_num
    fetch
    if [ "${ELC_SHAREABLE}" = 'true' ]; then
	emacs="${PREFERRED_FSF_EMACS}"
	emacs_ver=`basename "${emacs}"`
	version_num=`echo ${emacs_ver} | sed -e 's|.*-\(.*\)|\1|'`
	clean
	extract
	patch_emacs
	echo "Building with emacs_ver=${emacs_ver} version_num=${version_num}"
	build_emacs
	if [ "${do_install}" = 'true' ]; then
	    echo "Installing with emacs_ver=${emacs_ver}"
	    install_emacs
	fi
    else
	for emacs in ${FSF_EMACSEN}
	  do
	  emacs_ver=`basename "${emacs}"`
	  version_num=`echo ${emacs_ver} | sed -e 's|.*-\(.*\)|\1|'`
	  clean
	  extract
	  patch_emacs
	  echo "Building with emacs_ver=${emacs_ver} version_num=${version_num}"
	  build_emacs
	  if [ "${do_install}" = 'true' ]; then
	      echo "Installing with emacs_ver=${emacs_ver}"
	      install_emacs
	  fi
	done
    fi
}

install () {
    local do_install=true
    build
}

distclean () {
    for file in ${srcs}
    do
      rm -f ${DISTDIR}/${file}
    done
}
