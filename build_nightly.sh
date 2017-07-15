#!/usr/bin/env bash
DIR=$(dirname $(realpath -s $BASH_SOURCE))
OUT_FOLDER=$DIR/export
rm -rf "${OUT_FOLDER}"/*

pushd /
    rm -rf pi-gen || true
    git clone https://github.com/RPi-Distro/pi-gen.git
    echo "IMG_NAME='Raspbian'" > pi-gen/config
    touch pi-gen/stage3/SKIP pi-gen/stage4/SKIP pi-gen/stage5/SKIP
    rm pi-gen/stage4/EXPORT*
popd

pushd /pi-gen
    git pull origin dev
    # docker rm -v pigen_work || true
    # ./build-docker.sh
    sudo ./build.sh
popd

IMG_OUT_PATH=$(find /pi-gen/deploy -name '*.zip' | head -n 1)
if [ -e "${IMG_OUT_PATH}" ]; then
    cp -v ${IMG_OUT_PATH} ${OUT_FOLDER}
    pushd ${OUT_FOLDER}
        md5sum $(basename "${IMG_OUT_PATH}") > $(basename "${IMG_OUT_PATH}").md5
    popd
fi
