#!/bin/bash

set -e

TARGET_DIR=$1
BUILDROOT_DIR=`pwd`
cd $BUILDROOT_DIR/../port_rtt/rt-thread-src/bsp/riscv64-virt
pkgs --update
pushd packages/libmetal-latest/
bash -x ../../../../../../scripts/libmetal-pre-configure.sh
popd
scons
cp -p rtthread.elf $TARGET_DIR/root
