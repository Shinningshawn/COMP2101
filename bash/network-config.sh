#!/bin/bash
#
# this script displays some host identification information for a simple Linux machine
#
# Sample output:
#   Hostname        : hostname
#   LAN Address     : 192.168.2.2
#   LAN Hostname    : host-name-from-hosts-file
#   External IP     : 1.2.3.4
#   External Name   : some.name.from.our.isp

# Task 1: Add a section to the script to define variables which hold the output data for
#         each output item and move the commands which generate the data to that section so that
#         the output command only outputs the labels and single variables.

# Task 2: Add output items for the default router's name and IP address,
#         adding a name to your /etc/hosts file as needed.
# e.g.
#   Router Address  : 192.168.2.1
#   Router Hostname : router-name-from-hosts-file

# Task 3: Add output items for the network's name and IP address, adding a name to your /etc/networks file as needed.
# e.g.
#   Network Number. : 192.168.2.0
#   Network Name    : network-name-from-networks-file

# we use the hostname command to get our system name
# the LAN name is looked up using the LAN address in case it is different from the system name
# finding external information relies on curl being installed and relies on live internet connection
# awk is used to extract only the data we want displayed from the commands which produce extra data
# this command is ugly done this way, so generating the output data into variables is recommended to make the script more readable.
# e.g.
#   interface_name=$(ip a |awk '/: e/{gsub(/:/,"");print $2}')

#cat <<EOF
Hostname=$(hostname)
LAN_Address=$(ip a s $(ip a |awk '/: e/{gsub(/:/,"");print $2}')|awk '/inet /{gsub(/\/.*/,"");print $2}')
LAN_Hostname=$(getent hosts $(ip a s $(ip a |awk '/: e/{gsub(/:/,"");print $2}'))|awk '/inet /{gsub(/\/.*/,"");print $2}' | awk '{print $2}')
External_IP=$(curl -s icanhazip.com)
External_Name=$(getent hosts $(curl -s icanhazip.com) | awk '{print $2}')

#Task
#honestly speaking, it took me longer then i should have figuring out a: what exactly was asked and b: how to do that with commands
#then i realize that part of the next lab achieves the same thing and more in a more clean and efficient way.
#ip route to show routing table, show default to show the route called default. we then pipe the output into cut with -d for a delimiter.
#delimiter meaning to search for values between the specified values, in this case an empty space and -f meaning which field to show, selecting the 3rd field
#everything after the | was thanks to the next lab, my attempt was utilising awk for the default line and attempt to sort the ip out

Router_IP=$(ip route show default| cut -d ' ' -f 3)

#this part also thanks to the next lab, i didn't even think of using the previous variable to find the name in my host file.
#we're using getent to collect info from the file hosts which pulls the data matching the specified search pattern from /etc/hosts
#we pipe that through awk to print only the second section which contains the inputed name which for a while i didn't realise i had to manually add

Router_Name=$(getent hosts $Router_IP|awk '{print $2}')

#at this point i'm half lost as to if i'm overthinking things or just unable to figure out what's going on
#it sounds like we're supposed to fetch info from the /hosts and /networks file but we're adding that info in since they seemed to be missing
#i'm utilising getent to pull the line with the matching value network from networks file and using awk to print the second part to pull the number
#since i couldn't figure out how to pull the network number w/o the name giving the changes between GC and home, so i used the name to pull the number
#the number is utilised to pull the name similar to finding the routername except we look at the first part instead of the second

Network_Number=$(getent networks network|awk '{print $2}')
Network_Name=$(getent networks $Network_Number| cut -d ' ' -f 1)

#this part simply adds the newly added portions that was asked to find/show, keeping to the same format that was present to start with
cat <<EOF
"Hostname       : $Hostname"
"LAN Address    : $LAN_Address"
"LAN hostname   : $LAN_Hostname"
"External IP    : $External_IP"
"External Name  : $External_Name"
"Router Name"   : $Router_Name"
"Router IP"     : $Router_IP"
"Network Name"  : $Network_Name

EOF
