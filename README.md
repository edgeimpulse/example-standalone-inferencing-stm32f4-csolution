# Example standalone for STM32F4 Nucleo boards

Builds and runs an exported impulse locally for STM32F4 Nucelo boards.

Supported boards:
- Nucleo F446RE named Nucleo_STM32F446
- Nucleo F401RE named Nucleo_STM32F401

## Build
> [!IMPORTANT]
> To build and manage the project, you need to follow this guide on how to setup the [CMSIS-Toolbox](https://github.com/Open-CMSIS-Pack/cmsis-toolbox/blob/main/docs/README.md)

### Using Arm CMSIS Solution extension
Go to the CMSIS extension tab, and click the hammer icon.

### Using the script
Run the script with the target you want to build, default is Nucleo_STM32F446

ie to compile Nucleo_STM32F401:
```
build.sh Nucleo_STM32F401
```

## Flash

TODO

## Debug

For debugging, in settings.json set:
// "cortex-debug.armToolchainPath": Set me for debugging,
To point arm toolchain bin folder.

## Update model
To update your model, unizp the CMSIS pack deployment, install the packs using cpackget add <your_project_name>.pack and paste the model.layer.yml in the model folder.
