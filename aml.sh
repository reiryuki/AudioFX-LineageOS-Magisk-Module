[ ! "$MODPATH" ] && MODPATH=${0%/*}

# destination
MODAECS=`find $MODPATH -type f -name *audio*effects*.conf`
MODAEXS=`find $MODPATH -type f -name *audio*effects*.xml`
MODAPS=`find $MODPATH -type f -name *policy*.conf -o -name *policy*.xml`

# remove
RMVS="ring_helper alarm_helper music_helper voice_helper
      notification_helper ma_ring_helper ma_alarm_helper
      ma_music_helper ma_voice_helper ma_system_helper
      ma_notification_helper sa3d fens lmfv dirac dtsaudio
      dlb_music_listener dlb_ring_listener dlb_alarm_listener
      dlb_system_listener dlb_notification_listener"
for MODAEC in $MODAECS; do
  for RMV in $RMVS; do
    sed -i "/^        $RMV {/ {;N s/        $RMV {\n        }//}" $MODAEC
    sed -i "s|$RMV { }||g" $MODAEC
    sed -i "s|$RMV {}||g" $MODAEC
  done
done
for MODAEX in $MODAEXS; do
  for RMV in $RMVS; do
    sed -i "s|<apply effect=\"$RMV\"/>||g" $MODAEX
    sed -i "s|<apply effect=\"$RMV\" />||g" $MODAEX
  done
done

# patch audio policy
#ufor MODAP in $MODAPS; do
#u  sed -i 's|RAW|NONE|g' $MODAP
#u  sed -i 's|,raw||g' $MODAP
#udone










