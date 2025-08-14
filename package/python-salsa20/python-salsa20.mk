################################################################################
#
# python-salsa20
#
################################################################################

PYTHON_SALSA20_VERSION = bd496e0
PYTHON_SALSA20_SITE = https://github.com/chrshdl/python-salsa20.git
PYTHON_SALSA20_SITE_METHOD = git
PYTHON_SALSA20_LICENSE =  BSD-3-Clause
PYTHON_SALSA20_LICENSE_FILES = LICENSE
PYTHON_SALSA20_SETUP_TYPE = setuptools

$(eval $(python-package))
