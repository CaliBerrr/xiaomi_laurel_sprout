#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2020 The TWRP Open Source Project
# Copyright (C) 2020 SebaUbuntu's TWRP device tree generator
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := device/xiaomi/laurel_sprout

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/embedded.mk)

# define hardware platform
PRODUCT_PLATFORM := trinket
TARGET_USES_HARDWARE_QCOM_BOOTCTRL := true

# A/B
PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier 
    
# Enable update engine sideloading by including the static version of the
# boot_control HAL and its dependencies.
PRODUCT_PACKAGES += \
    bootctrl.$(PRODUCT_PLATFORM) \
    update_engine_sideload
    
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true
    
PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.$(PRODUCT_PLATFORM) \
    libgptutils \
    libz \
    libcutils

# qcom standard decryption
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe \

# tzdata
PRODUCT_PACKAGES += \
    tzdata_twrp \

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service


