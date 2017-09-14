# Device folder path
DEVICE_FOLDER := device/samsung/logan2g

# Assert
TARGET_OTA_ASSERT_DEVICE := logan2g

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := false
# Cortex-A9 is more closer to Cortex-A5 than Cortex-A7
TARGET_CPU_VARIANT := cortex-a9
ARCH_ARM_HAVE_ARMV7A := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a9 -mfloat-abi=softfp -mfpu=neon
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a9 -mfloat-abi=softfp -mfpu=neon

# GT-S7262 doesnt supports vfp-d32
ARCH_ARM_HAVE_VFP_D32 := false

# Platform
TARGET_BOARD_PLATFORM := sc6820i
TARGET_BOARD_PLATFORM_GPU := mali-400 MP
TARGET_BOOTLOADER_BOARD_NAME := logan
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
COMMON_GLOBAL_CFLAGS += -DSPRD_HARDWARE

# For low memory targets only (~512MB RAM & hdpi resolution)
TARGET_ARCH_LOWMEM := true

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8 androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100
TARGET_KERNEL_SOURCE := kernel/samsung/logan2g
TARGET_KERNEL_CONFIG := cyanogenmod_logan2g_defconfig
BOARD_KERNEL_IMAGE_NAME := Image

# Partition Size
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
# recovery.img too large in CM-12.1 (maybe due to arm-eabi-4.8)
# BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 941621248
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2630614016
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_FLASH_BLOCK_SIZE := 131072

# AKMD
BOARD_VENDOR_USE_AKMD := akmd8975

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_FOLDER)/rootdir/fstab.sc6820i
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../$(DEVICE_FOLDER)/recovery/recovery_keys.c
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_UMS_LUNFILE := /sys/class/android_usb/android0/f_mass_storage/lun/file
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/dwc_otg.0/gadget/lun0/file

# Hardware rendering
USE_OPENGL_RENDERER := true
BOARD_EGL_NEEDS_FNW := true
BOARD_USE_MHEAP_SCREENSHOT := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
HWUI_COMPILE_FOR_PERF := true
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL -DREFBASE_JB_MR1_COMPAT_SYMBOLS

# Camera
USE_CAMERA_STUB := true
COMMON_GLOBAL_CFLAGS += -DMR0_CAMERA_BLOB

# Audio
BOARD_USES_TINYALSA_AUDIO := true
USE_LEGACY_AUDIO_POLICY := 1
LOCAL_CFLAGS += -DMR0_AUDIO_BLOB -DICS_AUDIO_BLOB

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_FOLDER)/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := $(DEVICE_FOLDER)/bluetooth/libbt_vndcfg.txt

# Connectivity - Wi-Fi
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_WLAN_DEVICE_REV            := bcm4330_b1
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P          := "/system/etc/wifi/bcmdhd_p2p.bin"
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_MODULE_NAME          := "dhd"
WIFI_DRIVER_MODULE_ARG           := "firmware_path=/system/etc/wifi/bcmdhd_sta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_DRIVER_MODULE_AP_ARG        := "firmware_path=/system/etc/wifi/bcmdhd_apsta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_BAND                        := 802_11_ABG
BOARD_HAVE_SAMSUNG_WIFI          := true

# RIL
BOARD_RIL_CLASS := ../../../$(DEVICE_FOLDER)/ril/
COMMON_GLOBAL_CFLAGS += -DSEC_PRODUCT_FEATURE_RIL_CALL_DUALMODE_CDMAGSM
BOARD_USE_LIBATCHANNEL_WRAPPER := true

# FM Radio
BOARD_HAVE_FM_RADIO := true
BOARD_FM_DEVICE := bcm4330
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

# healthd
BOARD_HAL_STATIC_LIBRARIES := libhealthd.sprd

# CMHW
BOARD_HARDWARE_CLASS := $(DEVICE_FOLDER)/cmhw/

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging

# Resolution
TARGET_SCREEN_WIDTH := 480
TARGET_SCREEN_HEIGHT := 800

# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Font Footprint
EXTENDED_FONT_FOOTPRINT := true

# Compat
TARGET_USES_LOGD := false

# jemalloc causes a lot of random crash on free()
MALLOC_IMPL := dlmalloc

# SELinux
BOARD_SEPOLICY_DIRS += $(DEVICE_FOLDER)/sepolicy
BOARD_SEPOLICY_UNION += \
    at_distributor.te \
    device.te \
    file_contexts \
    init.te \
    netd.te \
    pty_symlink.te \
    slog.te \
    surfaceflinger.te

# Using prebuilt webviewchromium compiled for logan2g to reduce compile time
PRODUCT_PREBUILT_WEBVIEWCHROMIUM := yes

# Enable dex-preoptimization to speed up the first boot sequence
# of an SDK AVD. Note that this operation only works on Linux for now
ifeq ($(HOST_OS),linux)
  ifeq ($(WITH_DEXPREOPT),)
    WITH_DEXPREOPT := true
  endif
endif
