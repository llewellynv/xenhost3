#!/bin/bash
#
cd /home/llewellyn
date +'%Y%m%d'> ./.bkupdate
date +'%T' > /var/log/lvbackups/backupLVSnaps_`cat ./.bkupdate`.log 2>&1

/bin/bash backupFileServer2.sh >> /var/log/lvbackups/backupLVSnaps_`cat ./.bkupdate`.log 2>&1

#/bin/bash backupMediaServer2.sh >> /var/log/lvbackups/backupLVSnaps_`cat ./.bkupdate`.log 2>&1

/bin/bash backupRemoteBackupServer.sh >> /var/log/lvbackups/backupLVSnaps_`cat ./.bkupdate`.log 2>&1

#/bin/bash backupSrchServer.sh >> /var/log/lvbackups/backupLVSnaps_`cat ./.bkupdate`.log 2>&1

/bin/bash backupXenHost3.sh >> /var/log/lvbackups/backupLVSnaps_`cat ./.bkupdate`.log 2>&1

# finish
date +'%T' >> /var/log/lvbackups/backupLVSnaps_`cat ./.bkupdate`.log 2>&1
