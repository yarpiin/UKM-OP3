#!/system/bin/sh

UKM=/data/UKM;
BB=$UKM/busybox;
DEVPROP="ro.product.device";
DEVICE=`getprop "$DEVPROP" 2> /dev/null`;

if [ -z "$DEVICE" ]; then DEVICE=`$BB grep "$DEVPROP=" /system/build.prop | $BB cut -d= -f2`; fi;

#Official
case $DEVICE in
	OnePlus3|oneplus3|A3001|A3003)
		CONFIG="oneplus3";; #OnePlus Three
	*)
		CONFIG="";; #Not defined
esac;

if [ -n "$CONFIG" ]; then PATH="$UKM/device/$CONFIG.sh"; else PATH=""; fi;

$BB echo "$PATH";
