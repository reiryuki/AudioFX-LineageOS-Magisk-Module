[ ! "$MODPATH" ] && MODPATH=${0%/*}

# destination
MODAEC=`find $MODPATH -type f -name *audio*effects*.conf`
MODAEX=`find $MODPATH -type f -name *audio*effects*.xml`
MODAP=`find $MODPATH -type f -name *policy*.conf -o -name *policy*.xml`

# remove
RMVS="ring_helper alarm_helper music_helper voice_helper
      notification_helper ma_ring_helper ma_alarm_helper
      ma_music_helper ma_voice_helper ma_system_helper
      ma_notification_helper sa3d fens lmfv dirac dtsaudio
      dlb_music_listener dlb_ring_listener dlb_alarm_listener
      dlb_system_listener dlb_notification_listener"
if [ "$MODAEC" ]; then
  for RMV in $RMVS; do
    sed -i "/^        $RMV {/ {;N s/        $RMV {\n        }//}" $MODAEC
    sed -i "s|$RMV { }||g" $MODAEC
    sed -i "s|$RMV {}||g" $MODAEC
  done
fi
if [ "$MODAEX" ]; then
  for RMV in $RMVS; do
    sed -i "s|<apply effect=\"$RMV\"/>||g" $MODAEX
    sed -i "s|<apply effect=\"$RMV\" />||g" $MODAEX
  done
fi

# patch audio policy
#uif [ "$MODAP" ]; then
#u  sed -i 's|RAW|NONE|g' $MODAP
#u  sed -i 's|,raw||g' $MODAP
#ufi










