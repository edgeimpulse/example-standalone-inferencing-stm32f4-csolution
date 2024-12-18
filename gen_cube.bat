@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
setlocal
REM go to the folder where this bat script is located
cd /d %~dp0

set TARGET=%1

if not defined TARGET SET TARGET=Nucleo_STM32F446

csolution ./stm32.csolution.yml run --generator CubeMX --context stm32.Debug+%TARGET%
