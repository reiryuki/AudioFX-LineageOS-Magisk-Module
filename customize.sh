# install eleven music
if ! pm list packages | grep -Eq org.lineageos.eleven; then
  ui_print "- Cleaning folders..."
  rm -rf /data/app/org.lineageos.eleven*
  ui_print "- Installing Lineage Eleven Music as user app and granting all permissions..."
  pm install -g $MODPATH/Eleven.apk
  ui_print "- Revoking unneeded permission..."
  pm revoke org.lineageos.eleven android.permission.READ_PHONE_STATE
  ui_print "- Installing lib..."
  ELEVEN=`ls /data/app | grep org.lineageos.eleven`
  FOLDER=/data/app/$ELEVEN/lib/$ARCH
  mkdir $FOLDER
  if [ "$IS64BIT" == true ]; then
    cp $MODPATH/system/lib64/librsjni.so $FOLDER
  else
    cp $MODPATH/system/lib/librsjni.so $FOLDER
  fi
  chmod 0755 $FOLDER/librsjni.so
  chown -R 1000.1000 $FOLDER
fi

# check android
if [ "$API" -lt 29 ]; then
  abort "- ! Unsupported sdk: $API. You have to upgrade your Android version at least Android 10 SDK API 29 to use the Lineage AudioFX!"
else
  ui_print "- Device sdk: $API"
fi

# remove unused files
rm -f $MODPATH/LICENSE
rm -f $MODPATH/Eleven.apk

# disable musicfx
ui_print "- Disabling built-in MusicFX..."
pm disable com.android.musicfx

# attention
ui_print "- Please uninstall another sound FX and disable built-in FX, it can't be working together!"

