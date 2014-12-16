#
# Copyright 2014-2015, BPaul
#

# CPU
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a8
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon

# Crutches
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -DLEGACY_BLOB_COMPATIBLE

# Display
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/sony/aoba/config/egl.cfg
ARCH_ARM_HAVE_NEON := true
TARGET_USES_ION := true
TARGET_USES_OVERLAY := true
TARGET_USES_SF_BYBASS := true
TARGET_USES_C2D_COMPOSITION := true

# Audio
BOARD_USES_ALSA_AUDIO := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := device/sony/aoba/bluetooth/vnd_aoba.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/sony/aoba/bluetooth

# Sensor
BOARD_USES_GENERIC_INVENSENSE := false
SOMC_CFG_SENSORS_ACCEL_BMA250NA_INPUT := yes
SOMC_CFG_SENSORS_COMPASS_AK8972 := yes
SOMC_CFG_SENSORS_LIGHT_LIBALS := yes
SOMC_CFG_SENSORS_PROXIMITY_APDS9702 := yes
SOMC_CFG_SENSORS_GYRO_MPU3050 := yes
SOMC_CFG_SENSORS_HAVE_LIBAK8972 := yes
SOMC_CFG_SENSORS_HAVE_LIBALS := yes
SOMC_CFG_SENSORS_HAVE_LIBMPU3050 := yes

# Wlan
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/system/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/vendor/firmware/fw_bcmdhd_apsta.bin"
#WIFI_DRIVER_FW_PATH_P2P     := "/system/vendor/firmware/fw_bcmdhd_p2p.bin"

# Camera
BOARD_USES_CAMERA_FAST_AUTOFOCUS := true
USE_DEVICE_SPECIFIC_CAMERA := true

# FM Radio
BOARD_HAVE_FMRADIO := true
BOARD_HAVE_FMRADIO_BCM := true

# Board
TARGET_BOARD_PLATFORM := msm8660
TARGET_BOOTLOADER_BOARD_NAME := fuji

# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif
DONT_DEXPREOPT_PREBUILTS := true

BOARD_VOLD_MAX_PARTITIONS := 18

# Image
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1056964608
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2147483648
BOARD_FLASH_BLOCK_SIZE := 131072

# Recovery
TARGET_NO_BOOTLOADER := true
BOARD_HAS_NO_MISC_PARTITION := true
TARGET_RECOVERY_FSTAB = device/sony/aoba/config/fstab.semc
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
TARGET_NO_SEPARATE_RECOVERY := true
BOARD_SDCARD_INTERNAL_DEVICE := /dev/block/mmcblk0p18

# TWRP
DEVICE_RESOLUTION := 720x1280
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_INTERNAL_STORAGE_PATH := "/sdcard"
TW_INTERNAL_STORAGE_MOUNT_POINT := "sdcard"
TW_TARGET_USES_QCOM_BSP := true
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"

# OTA
TARGET_RELEASETOOLS_EXTENSIONS := device/sony/aoba
TARGET_OTA_ASSERT_DEVICE := LT28,LT28h,LT28i,LT28at,aoba

# Enable dual-recovery custom ota script
SONY_USE_CUSTOM_MKBOOTIMG := true
SONY_USE_CUSTOM_BOOT := true

ifeq ($(SONY_USE_CUSTOM_BOOT),true)
ifeq ($(SONY_USE_CUSTOM_MKBOOTIMG),true)
BOARD_CUSTOM_BOOTIMG_MK := device/sony/aoba/customboot.mk
else
BOARD_CUSTOM_BOOTIMG_MK := device/sony/aoba/stockboot.mk
endif
else
BOARD_CUSTOM_MKBOOTIMG := device/sony/aoba/tools/mkbootimg.py
BOARD_MKBOOTIMG_ARGS := \
	out/target/product/aoba/kernel@0x40208000 \
	out/target/product/aoba/ramdisk.img@0x41500000,ramdisk \
	device/sony/aoba/prebuilt/RPM.bin@0x20000,rpm
endif

-include vendor/sony/hikari/BoardConfigVendor.mk

# Health Daemon
BOARD_BATTERY_DEVICE_NAME := "semc_battery_data"
BOARD_HAL_STATIC_LIBRARIES := libhealthd.semc

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true
