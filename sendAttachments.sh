#!/bin/bash
# Send email with attachments to multiple users with MUTT
T="$(date +%s)"
NOW=$(date +"%m-%d-%Y %T")
/usr/bin/php /home/USER/script.php > /home/USER/someFile.txt
/usr/bin/mutt -s "Important File - $NOW" some@person.com -c some@person2.com -a /home/USER/someFile.txt < /home/USER/SomeEmailTxt
T="$(($(date +%s)-T))"
echo "/home/USER/script.php - Completed Report: in ${T} seconds."
