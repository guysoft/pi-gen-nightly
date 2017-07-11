#!/usr/bin/env bash
DIR=$(dirname $(realpath -s $BASH_SOURCE))
OUT_FOLDER=$DIR/export
pushd ${DIR}/pi-gen
    git pull origin dev
    docker rm -v pigen_work
    ./build-docker.sh
popd

IMG_OUT_PATH=$(find /var/lib/docker -name '*Raspbian-lite.img' | head -n 1)
if [ -e "${IMG_OUT_PATH}" ]; then
    ZIP_OUT_TMP=$(basename ${IMG_OUT_PATH})
    ZIP_OUT=${OUT_FOLDER}/${ZIP_OUT_TMP::-4}.zip
    rm -rf ${OUT_FOLDER}
    mkdir -p ${OUT_FOLDER}
    pushd $(dirname ${IMG_OUT_PATH})
        zip "${ZIP_OUT}" $(basename "${IMG_OUT_PATH}")
    popd
    pushd $(dirname "${ZIP_OUT}")
        md5sum $(basename "${ZIP_OUT}") > $(basename "${ZIP_OUT}").md5
    popd
fi
