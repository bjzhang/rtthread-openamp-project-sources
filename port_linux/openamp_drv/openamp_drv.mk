################################################################################
#
# Linux OpenAMP driver
#
################################################################################

OPENAMP_DRV_VERSION = devel
OPENAMP_DRV_SITE = ${BR2_EXTERNAL_OPENAMP_PROJECT_PATH}/port_linux/openamp_drv
OPENAMP_DRV_SITE_METHOD = local
OPENAMP_DRV_LICENSE = GPL-2.0
OPENAMP_DRV_LICENSE_FILES = COPYING

$(eval $(kernel-module))
$(eval $(generic-package))
