################################################################################
#
# open-amp configuration. It make use of cmake.
#
################################################################################

OPENAMP_VERSION = devel
OPENAMP_SITE = ${BR2_EXTERNAL_OPENAMP_PROJECT_PATH}/port_linux/open-amp-src
OPENAMP_SITE_METHOD = local
OPENAMP_LICENSE = GPL-2.0+
OPENAMP_LICENSE_FILES = Copyright COPYING
OPENAMP_DEPENDENCIES = libsysfs
OPENAMP_CONF_OPTS = -DCMAKE_TOOLCHAIN_FILE=rv64_linux_cross_toolchain_file -DCMAKE_C_FLAGS="-ggdb" -DCMAKE_SYSROOT=$(shell $(TARGET_CC) --print-sysroot) -DLIBMETAL_LIB_DIR=$(BASE_TARGET_DIR)/usr/lib -DLIBMETAL_LIB=$(BASE_TARGET_DIR)/usr/lib/libmetal.so -DLIBMETAL_INCLUDE_DIR=$(BASE_TARGET_DIR)/usr/include

$(eval $(cmake-package))
