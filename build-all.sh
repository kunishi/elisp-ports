#!/bin/sh

for pkg in `cat default-packages`
do
    echo Installing $pkg
    (cd $pkg; \
	env CONFIG_SH=${CONFIG_SH} sudo ./build.sh install; \
	env CONFIG_SH=${CONFIG_SH} sudo ./build.sh clean)
done