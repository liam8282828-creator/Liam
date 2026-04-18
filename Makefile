DEBUG = 0
FINALPACKAGE = 1
ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:14.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = MenuLiamFF
MenuLiamFF_FILES = Tweak.x
MenuLiamFF_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
