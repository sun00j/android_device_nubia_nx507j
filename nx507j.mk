#
# Copyright (C) 2014 The CyanogenMod Project
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
#

# Vendor
$(call inherit-product, vendor/nubia/nx507j/nx507j-vendor.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Screen density
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# ADB
PRODUCT_PROPERTY_OVERRIDES += \
    persist.service.adb.enable=1 \
    persist.sys.usb.config=mtp,adb

# Timezone
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.timezone=Asia/Shanghai

# Optimize
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dexopt-flags=m=y \
    dalvik.vm.checkjni=false \
    ro.config.nocheckin=1 \
    ro.kernel.android.checkjni=0 \
    ro.kernel.checkjni=0

# Audios
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.notification_sound=Forest.ogg \
    ro.config.alarm_alert=SMS.ogg
    ro.config.ringtone=MI.ogg

# default.prop
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.adb.secure=0 \
    ro.debuggable=1

# call dalvik heap config
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.software.print.xml:system/etc/permissions/android.software.print.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:system/etc/permissions/com.dsi.ant.antradio_library.xml

# Audio
PRODUCT_PACKAGES += \
    audiod \
    audio.a2dp.default \
    audio_policy.msm8974 \
    audio.primary.msm8974 \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    tinymix

# Audio configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:system/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/mixer_paths.xml:system/etc/mixer_paths.xml

# Camera
PRODUCT_PACKAGES += \
    libxml2 \
    camera.msm8974 \
    Camera2

# Connectivity Engine support
PRODUCT_PACKAGES += \
    libcnefeatureconfig \
    services-ext

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Wfd
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/etc/capability.xml:system/etc/capability.xml \
    $(LOCAL_PATH)/etc/wfdconfig.xml:system/etc/wfdconfig.xml \
    $(LOCAL_PATH)/etc/wfdconfig1280_720.xml:system/etc/wfdconfig1280_720.xml \
    $(LOCAL_PATH)/etc/wfdconfig640_480.xml:system/etc/wfdconfig640_480.xml \
    $(LOCAL_PATH)/etc/wfdconfig800_480.xml:system/etc/wfdconfig800_480.xml \
    $(LOCAL_PATH)/etc/wfdconfig960_540.xml:system/etc/wfdconfig960_540.xml \
    $(LOCAL_PATH)/etc/wfdconfigsink.xml:system/etc/wfdconfigsink.xml

# Display
PRODUCT_PACKAGES += \
    copybit.msm8974 \
    gralloc.msm8974 \
    hwcomposer.msm8974 \
    liboverlay

# Ebtables
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes \
    libebtc \
    curl \
    libnl_2 \
    libbson

# Filesystem
PRODUCT_PACKAGES += \
    e2fsck \
    fibmap.f2fs \
    fsck.f2fs \
    mkfs.f2fs \
    make_ext4fs \
    resize2fs \
    setup_fs

# FM
#PRODUCT_PACKAGES += \
#    FM2 \
#    FMRecord \
#    libqcomfm_jni \
#    qcom.fmradio \
#    qcom.fmradio.xml

# QRNGD
PRODUCT_PACKAGES += \
    qrngd \
    qrngp

# keyhandler
PRODUCT_PACKAGES += \
    com.cyanogenmod.keyhandler

# LOWI
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/etc/lowi.conf:system/etc/lowi.conf

# IRSC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/etc/sec_config:system/etc/sec_config

# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8974

# Lights
PRODUCT_PACKAGES += \
    lights.msm8974

# Media
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    $(LOCAL_PATH)/etc/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/etc/media_profiles.xml:system/etc/media_profiles.xml

# WiFi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/wifi/WCNSS_qcom_wlan_nv.bin \
    $(LOCAL_PATH)/wifi/wifi_info:system/etc/wifi/wifi_info

# OMX
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libdashplayer \
    libdivxdrmdecrypt \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxMux \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVdecHevc \
    libOmxVenc \
    libHevcSwDecoder \
    libstagefrighthw \
    qcmediaplayer

PRODUCT_BOOT_JARS += \
    qcmediaplayer

# Power
PRODUCT_PACKAGES += \
    power.msm8974

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/etc/powerprofile.sh:system/bin/powerprofile.sh

# Ramdisk
PRODUCT_PACKAGES += \
    init.rc \
    fstab.qcom \
    init.class_main.sh \
    init.mdm.sh \
    init.nubia.sh \
    init.nubia.usb.rc \
    init.qcom.class_core.sh \
    init.qcom.early_boot.sh \
    init.qcom.factory.sh \
    init.qcom.rc \
    init.recovery.qcom.rc \
    init.qcom.sh \
    init.qcom.ssr.sh \
    init.qcom.syspart_fixup.sh \
    init.qcom.usb.sh \
    init.target.rc \
    init.trace.rc \
    init.usb.rc \
    ueventd.qcom.rc \
    ueventd.rc

# Torch
PRODUCT_PACKAGES += \
    Torch

# Thermal config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/etc/thermal-engine-8974.conf:system/etc/thermal-engine-8974.conf \
    $(LOCAL_PATH)/etc/thermal-engine-8974pro.conf:system/etc/thermal-engine-8974pro.conf

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Wifi
PRODUCT_PACKAGES += \
    dhcpcd.conf \
    hostapd.accept \
    hostapd.deny \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf \
    p2p_supplicant_overlay.conf \
    wpa_supplicant_overlay.conf \
    wpa_supplicant_ath6kl.conf

# ANT+
PRODUCT_PACKAGES += \
    libantradio \
    com.dsi.ant.antradio_library \
    antradio_app

PRODUCT_PACKAGES += \
    giflib

PRODUCT_PACKAGES += \
    WCNSS_cfg.dat \
    WCNSS_qcom_cfg.ini \
    libnetcmdiface \
    libwcnss_qmi

PRODUCT_PACKAGES += \
    libcurl \
    libqsap_sdk \
    libQWiFiSoftApCfg \
    wcnss_service

PRODUCT_PACKAGES += \
    libion

ifneq ($(strip $(QCPATH)),)
PRODUCT_BOOT_JARS += \
    WfdCommon
endif

PRODUCT_PACKAGES += \
    ntfs-3g \
    ntfsfix \
    mkntfs

PRODUCT_PACKAGES += \
    libjni_latinime

PRODUCT_PACKAGES += \
    libemoji

# ETC Bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/etc/bluetooth/auto_pair_devlist.conf:system/etc/bluetooth/auto_pair_devlist.conf \
    $(LOCAL_PATH)/etc/bluetooth/bt_did.conf:system/etc/bluetooth/bt_did.conf \
    $(LOCAL_PATH)/etc/bluetooth/bt_stack.conf:system/etc/bluetooth/bt_stack.conf \
    $(LOCAL_PATH)/etc/cne/andsfCne.xml:system/etc/cne/andsfCne.xml \
    $(LOCAL_PATH)/etc/cne/SwimConfig.xml:system/etc/cne/SwimConfig.xml \
    $(LOCAL_PATH)/etc/flp.conf:system/etc/flp.conf \
    $(LOCAL_PATH)/etc/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/etc/hcidump.sh:system/etc/hcidump.sh \
    $(LOCAL_PATH)/etc/hsic.control.bt.sh:system/etc/hsic.control.bt.sh \
    $(LOCAL_PATH)/etc/init.ath3k.bt.sh:system/etc/init.ath3k.bt.sh \
    $(LOCAL_PATH)/etc/init.crda.sh:system/etc/init.crda.sh \
    $(LOCAL_PATH)/etc/init.qcom.uicc.sh:system/etc/init.qcom.uicc.sh \
    $(LOCAL_PATH)/etc/init.qcom.audio.sh:system/etc/init.qcom.audio.sh \
    $(LOCAL_PATH)/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
    $(LOCAL_PATH)/etc/init.qcom.coex.sh:system/etc/init.qcom.coex.sh \
    $(LOCAL_PATH)/etc/init.qcom.efs.sync.sh:system/etc/init.qcom.efs.sync.sh \
    $(LOCAL_PATH)/etc/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \
    $(LOCAL_PATH)/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
    $(LOCAL_PATH)/etc/init.qcom.sdio.sh:system/etc/init.qcom.sdio.sh \
    $(LOCAL_PATH)/etc/init.qcom.wifi.sh:system/etc/init.qcom.wifi.sh \
    $(LOCAL_PATH)/etc/izat.conf:system/etc/izat.conf \
    $(LOCAL_PATH)/etc/permissions/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    $(LOCAL_PATH)/etc/permissions/com.qualcomm.location.xml:system/etc/permissions/com.qualcomm.location.xml \
    $(LOCAL_PATH)/etc/qca6234-service.sh:system/etc/qca6234-service.sh \
    $(LOCAL_PATH)/etc/quipc.conf:system/etc/quipc.conf \
    $(LOCAL_PATH)/etc/sap.conf:system/etc/sap.conf \
    $(LOCAL_PATH)/etc/sensor_def_qcomdev.conf:system/etc/sensor_def_qcomdev.conf \
    $(LOCAL_PATH)/etc/xtra_root_cert.pem:system/etc/xtra_root_cert.pem \
    $(LOCAL_PATH)/etc/xtwifi.conf:system/etc/xtwifi.conf \
    $(LOCAL_PATH)/etc/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf

# KeyLayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/usr/idc/cyttsp4_mt.idc:system/usr/idc/cyttsp4_mt.idc \
    $(LOCAL_PATH)/usr/idc/input_proxy.idc:system/usr/idc/input_proxy.idc \
    $(LOCAL_PATH)/usr/keychars/Generic.kcm:system/usr/keychars/Generic.kcm \
    $(LOCAL_PATH)/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    $(LOCAL_PATH)/usr/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \
    $(LOCAL_PATH)/usr/keylayout/atmel_mxt_ts.kl:system/usr/keylayout/atmel_mxt_ts.kl \
    $(LOCAL_PATH)/usr/keylayout/synaptics_rmi4_i2c.kl:system/usr/keylayout/synaptics_rmi4_i2c.kl \
    $(LOCAL_PATH)/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# Prebuilt
PRODUCT_COPY_FILES += \
    device/nubia/nx507j/prebuilt/01.apk:system/priv-app/01/01.apk \
    device/nubia/nx507j/prebuilt/Forest.ogg:system/media/audio/alarms/Forest.ogg \
    device/nubia/nx507j/prebuilt/Journey.ogg:system/media/audio/alarms/Journey.ogg \
    device/nubia/nx507j/prebuilt/Smooth.ogg:system/media/audio/alarms/Smooth.ogg \
    device/nubia/nx507j/prebuilt/SMS.ogg:system/media/audio/notifications/SMS.ogg \
    device/nubia/nx507j/prebuilt/Chorus.ogg:system/media/audio/ringtones/Chorus.ogg \
    device/nubia/nx507j/prebuilt/Journey.ogg:system/media/audio/ringtones/Journey.ogg \
    device/nubia/nx507j/prebuilt/Leisure.ogg:system/media/audio/ringtones/Leisure.ogg \
    device/nubia/nx507j/prebuilt/MI.ogg:system/media/audio/ringtones/MI.ogg \
    device/nubia/nx507j/prebuilt/Orange.ogg:system/media/audio/ringtones/Orange.ogg \
    device/nubia/nx507j/prebuilt/Over_the_horizon.ogg:system/media/audio/ringtones/Over_the_horizon.ogg \
    device/nubia/nx507j/prebuilt/S4_Over_the_horizon.ogg:system/media/audio/ringtones/S4_Over_the_horizon.ogg \
    device/nubia/nx507j/prebuilt/Smooth.ogg:system/media/audio/ringtones/Smooth.ogg \
    device/nubia/nx507j/prebuilt/Tune.ogg:system/media/audio/ringtones/Tune.ogg

