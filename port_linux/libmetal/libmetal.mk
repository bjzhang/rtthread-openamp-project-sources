################################################################################
#
# libmetal configuration. It make use of cmake.
#
################################################################################

LIBMETAL_VERSION = devel
LIBMETAL_SITE = ${BR2_EXTERNAL_OPENAMP_PROJECT_PATH}/port_linux/libmetal-src
LIBMETAL_SITE_METHOD = local
LIBMETAL_LICENSE = GPL-2.0+
LIBMETAL_LICENSE_FILES = Copyright COPYING
LIBMETAL_DEPENDENCIES = libsysfs
LIBMETAL_CONF_OPTS = -DCMAKE_TOOLCHAIN_FILE=rv64_linux_cross_toolchain_file -DCMAKE_C_FLAGS="-ggdb" -DCMAKE_SYSROOT=$(shell $(TARGET_CC) --print-sysroot) -DWITH_EXAMPLES=ON

$(eval $(cmake-package))
