#!/bin/bash
#
# MediaServer2 - root
#
/sbin/lvcreate -L4G -s -n msrootlvsnap /dev/hostvg1/msrootlv
/bin/mount /dev/hostvg1/msrootlvsnap /mnt/lvsnaps
/bin/tar -cpjvf /var/lvbackups/msrootlvsnap_`cat ./.bkupdate`.tar.bz2 /mnt/lvsnaps
/bin/umount /mnt/lvsnaps
/sbin/lvremove -f /dev/hostvg1/msrootlvsnap

