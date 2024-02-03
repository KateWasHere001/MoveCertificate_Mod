#!/system/bin/sh
MODPATH=${0%/*}

if [ -d $MODDIR/cacerts/ ]; then
	mv -f $MODDIR/cacerts/* /data/local/tmp/cacerts/
fi

rm -rf data/adb/modules/MoveCertificate

ui_print "[+]. Removed."
