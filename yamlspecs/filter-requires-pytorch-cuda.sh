#!/bin/bash
#
# remove erroneous requirements

/usr/lib/rpm/find-requires $* | sed  \
    -e '/(libnvToolsExt.so.1)(64bit)/d' \
    -e '/(libcusparse.so.10)(64bit)/d' \
    -e '/(libcurand.so.10)(64bit)/d' \
    -e '/(libnvrtc.so.10.1)(64bit)/d' \
    -e '/(libcufft.so.10)(64bit)/d' \
    -e '/(libcudart.so.10.1)(64bit)/d'
