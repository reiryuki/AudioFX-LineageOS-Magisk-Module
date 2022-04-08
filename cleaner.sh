PKG="lineageos.platform org.lineageos.audiofx"
for PKGS in $PKG; do
  rm -rf /data/user/*/$PKGS/cache/*
done



