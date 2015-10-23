# tail the messages log without TCP information
tail -n 100000 /var/log/messages | grep "$H" | grep -v 'TCP connection attempt:'
