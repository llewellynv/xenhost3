#!/bin/bash
#
VERSIONS="5"
cd /home/llewellyn
date +'%Y%m%d'> ./.bkupdate
date +'%T' > /var/log/lvbackups/cleanupLVSnapFiles_`cat ./.bkupdate`.log 2>&1

/bin/bash cleanupFiles.sh /var/lvbackups hs2rootlvsnap $VERSIONS >> /var/log/lvbackups/cleanupLVSnapFiles_`cat ./.bkupdate`.log 2>&1

/bin/bash cleanupFiles.sh /var/lvbackups fsrootlvesnap $VERSIONS >> /var/log/lvbackups/cleanupLVSnapFiles_`cat ./.bkupdate`.log 2>&1

#/bin/bash cleanupFiles.sh /var/lvbackups msrootlvsnap $VERSIONS >> /var/log/lvbackups/cleanupLVSnapFiles_`cat ./.bkupdate`.log 2>&1

/bin/bash cleanupFiles.sh /var/lvbackups rbsrootlvesnap $VERSIONS >> /var/log/lvbackups/cleanupLVSnapFiles_`cat ./.bkupdate`.log 2>&1

#/bin/bash cleanupFiles.sh /var/lvbackups dhcp-g1rootlvsnap $VERSIONS >> /var/log/lvbackups/cleanupLVSnapFiles_`cat ./.bkupdate`.log 2>&1

#/bin/bash cleanupFiles.sh /var/lvbackups ssrootlvsnap $VERSIONS >> /var/log/lvbackups/cleanupLVSnapFiles_`cat ./.bkupdate`.log 2>&1

# finish
date +'%T' >> /var/log/lvbackups/cleanupLVSnapFiles_`cat ./.bkupdate`.log 2>&1

