#!/bin/bash
# fecha has a formated date
fecha=`date +"%d-%m-%Y"`
# Backup and gzip the directory
tar zcvf /var/yedek/backups/sutasmarket_bup-$fecha.tgz --exclude '/var/www/sutasmarket/image/cache/*' --exclude '/var/www/sutasmarket/image/cache' -C / var/www > /dev/null
# Rotate the logs, delete older than 7 days
find /var/yedek/backups/ -mtime +14 -exec rm {} \; 
rsync -a --delete --password-file=/var/rsync_pass_omv /var/yedek/ rsync://msutas@192.168.10.211:873/MARKET-OMV
