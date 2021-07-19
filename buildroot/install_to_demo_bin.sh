#/bin/bash

set -e

# TODO make the script could run without buildroot. One could check $1 if it is end with images to know if it is called in buildroot images script. Is there reliable way to know whether it is run in buildroot?
IMAGE_DIR=$1
DEMO_BIN=$BASE_DIR/../../demo_bin

mkdir -p $DEMO_BIN/for_aarch64_host
cp -p $HOST_DIR/bin/qemu-system-riscv64 $DEMO_BIN/for_aarch64_host/
cp -p $IMAGE_DIR/fw_jump.* $DEMO_BIN/
cp -p $IMAGE_DIR/rootfs.ext2 $DEMO_BIN/
cp -p $IMAGE_DIR/Image $DEMO_BIN/
cp -p $IMAGE_DIR/fw_jump.elf $DEMO_BIN/
cp -p $IMAGE_DIR/fw_jump.bin $DEMO_BIN/

#echo "Copying libmetal and open-amp"
#mkdir -p $DEMO_BIN/OpenAMP/bin
#mkdir -p $DEMO_BIN/OpenAMP/lib
#
#cp -p $TARGET_DIR/usr/lib/libmetal.so* $DEMO_BIN/OpenAMP/lib
#cp -p $TARGET_DIR/usr/bin/shm_demo-share $DEMO_BIN/OpenAMP/bin
#
#cp -p $TARGET_DIR/usr/lib/libopen_amp.so.* $DEMO_BIN/OpenAMP/lib
#cp -p $TARGET_DIR/usr/bin/load_fw-shared $DEMO_BIN/OpenAMP/bin
#cp -p $TARGET_DIR/usr/bin/rpmsg-sample-ping-shared $DEMO_BIN/OpenAMP/bin
#cp -p $TARGET_DIR/usr/bin/matrix_multiply-shared $DEMO_BIN/OpenAMP/bin
#cp -p $TARGET_DIR/usr/bin/msg-test-rpmsg-ping-shared $DEMO_BIN/OpenAMP/bin
#cp -p $TARGET_DIR/usr/bin/msg-test-rpmsg-update-shared $DEMO_BIN/OpenAMP/bin
#cp -p $TARGET_DIR/usr/bin/msg-test-rpmsg-flood-ping-shared $DEMO_BIN/OpenAMP/bin
