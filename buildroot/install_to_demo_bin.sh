#/bin/bash

# Notes
# HOST_DIR is the location of host tools which is passed by buildroot.
# TODO make the script could run without buildroot. One could check $1 if it is end with images to know if it is called in buildroot images script. Is there reliable way to know whether it is run in buildroot?

set -e

IMAGE_DIR=$1
DEMO_BIN=$BASE_DIR/../../demo_bin

if [ "`uname -m`" = "aarch64" ]; then
HOST_DST_DIR=$DEMO_BIN/for_aarch64_host
else
HOST_DST_DIR=$DEMO_BIN
fi
mkdir -p $HOST_DST_DIR
cp -p $HOST_DIR/bin/qemu-system-riscv64 $HOST_DST_DIR
cp -p $IMAGE_DIR/fw_jump.* $DEMO_BIN/
cp -p $IMAGE_DIR/rootfs.ext2 $DEMO_BIN/
cp -p $IMAGE_DIR/Image $DEMO_BIN/
cp -p $IMAGE_DIR/fw_jump.elf $DEMO_BIN/
cp -p $IMAGE_DIR/fw_jump.bin $DEMO_BIN/
