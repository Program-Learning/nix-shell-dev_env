export DEV_DIR=$(dirname "$(readlink -f "$0")")
cd $DEV_DIR || yes
export PATH=$DEV_DIR/toolchains/clang-aosp/bin:$PATH
export GCC_32=CROSS_COMPILE_ARM32=$DEV_DIR/toolchains/gcc-32/bin/arm-linux-androideabi-
export GCC_64=CROSS_COMPILE=$DEV_DIR/toolchains/gcc-64/bin/aarch64-linux-android-
export KERNEL_SOURCE=https://github.com/Nobooooody/android_kernel_motorola_sm8250
export KERNEL_SOURCE_BRANCH=0warning0error_lineage-20
export KERNEL_CONFIG=vendor/lineageos_pstar_lxc_docker_defconfig
export KERNEL_IMAGE_NAME=Image
export ARCH=arm64
export EXTRA_CMDS="LD=ld.lld LOCALVERSION=-test_kernel"

# Clang
## Custom
export USE_CUSTOM_CLANG=false
export CUSTOM_CLANG_SOURCE=
export CUSTOM_CLANG_BRANCH=

### if your set USE CUSTOM CLANG to false than DO NOT CHANGE CUSTOM CMDS
export CUSTOM_CMDS="CLANG_TRIPLE=aarch64-linux-gnu-"

## AOSP
export CLANG_BRANCH=android13-release	
export CLANG_VERSION=r450784d

# GCC
export ENABLE_GCC_ARM64=true
export ENABLE_GCC_ARM32=false

# KernelSU flags
export ENABLE_KERNELSU=true
export KERNELSU_TAG=main

# Configuration
export DISABLE_CC_WERROR=false
export ADD_KPROBES_CONFIG=true
export ADD_OVERLAYFS_CONFIG=false

# Ccache
export ENABLE_CCACHE=true

# DTBO image
export NEED_DTBO=false

# Build boot images
export BUILD_BOOT_IMG=true
export SOURCE_BOOT_IMAGE=https://mirrorbits.lineageos.org/full/pstar/20230530/boot.img
make -j$(nproc --all) CC=clang O=out ARCH=$ARCH $EXTRA_CMDS $CUSTOM_CMDS $GCC_64 $GCC_32 $KERNEL_CONFIG
make -j$(nproc --all) CC=clang O=out ARCH=$ARCH $EXTRA_CMDS $CUSTOM_CMDS $GCC_64 $GCC_32
