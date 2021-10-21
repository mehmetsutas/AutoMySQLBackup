#!/bin/bash
# fecha has a formated date
fecha=`date +"%d-%m-%Y"`
# Backup and gzip the directory
tar zcvf /var/yedek/backups/muhasebe_bup-$fecha.tgz -C / var/www/muhasebe > /dev/null
# Rotate the logs, delete older than 7 days
find /var/yedek/backups/ -mtime +14 -exec rm {} \; 
rsync -a --delete --password-file=/var/rsync_pass_qnap /var/yedek/ rsync://qnap_rsync@192.168.2.211:873/Muhasebe_NAS
