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

# Release name
PRODUCT_RELEASE_NAME := laurel_sprout

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from laurel_sprout device
$(call inherit-product, device/xiaomi/laurel_sprout/device.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := $(PRODUCT_RELEASE_NAME)
PRODUCT_NAME := omni_$(PRODUCT_NAME)
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Mi A3
PRODUCT_MANUFACTURER := $(PRODUCT_BRAND)

# Build Prop Overrides
PRODUCT_BUILD_PROP_OVERRIDES += \
     PRODUCT_NAME="laurel_sprout" \
     TARGET_DEVICE="laurel_sprout"

     BUILD_FINGERPRINT := "Xiaomi/laurel_sprout/laurel_sprout:9/PKQ1.190416.001/V10.3.4.0.PFQMIXM:user/release-keys" \
     BUILD_NUMBER := "V10.3.4.0.PFQMIXM" 

PRODUCT_SYSTEM_PROPERTY_BLACKLIST += \
    ro.build.date.utc \
    ro.bootimage.build.date.utc

PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.security_patch=2099-12-31

