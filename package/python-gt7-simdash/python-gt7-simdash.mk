################################################################################
# python-gt7-simdash: Gran Turismo 7 Instrument Cluster (Simdash)
################################################################################

PYTHON_GT7_SIMDASH_VERSION = main
PYTHON_GT7_SIMDASH_SITE    = $(call github, chrshdl, gt7-simdash, $(PYTHON_GT7_SIMDASH_VERSION))
PYTHON_GT7_SIMDASH_LICENSE = MIT
PYTHON_GT7_SIMDASH_LICENSE_FILES = LICENSE

PYTHON_GT7_SIMDASH_DEPENDENCIES = \
    python-granturismo \
    python-pygame \
    python-salsa20 \
    python-marshmallow-dataclass \
    python-marshmallow-enum \
    python-marshmallow

PYTHON_GT7_SIMDASH_SETUP_TYPE = pep517

$(eval $(python-package))
