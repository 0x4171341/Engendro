chmod +x files/adb-linux
# CHECK IF IMEI BACKUP ALREADY EXISTS

sudo files/adb-linux pull /sdcard/IMEI-BACKUP/5.img check-backup
if [ -f check-backup ]; then
rm -f check-backup
echo  && echo WARNING: There is already an IMEI backup.
echo  && echo Press ENTER to close this window...
read x
exit
fi


# BACKUP ORIGINAL IMEI TO SDCARD AND COMPUTER

sudo files/adb-linux shell rm -rf /sdcard/IMEI-BACKUP
sudo files/adb-linux shell mkdir /sdcard/IMEI-BACKUP
sudo files/adb-linux shell su -c "dd if=/dev/block/mmcblk0p5 of=/sdcard/IMEI-BACKUP/5.img"
mkdir IMEI-BACKUP
sudo files/adb-linux pull /sdcard/IMEI-BACKUP/5.img IMEI-BACKUP
sudo files/adb-linux kill-server


# CHECK IF IMEI BACKUP WAS SUCCESSFUL

if [ ! -f "IMEI-BACKUP/5.img" ]; then
rm -rf IMEI-BACKUP
echo  && echo ERROR: IMEI backup failed. Check ROOT permissions.
echo  && echo Press ENTER to close this window...
read x
else
echo  && echo IMEI backup finished.
echo  && echo Press ENTER to close this window...
read x
fi
