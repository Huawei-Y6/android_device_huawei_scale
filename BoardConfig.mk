#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2018 The LineageOS Project
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
# config.mk
#
# Product-specific compile-time definitions.
#

# inherit from msm8909-common
include device/huawei/msm8909-common/BoardConfigCommon.mk

DEVICE_PATH := device/huawei/scale

# Assert
TARGET_OTA_ASSERT_DEVICE := Honor4a,honor4a,Honor4A,honor4A,y6,Y6,scale,Scale,SCL-AL00,SCL-CL00,SCL-L01,SCL-L02,SCL-L03,SCL-L04,SCL-L21,SCL-TL00,SCL-TL10,SCL-U03,SCL-U21,SCL-U23,SCL-U31,SCC-U21

# inherit from the proprietary version
include vendor/huawei/scale/BoardConfigVendor.mk
