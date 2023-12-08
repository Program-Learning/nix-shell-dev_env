mkdir toolchains
cd toolchains
wget https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/+archive/refs/heads/android13-release/clang-r450784d.tar.gz
mkdir clang-aosp
tar -C clang-aosp/ -zxvf clang-r450784d.tar.gz
mkdir gcc-64
wget -O gcc-aarch64.tar.gz https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/+archive/refs/tags/android-13.0.0_r0.102.tar.gz
tar -C gcc-64/ -zxvf gcc-aarch64.tar.gz
mkdir gcc-32
wget -O gcc-arm.tar.gz https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/+archive/refs/tags/android-13.0.0_r0.102.tar.gz
tar -C gcc-32/ -zxvf gcc-arm.tar.gz
git clone https://android.googlesource.com/platform/system/tools/mkbootimg tools -b master-kernel-build-2022 --depth=1