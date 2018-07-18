#
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include device/huawei/msm8909-common/BoardConfigCommon.mk

DEVICE_PATH := device/huawei/scale
VENDOR_PATH := device/huawei/scale

# Audio
USE_XML_AUDIO_POLICY_CONF := 1

# Assert
TARGET_OTA_ASSERT_DEVICE := Honor4a,honor4a,Honor4A,honor4A,y6,Y6,scale,Scale,SCL-AL00,SCL-CL00,SCL-L01,SCL-L02,SCL-L03,SCL-L04,SCL-L21,SCL-TL00,SCL-TL10,SCL-U03,SCL-U21,SCL-U23,SCL-U31,SCC-U21

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(VENDOR_PATH)/bluetooth

# Camera
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
USE_DEVICE_SPECIFIC_CAMERA := true
BOARD_USES_LEGACY_MMAP := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
TARGET_USE_VENDOR_CAMERA_EXT := true
BOARD_GLOBAL_CFLAGS += -DCAMERA_VENDOR_L_COMPAT

# Charger
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BOARD_CHARGER_ENABLE_SUSPEND := true

# LINEAGEHW
BOARD_HARDWARE_CLASS += \
    $(VENDOR_PATH)/lineagehw
TARGET_TAP_TO_WAKE_NODE := "/sys/touch_screen/easy_wakeup_gesture"

# Flags
BOARD_NO_SECURE_DISCARD := true

# Memory
MALLOC_SVELTE := true

# GPS
TARGET_NO_RPC := true
USE_DEVICE_SPECIFIC_GPS := true

# Graphics
TARGET_USE_COMPAT_GRALLOC_ALIGN := true

# Init
TARGET_LIBINIT_MSM8909_DEFINES_FILE := $(VENDOR_PATH)/init/init_scale.cpp

# Kernel
BOARD_KERNEL_IMAGE_NAME := zImage
TARGET_KERNEL_SOURCE := kernel/huawei/msm8916
TARGET_KERNEL_CONFIG := lineageos_scale_defconfig

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Partitions
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x01400000 # (20M)
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x01900000 # (25M)
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1288491008
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1860648960
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

# Properties
TARGET_SYSTEM_PROP := $(VENDOR_PATH)/system.prop

# Recovery
TARGET_RECOVERY_DEVICE_DIRS += $(VENDOR_PATH)
#RECOVERY_VARIANT := twrp
ifneq ($(RECOVERY_VARIANT),twrp)
TARGET_RECOVERY_FSTAB := $(VENDOR_PATH)/recovery/recovery.fstab
else
TARGET_RECOVERY_FSTAB := $(VENDOR_PATH)/recovery/twrp.fstab
RECOVERY_GRAPHICS_FORCE_USE_LINELENGTH := true
DEVICE_RESOLUTION := 720x1280
RECOVERY_SDCARD_ON_DATA := true
#TW_USE_TOOLBOX := true
TW_NEW_ION_HEAP := true
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_TARGET_USES_QCOM_BSP := true
TW_EXTRA_LANGUAGES := true
TW_INPUT_BLACKLIST := "accelerometer\x0alis3dh-accel\x0ahbtp_vm"
TARGET_RECOVERY_QCOM_RTC_FIX := true
BOARD_SUPPRESS_SECURE_ERASE := true
TW_INCLUDE_CRYPTO := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
TW_NO_SCREEN_TIMEOUT := true
endif

# RIL
BOARD_GLOBAL_CFLAGS += -DUSE_RIL_VERSION_11

# Shims
TARGET_LD_SHIM_LIBS := \
    /system/vendor/bin/hw_test_diag|libshim_cutils.so \
    /system/vendor/lib/liboeminfo.so|libshim_cutils.so \
    /system/vendor/lib/libmmcamera2_imglib_modules.so|libshim_camera.so \
    /system/vendor/bin/mm-qcamera-daemon|libqcamerasvr-c++.so \
    /system/vendor/lib/libmmcamera_wavelet_lib.so|libshim_waveletcamera.so

# SELinux
#BOARD_SEPOLICY_DIRS += \
#    $(VENDOR_PATH)/sepolicy

# Sensors
USE_SENSOR_MULTI_HAL := true

# Wifi
TARGET_PROVIDES_WCNSS_QMI := true

# inherit from the proprietary version
-include vendor/huawei/msm8909-common/BoardConfigVendor.mk
-include vendor/huawei/scale/BoardConfigVendor.mk
