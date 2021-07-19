#!/bin/bash
echo "Usage: ./scripts/boot.sh"
echo "Add -s -S if want to debug with gdb"

if [ "`dirname $0`/`basename $0`" -ef "scripts/boot.sh" ]; then
	echo -n ""
else
	START=`realpath $0`
	START=`dirname $START`
	START=`dirname $START`
	echo "ERROR: please run the script from topdir: $START"
	exit
fi

# "console=null" for disabling the console
OUTPUT=demo_bin
if [ "`uname -m`" = "aarch64" ]; then
	QEMU=$OUTPUT/for_aarch64_host/qemu-system-riscv64
else
	QEMU=$OUTPUT/qemu-system-riscv64
fi
#APPEND="rootwait root=/dev/vda ro"
APPEND="rootwait root=/dev/vda ro console=null"
$QEMU -M virt -m 512M -smp 2									\
        -bios $OUTPUT/fw_jump.bin								\
        -kernel $OUTPUT/Image									\
        -append "$APPEND"									\
	-drive file=$OUTPUT/rootfs.ext2,format=raw,id=hd0					\
	-device virtio-blk-device,drive=hd0							\
	-netdev user,id=net0,hostfwd=::2222-:22 -device virtio-net-device,netdev=net0 -nographic $*
