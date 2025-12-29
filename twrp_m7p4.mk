# Release name
PRODUCT_RELEASE_NAME := m7p4

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/twrp/config/common.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := m7p4
PRODUCT_NAME := twrp_m7p4
PRODUCT_BRAND := Teclast
PRODUCT_MODEL := M30 Pro
PRODUCT_MANUFACTURER := teclast

# OrangeFox
$(call inherit-product, device/teclast/m7p4/device.mk)
