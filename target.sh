#
# $Id: target.sh,v 1.9 2003/05/31 04:43:50 kunishi Exp $
#

### common targets

init () {
    local file
    for url in ${DISTFILES}
      do
      file=`echo ${url} | sed -e 's|.*/||g'`
      srcs="${srcs} ${file}"
    done
    if [ "${PATCHFILES}" != '' ]; then 
	for url in ${PATCHFILES}
	  do
	  file=`echo ${url} | sed -e 's|.*/||g'`
	  distpatch="${patch} ${file}"
	done
    fi
}      

fetch () {
    local file
    [ ! -d ${DISTDIR} ] && mkdir -p ${DISTDIR}
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
    distclean
    fetch
}

extract () {
    mkdir -p ${WRKDIR}
    for file in ${srcs}
      do
      case `basename ${file}` in
	  *.tar.gz|*.tgz)
	      (cd ${WRKDIR}; zcat ${DISTDIR}/${file} | tar xvf -)
	      continue
	      ;;
	  *.tar.bz2)
	      (cd ${WRKDIR}; bzcat ${DISTDIR}/${file} | tar xvf -)
	      continue
	      ;;
	  *.zip)
	      unzip -d ${WRKDIR} ${DISTDIR}/${file}
	      continue
	      ;;
	  *)
	      cp ${DISTDIR}/${file} ${WRKDIR}
	      continue
	      ;;
      esac
    done
}

patch () {
    if [ "${PATCHFILES}" != '' ]; then
	patch_dist
    fi
    for patch in ${PKG_TOPDIR}/${PATCHDIR}/patch*; do
	[ -f ${PKG_TOPDIR}/${PATCHDIR}/${patch} ] && \
	    (cd ${WRKSRC}; patch -p0 -N < ${PKG_TOPDIR}/${PATCHDIR}/${patch})
    done
}

build () {
    if [ "${USE_EMACS}" = 'true' ]; then
	build_emacsen
    else
	fetch
	clean
	extract
	patch
	build_target
    fi
}

all () {
    build
}

install () {
    if [ "${USE_EMACS}" = 'true' ]; then
	install_emacsen
    else
	install_target
    fi
}

clean () {
    rm -rf ${WRKDIR}
}

distclean () {
    for file in ${srcs} ${distpatch}
      do
      rm -f ${DISTDIR}/${file}
    done
}

### targets for Emacsen packages

build_emacsen () {
    local emacs_ver version_num
    fetch
    if [ "${ELC_SHAREABLE}" = 'true' ]; then
	emacs="${PREFERRED_FSF_EMACS}"
	emacs_ver=`basename "${emacs}"`
	version_num=`echo ${emacs_ver} | sed -e 's|.*-\(.*\)|\1|'`
	clean
	extract
	patch
	echo "Building with emacs_ver=${emacs_ver} version_num=${version_num}"
	build_emacs
    else
	for emacs in ${FSF_EMACSEN}
	  do
	  emacs_ver=`basename "${emacs}"`
	  version_num=`echo ${emacs_ver} | sed -e 's|.*-\(.*\)|\1|'`
	  clean
	  extract
	  patch
	  echo "Building with emacs_ver=${emacs_ver} version_num=${version_num}"
	  build_emacs
	done
    fi
}

install_emacsen () {
    local emacs_ver version_num
    if [ "${ELC_SHAREABLE}" = 'true' ]; then
	emacs="${PREFERRED_FSF_EMACS}"
	emacs_ver=`basename "${emacs}"`
	version_num=`echo ${emacs_ver} | sed -e 's|.*-\(.*\)|\1|'`
	install_emacs
    else
	for emacs in ${FSF_EMACSEN}; do
	    emacs_ver=`basename "${emacs}"`
	    version_num=`echo ${emacs_ver} | sed -e 's|.*-\(.*\)|\1|'`
	    install_emacs
	done
    fi
}
