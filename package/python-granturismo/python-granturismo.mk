################################################################################
# python-granturismo: Gran Turismo Telemetry Python library
################################################################################

PYTHON_GRANTURISMO_VERSION = 0d9d174
PYTHON_GRANTURISMO_SITE = https://github.com/chrshdl/granturismo.git
PYTHON_GRANTURISMO_SITE_METHOD = git
PYTHON_GRANTURISMO_LICENSE = MIT
PYTHON_GRANTURISMO_LICENSE_FILES = LICENSE

PYTHON_GRANTURISMO_SETUP_TYPE = pep517

PYTHON_GRANTURISMO_DEPENDENCIES = \
    python-salsa20 \
    python-marshmallow-dataclass

$(eval $(python-package))
