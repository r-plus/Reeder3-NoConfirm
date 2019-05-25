ARCHS = armv7 arm64 arm64e
TARGET = iphone:clang:11.2:10.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = reeder3noconfirm
reeder3noconfirm_FILES = Tweak.xm
reeder3noconfirm_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 Reeder"
