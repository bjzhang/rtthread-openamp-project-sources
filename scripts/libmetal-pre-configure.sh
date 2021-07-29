#!/bin/bash

START_DIR=`pwd`
SCRIPT_DIR=`dirname $0`
SCRIPT_DIR=`realpath $SCRIPT_DIR`

HEADERS="alloc.h  assert.h  atomic.h  cache.h  compiler.h  condition.h  cpu.h  device.h  dma.h  io.h  irq_controller.h  irq.h  mutex.h  shmem.h  sleep.h  softirq.h  spinlock.h  time.h  utilities.h  version.h"
PROJECT_SYSTEM=rtthread
PROJECT_PROCESSOR=riscv
HEADERS_LOCATION=lib
HEADERS_COMPILING_LOCATION=lib/include/metal
mkdir -p $HEADERS_COMPILING_LOCATION
for f in $HEADERS; do
	if [ -f "$HEADERS_LOCATION/$f" ]; then
		cp -p $HEADERS_LOCATION/$f $HEADERS_COMPILING_LOCATION
		sed -i "s/@PROJECT_SYSTEM@/$PROJECT_SYSTEM/g" $HEADERS_COMPILING_LOCATION/$f;
		sed -i "s/@PROJECT_PROCESSOR@/$PROJECT_PROCESSOR/g" $HEADERS_COMPILING_LOCATION/$f;
	fi
done

cp -p $SCRIPT_DIR/libmetal_config.h $HEADERS_COMPILING_LOCATION/config.h

GCC_HEADERS="compiler.h atomic.h"
GCC_HEADERS_LOCATION=$HEADERS_LOCATION/compiler/gcc/
GCC_HEADERS_COMPILING_LOCATION=$HEADERS_COMPILING_LOCATION/compiler/gcc
mkdir -p $GCC_HEADERS_COMPILING_LOCATION
for f in $GCC_HEADERS; do
	if [ -f "$GCC_HEADERS_LOCATION/$f" ]; then
		cp -p $GCC_HEADERS_LOCATION/$f $GCC_HEADERS_COMPILING_LOCATION
	fi
done

