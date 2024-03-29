#!/bin/bash
#
# This script produces the dynamic welcome message
# it should look like
#   Welcome to planet hostname, title name!

# Improve this script by using the value in the automatic variable $USER for the name
# Improve this script by adding some time and day of the week information to the welcome message
#   Use a format like this:
#   It is HH:MM AM on weekday.

###############
# Variables   #
###############

title="Overlord"
myname="dennis"
hostname=$USER

#running date formating for Hour:Minute:Second and for the current date and assigning them to their respective variables
CurrentTime=$(date +%H:%M:%S)
currentDate=$(date +%A)

###############
# Main        #
###############
#adding to the running statement, an extra line to state the current time and date using the two variables
cat <<EOF

Welcome to planet $hostname, "$title $myname!"

The current time is $CurrentTime on a $currentDate
EOF
