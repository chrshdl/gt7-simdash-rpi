################################################################################
# gt7-simdash Buildroot Package
################################################################################

GT7_SIMDASH_VERSION = main
GT7_SIMDASH_SITE = https://github.com/chrshdl/gt7-simdash.git
GT7_SIMDASH_SITE_METHOD = git

GT7_SIMDASH_DEPENDENCIES = python3 python-pygame

define GT7_SIMDASH_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) \
		$(TARGET_DIR)/usr/bin/pip3 install --no-cache-dir --prefix=/usr --root=$(TARGET_DIR) -r $(@D)/requirements.txt $(@D)
endef

$(eval $(generic-package))

