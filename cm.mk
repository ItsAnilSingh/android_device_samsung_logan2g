# Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := logan2g

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/logan2g/device_logan2g.mk)

# Override build properties.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=logan2gxx \
    TARGET_DEVICE=logan2g \
    BUILD_FINGERPRINT="samsung/logan2gxx/logan2g:4.2.2/JDQ39E/S7262CM101V2:userdebug/test-keys" \
    PRIVATE_BUILD_DESC="logan2gxx-userdebug 4.2.2 JDQ39E S7262CM101V2 test-keys"

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := logan2g
PRODUCT_NAME := cm_logan2g
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-S7262
PRODUCT_MANUFACTURER := samsung
PRODUCT_CHARACTERISTICS := gedclock
BUILD_NUMBER := S7262CM101V2
