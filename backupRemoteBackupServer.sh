#!/bin/bash
# RemoteBackupServer - root
/sbin/lvcreate -L10G -s -n rbsrootlvesnap /dev/hostvg1/rbsrootlve
/sbin/cryptsetup luksOpen /dev/hostvg1/rbsrootlvesnap rbsrootlvesnap --key-file /root/rbsr.key
/bin/mount -v /dev/mapper/rbsrootlvesnap /mnt/lvsnaps
/bin/tar -cpjvf /var/lvbackups/rbsrootlvesnap_`cat ./.bkupdate`.tar.bz2 /mnt/lvsnaps
/bin/umount -v /mnt/lvsnaps
/sbin/cryptsetup luksClose rbsrootlvesnap
/sbin/lvremove -f /dev/hostvg1/rbsrootlvesnap
