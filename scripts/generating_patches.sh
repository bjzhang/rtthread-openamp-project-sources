#!/bin/bash

set -e
set -x

PKG=$1
PKG_SRC_DIR=$2
PKG_DIR=$3
PKG_UPSTREAM=$4

cd $START_DIR

if [ "$PKG_DIR" = "" ]; then
	echo "FATAL: $PKG directory $PKG_DIR is empty"
	exit
fi
if [ "$PKG_SRC_DIR" = "" ]; then
	echo "FATAL: $PKG directory $PKG_SRC_DIR is empty"
	exit
fi
cd $PKG_SRC_DIR
rm -f $PKG_DIR/0*.patch
echo "Output patches to $PKG dir"
git format-patch $PKG_UPSTREAM --output-directory $PKG_DIR
cd $PKG_DIR
echo "Create the new series"
rm -f series
ls --color=none 0*.patch > series

