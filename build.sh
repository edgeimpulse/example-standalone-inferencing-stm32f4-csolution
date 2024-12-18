#!/bin/bash
set -e
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

TARGET=$1
TOOLCHAIN=$2

if [ -z "$TARGET" ]; then
    TARGET="Nucleo_STM32F446"
fi

if [ -z "$TOOLCHAIN" ]; then
    TOOLCHAIN="GCC"
fi

if [ "$TARGET" == "clean" ]; then
    echo "Cleaning build"
    cbuild ./stm32.csolution.yaml --context-set --update-rte --packs --context inferencing -C
    exit 0
else
    echo "Cleaning before building..."
    rm -rf ./build
    rm -rf ./RTE
    rm -f stm32.cbuild-idx.yml
    rm -f stm32.cbuild-pack.yml
    rm -f stm32.cbuild-set.yml
    echo "Building firmware for ${TARGET} using ${TOOLCHAIN} toolchain"
    cbuild ./stm32.csolution.yml --context-set --update-rte --packs --context stm32.Debug+${TARGET} --toolchain ${TOOLCHAIN}
fi
