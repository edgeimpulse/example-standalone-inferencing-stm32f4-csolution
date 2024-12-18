#!/bin/bash
set -e
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

TARGET=$1

if [ -z "$TARGET" ]; then
    TARGET="Nucleo_STM32F446"
fi

csolution stm32.csolution.yml run --generator CubeMX --context stm32.Debug+${TARGET}
