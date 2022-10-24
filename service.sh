MODPATH=${0%/*}
API=`getprop ro.build.version.sdk`

# debug
exec 2>$MODPATH/debug.log
set -x

# restart
if [ "$API" -ge 24 ]; then
  PID=`pidof audioserver`
  if [ "$PID" ]; then
    killall audioserver
  fi
else
  PID=`pidof mediaserver`
  if [ "$PID" ]; then
    killall mediaserver
  fi
fi

# wait
sleep 60

# allow
PKG=org.lineageos.audiofx
if [ "$API" -ge 30 ]; then
  appops set $PKG AUTO_REVOKE_PERMISSIONS_IF_UNUSED ignore
fi


