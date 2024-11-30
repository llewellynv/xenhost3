/sbin/cryptsetup -v luksOpen /dev/hostvg1/fshome2lv edrv0  --key-file /root/Grade9.mp3
/sbin/e2fsck -f /dev/mapper/edrv0
/sbin/cryptsetup -v luksClose edrv0

/sbin/cryptsetup -v luksOpen /dev/hostvg1/fspics2lv edrv1  --key-file /root/Waterloo.mp3
/sbin/e2fsck -f /dev/mapper/edrv1
/sbin/cryptsetup -v luksClose edrv1

/sbin/cryptsetup -v luksOpen /dev/hostvg2/fsimgbackups2lv edrv2  --key-file /root/Imagine.mp3
/sbin/e2fsck -f /dev/mapper/edrv2
/sbin/cryptsetup -v luksClose edrv2

/sbin/cryptsetup -v luksOpen /dev/hostvg1/fshomeshared2lv edrv3  --key-file /root/Fernando.mp3
/sbin/e2fsck -f /dev/mapper/edrv3
/sbin/cryptsetup -v luksClose edrv3

/sbin/cryptsetup -v luksOpen /dev/hostvg2/fsimgbackups2lv edrv4  --key-file /root/Imagine.mp3
/sbin/e2fsck -f /dev/mapper/edrv4
/sbin/cryptsetup -v luksClose edrv4


