#!/bin/bash


export PATH="$HOME/proton-clang/bin:$PATH"
export CC=clang
export CLANG_TRIPLE=aarch64-linux-gnu-
export CROSS_COMPILE=aarch64-linux-gnu-
export CROSS_COMPILE_ARM32=arm-linux-gnueabi-
export CONFIG_BUILD_ARM64_DT_OVERLAY=y

export ARCH=arm64
export SUBARCH=arm64
export DTC_EXT=dtc

if [ ! -d "out" ]; then
	mkdir out
fi

make ARCH=arm64 O=out CC=clang titan_defconfig
make ARCH=arm64 O=out CC=clang -j$(nproc) 2>&1 | tee kernel_log.txt
