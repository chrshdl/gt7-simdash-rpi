################################################################################
#
# python-pygame-261 (fork pin)
#
################################################################################

# Pin to your fork + commit
PYTHON_PYGAME_261_VERSION = 2e62e87
PYTHON_PYGAME_261_SITE = $(call github,chrshdl,pygame,$(PYTHON_PYGAME_261_VERSION))
PYTHON_PYGAME_261_SOURCE = pygame-$(PYTHON_PYGAME_261_VERSION).tar.gz

PYTHON_PYGAME_261_LICENSE = LGPL-2.1+
PYTHON_PYGAME_261_LICENSE_FILES = LGPL

PYTHON_PYGAME_261_SETUP_TYPE = pep517

PYTHON_PYGAME_261_DEPENDENCIES = sdl2 sdl2_image sdl2_ttf libpng jpeg freetype

PYTHON_PYGAME_261_ENV += SDL_CONFIG="$(STAGING_DIR)/usr/bin/sdl2-config"

$(eval $(python-package))