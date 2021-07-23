#!/bin/bash

set -x
set -e

PKG=qemu
PKG_UPSTREAM=61f3c91a67
PKG_DIR=qemu
PKG_SRC_DIR=qemu-src

START_DIR=`pwd`
SCRIPT_DIR=`dirname $0`
SCRIPT_DIR=`realpath $SCRIPT_DIR`
TOP_DIR=`dirname $SCRIPT_DIR`

if [ "$TOP_DIR" = "" ]; then
	echo FATAL: top dir should not empty.
	exit
fi

$SCRIPT_DIR/generating_patches.sh $PKG $TOP_DIR/$PKG_SRC_DIR $TOP_DIR/$PKG_DIR $PKG_UPSTREAM
