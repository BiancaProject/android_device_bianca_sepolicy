#
# This policy configuration will be used by all products that
# inherit from Arrow
#

ifeq ($(TARGET_COPY_OUT_VENDOR), vendor)
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
TARGET_USES_PREBUILT_VENDOR_SEPOLICY ?= true
endif
endif

SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += \
    device/bianca/sepolicy/common/public

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/bianca/sepolicy/common/private

ifeq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/bianca/sepolicy/common/dynamic \
    device/bianca/sepolicy/common/system
else
BOARD_VENDOR_SEPOLICY_DIRS += \
    device/bianca/sepolicy/common/dynamic \
    device/bianca/sepolicy/common/vendor
endif

# Selectively include legacy rules defined by the products
-include device/bianca/sepolicy/legacy-common/sepolicy.mk
