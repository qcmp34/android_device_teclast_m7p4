LOCAL_PATH := device/teclast/m7p4

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Define hardware platform
PRODUCT_PLATFORM := mt6771

# Device identifier
PRODUCT_DEVICE := m7p4
PRODUCT_NAME := twrp_m7p4
PRODUCT_BRAND := Teclast
PRODUCT_MODEL := M30 Pro
PRODUCT_MANUFACTURER := Teclast

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 29

# Prebuilt kernel
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/zImage:kernel \
    $(LOCAL_PATH)/prebuilt/dtb:dtb

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/init.recovery.mt6771.rc:root/init.recovery.mt6771.rc \
    $(LOCAL_PATH)/recovery/root/ueventd.rc:root/ueventd.rc

# fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery.fstab:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/recovery.fstab

# Crypto - copy vendor files after recovery root is created
TARGET_RECOVERY_DEVICE_MODULES += \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-service \
    gatekeeper.mt6771

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.gatekeeper@1.0-impl.so:recovery/root/vendor/lib64/hw/android.hardware.gatekeeper@1.0-impl.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/gatekeeper.mt6771.so:recovery/root/vendor/lib64/hw/gatekeeper.mt6771.so

# Include OpenAES for FBE crypto
PRODUCT_PACKAGES += \
    libopenaes
