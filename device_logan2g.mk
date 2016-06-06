# Most specific first
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Get languages available
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/logan2g/logan2g-vendor.mk)

# Use high-density artwork where available; GT-S7262 supports hdpi (high) ~240dpi.
# However the platform doesn't currently contain all of the bitmaps at hdpi density.
# So we do this little trick to fall back to the normal version if the hdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/samsung/logan2g/overlay

# Set local path
LOCAL_PATH := device/samsung/logan2g

# Softlink sh
$(shell mkdir -p $(LOCAL_PATH)/../../../out/target/product/logan2g/recovery/root/system/bin)
$(shell ln -sf -t $(LOCAL_PATH)/../../../out/target/product/logan2g/recovery/root/system/bin ../../sbin/sh)

# Init files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.sc6820i:root/fstab.sc6820i \
    $(LOCAL_PATH)/rootdir/init.sc6820i.rc:root/init.sc6820i.rc \
    $(LOCAL_PATH)/rootdir/init.sc6820i.usb.rc:root/init.sc6820i.usb.rc \
    $(LOCAL_PATH)/rootdir/lpm.rc:root/lpm.rc \
    $(LOCAL_PATH)/rootdir/ueventd.sc6820i.rc:root/ueventd.sc6820i.rc \
    $(LOCAL_PATH)/rootdir/bin/charge:root/bin/charge \
    $(LOCAL_PATH)/rootdir/bin/poweroff_alarm:root/bin/poweroff_alarm

# TWRP
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/twrp.fstab:recovery/root/etc/twrp.fstab

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/vold.fstab:system/etc/vold.fstab

# Hardware-specific files
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Packages
# Filesystem
PRODUCT_PACKAGES += \
    setup_fs

# Wifi
PRODUCT_PACKAGES += \
    dhcpcd.conf \
    wpa_supplicant \
    hostapd \
    wpa_supplicant.conf

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default

# Usb accessory
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Service mode
PRODUCT_PACKAGES += \
    SamsungServiceMode

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Properties

# MTP
# Property override must come before included property.
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Insecure ADBD
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.adb.secure=0

# SPRD default build.prop properties overrides
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.chipset=sc6820i \
    ro.com.android.dataroaming=false \
    persist.msms.phone_count=2 \
    persist.sys.sprd.modemreset=0

# Enable Google-specific location features.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false

# Override phone-hdpi-512-dalvik-heap to match value on stock.
# Property override must come before included property.
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapgrowthlimit=96m

# Use the Dalvik VM specific for devices with 512 MB of RAM
include frameworks/native/build/phone-hdpi-512-dalvik-heap.mk

# These are the hardware-specific settings that are stored in system properties.
# Note that the only such settings should be the ones that are too low-level to be reachable from
# resources or other mechanisms.
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=180 \
    mobiledata.interfaces=rmnet0 \
    ro.zygote.disable_gl_preload=true \
    persist.radio.multisim.config=none \
    ro.telephony.ril_class=SamsungSPRDRIL \
    ro.telephony.call_ring.multiple=0 \
    ro.telephony.call_ring=0 \
    ro.crypto.state=unsupported \
    ro.com.google.gmsversion=4.1_r6 \
    boot.fps=7

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_logan2g
PRODUCT_DEVICE := logan2g
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-S7262
PRODUCT_MANUFACTURER := samsung
