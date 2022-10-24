mount -o rw,remount /data
MODPATH=${0%/*}
API=`getprop ro.build.version.sdk`

# debug
exec 2>$MODPATH/debug-pfsd.log
set -x

# run
FILE=$MODPATH/sepolicy.sh
if [ -f $FILE ]; then
  . $FILE
fi

# context
if [ "$API" -ge 26 ]; then
  chcon -R u:object_r:system_lib_file:s0 $MODPATH/system/lib*
fi

# conflict
FILE=/data/adb/modules/AOSPsoundfxRemover/.aml.sh
if [ -f $FILE ] && ! grep '#k' $FILE; then
  touch /data/adb/modules/AOSPsoundfxRemover/disable
fi

# cleaning
FILE=$MODPATH/cleaner.sh
if [ -f $FILE ]; then
  . $FILE
  rm -f $FILE
fi


