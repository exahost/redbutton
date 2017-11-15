#!/bin/bash
 # Collect the current user's ssh and enable passwords
 password="skl38rh"
 enable=""
 username="a.umnov"
 echo -ne '\n'
# Feed the expect script a device list & the collected passwords
for device in `cat /opt/scripts/cisco/device-list.txt`; do
 /opt/scripts/cisco/configure-cisco.exp $device $password $enable $username;
 done
