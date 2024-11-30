#!/bin/sh
cd /home/llewellyn
date +'%Y%m%d'> ./.pvmovedate
date +'%T' > /var/log/md1pvmove_`cat ./.pvmovedate`.log 2>&1
echo "Starting..." >> /var/log/md1pvmove_`cat ./.pvmovedate`.log 2>&1

declare -a lvols=(
"/dev/hostvg1/fsbackuplv"
"/dev/hostvg1/fspics2lv"
"/dev/hostvg1/fshomeshared2lv"
"/dev/hostvg1/fshome2lv"
"/dev/hostvg1/fs2rootlv"
"/dev/hostvg1/fs2swaplv"
"/dev/hostvg1/rbserver-swap"
"/dev/hostvg1/rbserver-disk"
"/dev/hostvg1/msrootlv"
"/dev/hostvg1/msswaplv"
"/dev/hostvg1/dhcp-g1rootlv"
"/dev/hostvg1/dhcp-g1swaplv"
"/dev/hostvg1/ssrootlv"
"/dev/hostvg1/ssswaplv"
"/dev/hostvg1/rbsrootlv"
"/dev/hostvg1/rbsswaplv"
)

for i in "${lvols[@]}"
do
	date +'%T' >> /var/log/md1pvmove_`cat ./.pvmovedate`.log 2>&1
	echo "Moving..." $i >> /var/log/md1pvmove_`cat ./.pvmovedate`.log 2>&1

	/sbin/pvmove -i 300 -v -n $i /dev/md1 /dev/md2 >> /var/log/md1pvmove_`cat ./.pvmovedate`.log 2>&1

	echo "finished" >> /var/log/md1pvmove_`cat ./.pvmovedate`.log 2>&1
	date +'%T' >> /var/log/md1pvmove_`cat ./.pvmovedate`.log 2>&1
	echo " " >> /var/log/md1pvmove_`cat ./.pvmovedate`.log 2>&1
done

date +'%T' >> /var/log/md1pvmove_`cat ./.pvmovedate`.log 2>&1
echo "Completed." >> /var/log/md1pvmove_`cat ./.pvmovedate`.log 2>&1

