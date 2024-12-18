@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
setlocal
REM go to the folder where this bat script is located
cd /d %~dp0

set TARGET=%1
set TOOLCHAIN=%2

if not defined TARGET SET TARGET=Nucleo_STM32F446
if not defined TOOLCHAIN SET TOOLCHAIN=GCC

if %TOOLCHAIN% NEQ GCC (
    if %TOOLCHAIN% NEQ CLANG (
        if %TOOLCHAIN% NEQ AC6 goto INVALIDTOOLCHAIN
    )
)

rem cpackget update-index

IF %TARGET% == clean goto CLEAN

echo Building firmware for %TARGET% using %TOOLCHAIN% toolchain
cbuild .\stm32.csolution.yml --context-set --update-rte --packs --context stm32.Debug+%TARGET% --toolchain %TOOLCHAIN%
exit

:CLEAN
echo Cleaning
cbuild.exe .\stm32.csolution.yml --context-set --update-rte --packs --context stm32 -C
exit

:INVALIDTOOLCHAIN

echo %TOOLCHAIN% not valid!
exit \b 1
