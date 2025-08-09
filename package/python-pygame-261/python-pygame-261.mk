################################################################################
#
# python-pygame-261
#
################################################################################

PYTHON_PYGAME_261_VERSION = 2.6.1
# PyPI stores the pygame sdist at this location. The archive name uses
# the "pygame" prefix and version number.
PYTHON_PYGAME_261_SOURCE = pygame-$(PYTHON_PYGAME_261_VERSION).tar.gz
PYTHON_PYGAME_261_SITE = https://files.pythonhosted.org/packages/source/p/pygame

# Pygame uses the LGPL-2.1+ license.  See the LICENSE file in the
# upstream source distribution for details.
PYTHON_PYGAME_261_LICENSE = LGPL-2.1+
PYTHON_PYGAME_261_LICENSE_FILES = LGPL

# Use setuptools/pep517 build backend. Pygame switched to a modern
# packaging approach so distutils is no longer available.  The
# Buildroot python package infrastructure will invoke the appropriate
# build system.
PYTHON_PYGAME_261_SETUP_TYPE = pep517

# Build dependencies.  Pygame requires SDL2 and its image/font
# extension libraries as well as libpng, libjpeg and freetype.  These
# selections ensure the module is built with full multimedia support.
PYTHON_PYGAME_261_DEPENDENCIES = sdl2 sdl2-image sdl2-ttf libpng jpeg freetype

# Evaluate the generic Python package build infrastructure.
$(eval $(python-package))