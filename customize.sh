ui_print " "

# install eleven music
PKG=org.lineageos.eleven
if ! pm list packages | grep -Eq $PKG; then
  ui_print "- Cleaning folders..."
  rm -rf /data/app/$PKG*
  rm -rf /data/data/$PKG/cache
  ui_print " "
  ui_print "- Installing Lineage Eleven Music as user app and"
  ui_print "  granting all permissions..."
  pm install -g $MODPATH/Eleven.apk
  ui_print " "
  ui_print "- Revoking unneeded permission..."
  pm revoke $PKG android.permission.READ_PHONE_STATE
  ui_print "- Installing lib..."
  ELEVEN=`ls /data/app | grep $PKG`
  FOLDER=/data/app/$ELEVEN/lib/$ARCH
  mkdir $FOLDER
  if [ "$IS64BIT" == true ]; then
    cp -f $MODPATH/system/lib64/librsjni.so $FOLDER
  else
    cp -f $MODPATH/system/lib/librsjni.so $FOLDER
    rm -rf `find $MODPATH/system -name *64`
  fi
  chmod 0755 $FOLDER/librsjni.so
  chown -R 1000.1000 $FOLDER
  ui_print " "
  ui_print "- Done"
  ui_print " "
fi

# check android
if [ "$API" -lt 29 ]; then
  ui_print "- ! Unsupported SDK: $API. You have to upgrade your"
  ui_print "    Android version at least Android 10 SDK API 29 to use"
  ui_print "    the Lineage AudioFX."
  abort
else
  ui_print "- Device SDK: $API"
  ui_print " "
fi

# se context
ui_print "- Setting SE context..."
chcon -R u:object_r:system_lib_file:s0 $MODPATH/system/lib*
ui_print " "

# cleaning
ui_print "- Cleaning..."
rm -f $MODPATH/LICENSE
rm -f $MODPATH/Eleven.apk
rm -f `find /data/dalvik-cache -name *LineageAudioFX*`
rm -f `find /data/system/package_cache -name *LineageAudioFX*`
rm -f `find /data/system/package_cache -name *$PKG*`
ui_print " "

# disable musicfx
ui_print "- Disabling built-in MusicFX..."
pm disable com.android.musicfx
ui_print " "

# attention
ui_print "- Please uninstall/disable other soundfx, so Lineage"
ui_print "  AudioFX can be working properly!"
ui_print " "
ui_print " "
ui_print " "
ui_print " "
ui_print "Regards"
ui_print "Rei Ryuki the Fixer"




