################################################################################
# python-gt7-simdash
################################################################################

# Always pull latest from main
PYTHON_GT7_SIMDASH_SITE_METHOD = git
PYTHON_GT7_SIMDASH_SITE = https://github.com/chrshdl/gt7-simdash.git
PYTHON_GT7_SIMDASH_VERSION = main

PYTHON_GT7_SIMDASH_LICENSE = MIT
PYTHON_GT7_SIMDASH_LICENSE_FILES = LICENSE

PYTHON_GT7_SIMDASH_SETUP_TYPE = pep517

# strip VCS pins for granturismo or salsa20, so pip
# doesn't try to fetch them during target build.
define PYTHON_GT7_SIMDASH_SANITIZE_DEPS
	$(SED) 's/"\s*granturismo\s*@\s*git+[^"]*"/"granturismo"/' $(@D)/pyproject.toml
	$(SED) 's/"\s*salsa20\s*@\s*git+[^"]*"/"salsa20"/' $(@D)/pyproject.toml
endef
PYTHON_GT7_SIMDASH_POST_PATCH_HOOKS += PYTHON_GT7_SIMDASH_SANITIZE_DEPS

define PYTHON_GT7_SIMDASH_INSTALL_INIT_SYSTEMD
	$(INSTALL) -D -m 0644 $(BR2_EXTERNAL)/package/python-gt7-simdash/gt7-simdash.service \
		$(TARGET_DIR)/usr/lib/systemd/system/gt7-simdash.service
	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
	ln -sf /usr/lib/systemd/system/gt7-simdash.service \
		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/gt7-simdash.service
endef


$(eval $(python-package))
