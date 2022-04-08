(

MODPATH=${0%/*}
API=`getprop ro.build.version.sdk`

# debug
exec 2>$MODPATH/debug.log
set -x

# prevent soft reboot
echo 0 > /proc/sys/kernel/panic
echo 0 > /proc/sys/kernel/panic_on_oops
echo 0 > /proc/sys/kernel/panic_on_rcu_stall
echo 0 > /proc/sys/kernel/panic_on_warn
echo 0 > /proc/sys/vm/panic_on_oom

# restart
if [ "$API" -ge 24 ]; then
  killall audioserver
else
  killall mediaserver
fi

# wait
sleep 60

# oom
PKG=org.lineageos.audiofx
PID=`pidof $PKG`
if [ $PID ]; then
  echo -17 > /proc/$PID/oom_adj
  echo -1000 > /proc/$PID/oom_score_adj
fi

) 2>/dev/null


