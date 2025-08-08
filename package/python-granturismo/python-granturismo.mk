################################################################################
# python-granturismo: Gran Turismo Telemetry Python library
################################################################################

PYTHON_GRANTURISMO_VERSION = cb46493
PYTHON_GRANTURISMO_SITE = https://github.com/chrshdl/granturismo.git
PYTHON_GRANTURISMO_SITE_METHOD = git
PYTHON_GRANTURISMO_LICENSE = MIT
PYTHON_GRANTURISMO_LICENSE_FILES = LICENSE
PYTHON_GRANTURISMO_SETUP_TYPE = pep517

#PYTHON_GRANTURISMO_BUILD_OPTS += --skip-dependency-check

$(eval $(python-package))
