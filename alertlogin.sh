#!/bin/bash
# put this script in /etc/profile.d to send the PUSHOVER_USER a message
# when someone is logged in to the server

PREFIX="LOGIN ALERT!";
REMOTEIP=$(/bin/echo $SSH_CLIENT | /usr/bin/awk '{ print $1 }');
TIME=$(/bin/date +'%r, %D');
HOST=$(/bin/hostname);
PUSHOVER_TOKEN = "YOURTOKEN"
PUSHOVER_USER = "USERID"

if [[ "$REMOTEIP" == "" ]]; then
   REMOTEIP='localhost';
fi
   
curl --silent \
 --form-string "token=$PUSHOVER_TOKEN" \
 --form-string "user=$PUSHOVER_USER" \
 --form-string "title=$PREFIX $USER@$HOST $TIME" \
 --form-string "message=Remote user $USER just logged in to $HOST at $TIME from $REMOTEIP" \
 https://api.pushover.net/1/messages.json > /dev/null
