#!/bin/bash
# Quick script to backup a MySQL database to a folder using a dump file

DB_PATH = "/some/path"              # base path to backup folder
DB_BACKUP="/`date +%Y-%m-%d`"       # backup folder title
DB_USER="username"                  # DB username
DB_PASSWD="password"                # DB Password
HN=`hostname | awk -F. '{print $1}'`

# Create the backup directory
mkdir -p "$DB_PATH$DB_BACKUP"

# Remove backups older than 10 days
find $DB_PATH$DB_BACKUP -maxdepth 1 -type d -mtime +10 -exec rm -rf {} \;

# Backup each database on the system
for db in $(mysql --user=$DB_USER --password=$DB_PASSWD -e 'show databases' -s --skip-column-names);
do
        if [ "$db" != "performance_schema" ]; then
                mysqldump --user=$DB_USER --password=$DB_PASSWD --events --opt --single-transaction $db | gzip > "$DB_PATH$DB_BACKUP/mysqldump-$HN-$db-$(date +%Y-%m-%d).gz";
        fi
done
