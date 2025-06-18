#!/bin/bash

DTS_FILE="dtbs/mt6761-duoqin-f21-pro.dts"
DTB_OUT_DIR="build/dtbs"
BUILD_DIR="build/kernel"
KERNEL_DIR="kernel/linux"

CROSS_COMPILE="aarch64-linux-gnu-"
ARCH="arm64"

echo "Building DTS -> DTB"
dtc -I dts -O dtb -o "$DTB_OUT_DIR/mt6761-duoqin-f21-pro.dtb" "$DTS_FILE"

echo "Building kernel"
make -C "$KERNEL_DIR" O="$PWD/$BUILD_DIR" ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE -j$(nproc)

echo "Kernel image: $BUILD_DIR/arch/arm64/boot/Image"
echo "DTB:          $DTB_OUT_DIR/mt6761-duoqin-f21-pro.dtb"
