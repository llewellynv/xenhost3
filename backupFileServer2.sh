#!/bin/bash
# Fileserver - root
/sbin/lvcreate -L10G -s -n fsrootlvesnap /dev/hostvg1/fsrootlve
/sbin/cryptsetup luksOpen /dev/hostvg1/fsrootlvesnap fsrootlvesnap --key-file /root/fsr.key
/bin/mount /dev/mapper/fsrootlvesnap /mnt/lvsnaps
/bin/tar -cpjvf /var/lvbackups/fsrootlvesnap_`cat ./.bkupdate`.tar.bz2 /mnt/lvsnaps
/bin/umount /mnt/lvsnaps
/sbin/cryptsetup luksClose fsrootlvesnap
/sbin/lvremove -f /dev/hostvg1/fsrootlvesnap
