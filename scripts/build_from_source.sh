#!/bin/bash

START_DIR=`pwd`
SCRIPT_DIR=`dirname $0`
SCRIPT_DIR=`realpath $SCRIPT_DIR`
TOP_DIR=`dirname $SCRIPT_DIR`
cd $TOP_DIR/buildroot-src

make BR2_EXTERNAL=../ qemu_riscv64_virt_defconfig
../scripts/merge_config.sh .config ../buildroot/buildroot-frag-config


