#
# Copyright (C) 2018 The Xiaomi-SDM660 Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

include device/xiaomi/sdm660-common/BoardConfigCommon.mk

# Device Path
DEVICE_PATH := device/xiaomi/jasmine_sprout

# Audio
ifeq ($(TARGET_KERNEL_VERSION),4.19)
BOARD_VENDOR_KERNEL_MODULES += \
    $(KERNEL_MODULES_OUT)/audio_tas2557.ko
endif

# Camera
BOARD_QTI_CAMERA_32BIT_ONLY := true

# Display
TARGET_SCREEN_DENSITY := 440

# Kernel
KERNEL_DEFCONFIG := wayne-debug_defconfig
ifeq ($(TARGET_KERNEL_VERSION),4.19)
TARGET_KERNEL_SOURCE := kernel/msm-4.19
else
TARGET_KERNEL_SOURCE := kernel/msm-4.4
endif

# Manifest
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Properties
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 33

# Selinux
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Vendor Security patch level
VENDOR_SECURITY_PATCH := 2019-12-05
