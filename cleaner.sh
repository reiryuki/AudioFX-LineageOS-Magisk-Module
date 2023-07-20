[ -z $MODPATH ] && MODPATH=${0%/*}

# cleaning
APPS="`ls $MODPATH/system/priv-app | sed 's|Lineage||g'`
      `ls $MODPATH/system/app | sed 's|Lineage||g'`
      org.lineageos.platform-res.apk"
for APP in $APPS; do
  rm -f `find /data/system/package_cache -type f -name *$APP*`
  rm -f `find /data/dalvik-cache /data/resource-cache -type f -name *$APP*.apk`
done
PKGS=`cat $MODPATH/package.txt`
for PKG in $PKGS; do
  rm -rf /data/user*/*/$PKG/cache/*
done











