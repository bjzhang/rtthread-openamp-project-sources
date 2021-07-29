#!/bin/bash

START_DIR=`pwd`
SCRIPT_DIR=`dirname $0`
SCRIPT_DIR=`realpath $SCRIPT_DIR`

echo "Coping metal common headers"
HEADERS="alloc.h assert.h atomic.h cache.h compiler.h condition.h cpu.h device.h dma.h io.h irq_controller.h irq.h list.h log.h mutex.h shmem.h sleep.h softirq.h spinlock.h sys.h time.h utilities.h version.h"
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

echo "Creating rv64 libmetal config.h"
cp -p $SCRIPT_DIR/libmetal_config.h $HEADERS_COMPILING_LOCATION/config.h

echo "Coping compiler headers"
GCC_HEADERS="compiler.h atomic.h"
GCC_HEADERS_LOCATION=$HEADERS_LOCATION/compiler/gcc/
GCC_HEADERS_COMPILING_LOCATION=$HEADERS_COMPILING_LOCATION/compiler/gcc
mkdir -p $GCC_HEADERS_COMPILING_LOCATION
for f in $GCC_HEADERS; do
	if [ -f "$GCC_HEADERS_LOCATION/$f" ]; then
		cp -p $GCC_HEADERS_LOCATION/$f $GCC_HEADERS_COMPILING_LOCATION
	fi
done

echo "Coping processor headers"
PROCESSOR_HEADERS="cpu.h"
PROCESSOR_HEADERS_COMPILING_LOCATION=$HEADERS_COMPILING_LOCATION/processor/$PROJECT_PROCESSOR
mkdir -p $PROCESSOR_HEADERS_COMPILING_LOCATION
for f in $PROCESSOR_HEADERS; do
	cp -p lib/processor/$PROJECT_PROCESSOR/$f $PROCESSOR_HEADERS_COMPILING_LOCATION
done

echo "Coping rt-thread headers"
SYSTEM_HEADERS_COMPILING_LOCATION=$HEADERS_COMPILING_LOCATION/system/$PROJECT_SYSTEM
mkdir -p $SYSTEM_HEADERS_COMPILING_LOCATION
cp -p lib/system/$PROJECT_SYSTEM/*.h $SYSTEM_HEADERS_COMPILING_LOCATION
