#!/bin/bash
#
# Host - root
#
/sbin/lvcreate -L10G -s -n hs2rootlvsnap /dev/hostvg1/hs2rootlv
/bin/mount /dev/hostvg1/hs2rootlvsnap /mnt/lvsnaps
/bin/tar -cpjvf /var/lvbackups/hs2rootlvsnap_`cat ./.bkupdate`.tar.bz2 /mnt/lvsnaps
/bin/umount /mnt/lvsnaps
/sbin/lvremove -f /dev/hostvg1/hs2rootlvsnap

