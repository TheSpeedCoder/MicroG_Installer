#!/sbin/sh
#
# ADDOND_VERSION=1
#
# /system/addon.d/80-Phonesky.sh
# During a system upgrade, this script backs up F-Droid client and privext,
# /system is formatted and reinstalled, then the files are restored.
# Back up and restore Micro G!
#

. /tmp/backuptool.functions

list_files() {
cat <<EOF
/product/etc/permissions/privapp-permissions-com.google.android.gms.xml
/product/etc/permissions/privapp-permissions-com.android.vending.xml
/product/etc/permissions/privapp-permissions-com.google.android.maps.xml
/product/priv-app/GmsCore/GmsCore.apk
/product/priv-app/Phonesky/Phonesky.apk
/product/priv-app/GsfProxy/GsfProxy.apk
/product/framework/com.google.android.maps.jar
EOF
}

case "$1" in
  backup)
    list_files | while read FILE; do
      backup_file "$FILE"
    done
  ;;
  restore)
    list_files | while read FILE; do
      restore_file "$FILE"
    done
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
    # Stub
  ;;
esac
