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

#difference from the welcome message script, we instead save the lines to variables...
#the 'error' messages seem to only care about the quotes used around the $title $myname
#i can remove them but they'll not be present around the 'overlord dennis' part in output
#however the script runs w/o issue with or without
welcome1="Welcome to planet $hostname, '$title $myname!'"
timedate="The current time is $CurrentTime on a $currentDate"

#and then we echo them and pipe them through cowsay
echo $welcome1 | cowsay
echo $timedate | cowsay
