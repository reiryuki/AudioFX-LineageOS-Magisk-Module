(

mount /data
mount -o rw,remount /data
MODPATH=${0%/*}

# debug
magiskpolicy --live "dontaudit system_server system_file file write"
magiskpolicy --live "allow     system_server system_file file write"
exec 2>$MODPATH/debug-pfsd.log
set -x

# run
FILE=$MODPATH/sepolicy.sh
if [ -f $FILE ]; then
  sh $FILE
fi

# conflict
FILE=/data/adb/modules/AOSPsoundfxRemover/.aml.sh
if [ -f $FILE ] && ! grep '#k' $FILE; then
  touch /data/adb/modules/AOSPsoundfxRemover/disable
fi

# cleaning
FILE=$MODPATH/cleaner.sh
if [ -f $FILE ]; then
  sh $FILE
  rm -f $FILE
fi

) 2>/dev/null


