#
# Copyright 2014-2015, BPaul
#

# Live Wallpapers
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        VisualizationWallpapers

# Get the long list of APNs
PRODUCT_COPY_FILES += device/sample/etc/apns-full-conf.xml:system/etc/apns-conf.xml

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := full_aoba
PRODUCT_DEVICE := aoba
PRODUCT_BRAND := Sony
PRODUCT_MODEL := LT28i
PRODUCT_MANUFACTURER := Sony
PRODUCT_RESTRICT_VENDOR_FILES := false

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/sony/aoba/device.mk)

BUILD_WITHOUT_RIL := false
ifeq ($(BUILD_WITHOUT_RIL),true)
$(call inherit-product-if-exists, vendor/sony/aoba_noril/device-vendor.mk)
else
$(call inherit-product-if-exists, vendor/sony/aoba/device-vendor.mk)
endif
