# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=Custom Kernel by @ChuckDXD on Telegram
do.devicecheck=1
do.modules=1
do.systemless=0
do.cleanup=1
do.cleanuponabort=0
device.name1=olivelite
device.name2=olivewood
device.name3=olive
device.name4=olives
device.name5=
supported.versions=
'; } # end properties

# shell variables
block=/dev/block/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;

## AnyKernel install
split_boot;
flash_boot;
flash_dtbo;

ui print " "

ui_print "Mounting /vendor..."
mount -o rw,remount /vendor

ui_print "Updating OMX blobs..."
replace_file "/vendor/lib/libOmxVenc.so" "0644" "lib_libOmxVenc.so"
replace_file "/vendor/lib/libOmxVdec.so" "0644" "lib_libOmxVdec.so"
if [ -d "/vendor/lib64" ]; then
replace_file "/vendor/lib64/libOmxVenc.so" "0644" "lib64_libOmxVenc.so"
replace_file "/vendor/lib64/libOmxVdec.so" "0644" "lib64_libOmxVdec.so"
fi

## end install
