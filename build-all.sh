#!/bin/sh

case `uname` in
CYGWIN*)
	EXEC_SHELL=bash
	;;
*)
	SUDO=sudo
	EXEC_SHELL=/bin/sh
	;;
esac

for pkg in `cat $1`
do
    echo Installing $pkg
    (cd $pkg; \
	env CONFIG_SH=${CONFIG_SH} $EXEC_SHELL ./build.sh build; \
	env CONFIG_SH=${CONFIG_SH} $SUDO $EXEC_SHELL ./build.sh install; \
	env CONFIG_SH=${CONFIG_SH} $EXEC_SHELL ./build.sh clean)
done
