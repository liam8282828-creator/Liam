ARCHS = arm64 arm64e
TARGET = iphone:clang:14.5:14.0
DEBUG = 0
FINALPACKAGE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = MenuLiamFF
MenuLiamFF_FILES = Tweak.x
MenuLiamFF_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
