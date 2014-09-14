#
# Copyright (C) 2014 The CyanogenMod Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/samsung/hlte-common/hlte-common-vendor.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# System properties
-include $(LOCAL_PATH)/system_prop.mk

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)

$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:system/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/mixer_paths.xml:system/etc/mixer_paths.xml

# GPS
PRODUCT_PACKAGES += \
    gps.msm8974

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gps/etc/gps.conf:/system/etc/gps.conf \
    $(LOCAL_PATH)/gps/etc/sap.conf:/system/etc/sap.conf

# Input device
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/sec_e-pen.idc:system/usr/idc/sec_e-pen.idc

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/Button_Jack.kl:system/usr/keylayout/Button_Jack.kl \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayout/philips_remote_ir.kl:system/usr/keylayout/philips_remote_ir.kl \
    $(LOCAL_PATH)/keylayout/samsung_remote_ir.kl:system/usr/keylayout/samsung_remote_ir.kl \
    $(LOCAL_PATH)/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl \
    $(LOCAL_PATH)/keylayout/ue_rf4ce_remote.kl:system/usr/keylayout/ue_rf4ce_remote.kl

# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8974

# Lights
PRODUCT_PACKAGES += \
    lights.msm8974

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    NfcNci \
    nfc_nci.msm8974 \
    Tag

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nfcee_access.xml:system/etc/nfcee_access.xml \
    $(LOCAL_PATH)/configs/libnfc-brcm-20791b05.conf:system/etc/libnfc-brcm-20791b05.conf \
    $(LOCAL_PATH)/configs/libnfc-brcm-20791b04.conf:system/etc/libnfc-brcm-20791b04.conf \
    $(LOCAL_PATH)/configs/libnfc-brcm.conf:system/etc/libnfc-brcm.conf

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.carrier.rc \
    init.crda.sh \
    init.qcom.rc \
    init.qcom.usb.rc \
    init.target.rc \
    ueventd.qcom.rc

# Thermal
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal-engine-8974.conf:system/etc/thermal-engine-8974.conf

# Torch
PRODUCT_PACKAGES += \
    Torch

# InCallUI
PRODUCT_PACKAGES += \
    InCallUI

# OmniTorch
PRODUCT_PACKAGES += \
    OmniTorch

# Wifi
PRODUCT_PACKAGES += \
    libnetcmdiface \
    macloader

# This device supports CM enhanced NFC
PRODUCT_COPY_FILES += \
device/samsung/hlte-common/permissions/com.cyanogenmod.nfc.enhanced.xml:system/etc/permissions/com.cyanogenmod.nfc.enhanced.xml

# CRDA
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/proprietary/crda/linville.key.pub.pem:system/lib/crda/linville.key.pub.pem \
   $(LOCAL_PATH)/proprietary/crda/regulatory.bin:system/lib/crda/regulatory.bin \
   $(LOCAL_PATH)/proprietary/crda/init.crda.sh:system/etc/init.crda.sh \
   $(LOCAL_PATH)/proprietary/crda/crda:system/bin/crda \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

PRODUCT_PROPERTY_OVERRIDES += \
    av.offload.enable=false

# Common msm8974
$(call inherit-product, device/samsung/msm8974-common/msm8974.mk)

# All Extras
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/proprietary/app/DSPManager.apk:system/app/DSPManager.apk \
   $(LOCAL_PATH)/proprietary/etc/qti_permissions.xml:system/etc/permissions/qti_permissions.xml \
   $(LOCAL_PATH)/proprietary/extras/ext4_utils/make_ext4fs_main.o:system/extras/ext4_utils/make_ext4fs_main.o \
   $(LOCAL_PATH)/proprietary/extras/ext4_utils/make_ext4fs_main.P:system/extras/ext4_utils/make_ext4fs_main.P \
   $(LOCAL_PATH)/proprietary/lib/libavcodec.so:system/lib/libavcodec.so \
   $(LOCAL_PATH)/proprietary/lib/libavformat.so:system/lib/libavformat.so \
   $(LOCAL_PATH)/proprietary/lib/libavutil.so:system/lib/libavutil.so \
   $(LOCAL_PATH)/proprietary/lib/libcurve25519.so:system/lib/libcurve25519.so \
   $(LOCAL_PATH)/proprietary/lib/libemoji.so:system/lib/libemoji.so \
   $(LOCAL_PATH)/proprietary/lib/libFFmpegExtractor.so:system/lib/libFFmpegExtractor.so \
   $(LOCAL_PATH)/proprietary/lib/libffmpeg_utils.so:system/lib/libffmpeg_utils.so \
   $(LOCAL_PATH)/proprietary/lib/libnamparser.so:system/lib/libnamparser.so \
   $(LOCAL_PATH)/proprietary/lib/libncurses.so:system/lib/libncurses.so \
   $(LOCAL_PATH)/proprietary/lib/libnl_2.so:system/lib/libnl_2.so \
   $(LOCAL_PATH)/proprietary/lib/libpci.so:system/lib/libpci.so \
   $(LOCAL_PATH)/proprietary/lib/libstagefright_soft_ffmpegadec.so:system/lib/libstagefright_soft_ffmpegadec.so \
   $(LOCAL_PATH)/proprietary/lib/libswresample.so:system/lib/libswresample.so \
   $(LOCAL_PATH)/proprietary/lib/libswscale.so:system/lib/libswscale.so \
   $(LOCAL_PATH)/proprietary/lib/libvt_jni.so:system/lib/libvt_jni.so \
   $(LOCAL_PATH)/proprietary/lib/libxml2.so:system/lib/libxml2.so \
   $(LOCAL_PATH)/proprietary/xbin/htop:system/xbin/htop \
   $(LOCAL_PATH)/proprietary/xbin/lsof:system/xbin/lsof \
   $(LOCAL_PATH)/proprietary/xbin/pigz:system/xbin/pigz \
   $(LOCAL_PATH)/proprietary/xbin/powertop:system/xbin/powertop \
   $(LOCAL_PATH)/proprietary/xbin/rsync:system/xbin/rsync
