#!/bin/bash
#
cd /home/llewellyn
date +'%Y%m%d'> ./.rbkupdate
date +'%T' > /var/log/lvbackups/rbackup_`cat ./.rbkupdate`.log 2>&1

rsync -av /var/lvbackups/ /mnt/OneDriveBkup/d0/data/d3 >> /var/log/lvbackups/rbackup_`cat ./.rbkupdate`.log 2>&1

# finish
date +'%T' >> /var/log/lvbackups/rbackup_`cat ./.rbkupdate`.log 2>&1

