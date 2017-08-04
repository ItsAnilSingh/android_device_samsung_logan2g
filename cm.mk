# Release name
PRODUCT_RELEASE_NAME := logan2g

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/logan2g/device_logan2g.mk)

# Override build properties.
TARGET_VENDOR_PRODUCT_NAME := logan2gxx
TARGET_VENDOR_DEVICE_NAME := logan2g
TARGET_VENDOR_RELEASE_BUILD_ID := S7262CM110V2

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := logan2g
PRODUCT_NAME := cm_logan2g
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-S7262
PRODUCT_MANUFACTURER := samsung
PRODUCT_CHARACTERISTICS := phone
