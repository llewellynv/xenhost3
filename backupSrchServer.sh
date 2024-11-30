#!/bin/bash
# SrchSvr - root
/sbin/lvcreate -L20G -s -n ssrootlvsnap /dev/hostvg1/ssrootlv
/bin/mount /dev/hostvg1/ssrootlvsnap /mnt/lvsnaps
/bin/tar -cpjvf /var/lvbackups/ssrootlvsnap_`cat ./.bkupdate`.tar.bz2 /mnt/lvsnaps
/bin/umount /mnt/lvsnaps
/sbin/lvremove -f /dev/hostvg1/ssrootlvsnap
