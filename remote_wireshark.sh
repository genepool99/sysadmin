#!/bin/bash
# Run pcap on a remote computer displaying the data in your local wireshark

IPADDR = "192.168.1.1";
PORT = "22";
USERNAME = "root";

ssh -p $PORT $USERNAME@$IPADDR '/usr/local/bin/tshark -F pcap -f "port !22" -w -' | wireshark -k -i -