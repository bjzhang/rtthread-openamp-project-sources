#!/bin/bash

set -x
set -e

START_DIR=`pwd`
SCRIPT_DIR=`dirname $0`
SCRIPT_DIR=`realpath $SCRIPT_DIR`
TOP_DIR=`dirname $SCRIPT_DIR`
if [ "$TOP_DIR" = "" ]; then
	echo FATAL: top dir should not empty.
	exit
fi
OPENSBI_SRC_DIR=$TOP_DIR/buildroot/opensbi-src
OPENSBI_DIR=$TOP_DIR/buildroot/opensbi
if [ "$OPENSBI_DIR" = "" ]; then
	echo "FATAL: opensbi directory $OPENSBI_DIR is empty"
	exit
fi
if [ "$OPENSBI_SRC_DIR" = "" ]; then
	echo "FATAL: opensbi directory $OPENSBI_SRC_DIR is empty"
	exit
fi
cd $OPENSBI_SRC_DIR
rm -f $OPENSBI_DIR/0*.patch
echo "Output patches to opensbi dir"
$SCRIPT_DIR/generating_patches.sh 234ed8e --output-directory $OPENSBI_DIR
cd $OPENSBI_DIR
echo "Create the new series"
rm -f series
ls --color=none 0*.patch > series

cd $START_DIR
