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
CurrentTime=$(date +%H:%M:%S)
currentDate=$(date +%A)

###############
# Main        #
###############


welcome1="Welcome to planet $hostname, '$title $myname!'"
timedate="The current time is $CurrentTime on a $currentDate"

echo $welcome1 | cowsay
echo $timedate | cowsay
