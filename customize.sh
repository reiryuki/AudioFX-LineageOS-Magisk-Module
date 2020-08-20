# check android
if [ "$API" -lt 29 ]; then
  abort "- ! Unsupported sdk: $API. You have to upgrade your Android version at least Android 10 SDK API 29 to use this module!"
else
  ui_print "- Device sdk: $API"
fi

# remove unused file
rm -f $MODPATH/LICENSE

# install eleven music
if ! pm list packages | grep -Eq org.lineageos.eleven; then
  ui_print "- Installing Lineage Eleven Music as user app..."
  pm install $MODPATH/Eleven.apk
  rm -f $MODPATH/Eleven.apk
fi

# disable musicfx
ui_print "- Disabling built-in MusicFX..."
pm disable com.android.musicfx

# attention
ui_print "- Please uninstall another sound FX and disable built-in FX, it can't be working together!"

