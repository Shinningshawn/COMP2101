#!/bin/bash
# This script demonstrates how to trap signals and handle them using functions

# Task: Add traps for the INT and QUIT signals. If the script receives an INT signal,
#       reset the count to the maximum and tell the user they are not allowed to interrupt
#       the count. If the script receives a QUIT signal, tell the user they found the secret
#       to getting out of the script and exit immediately.

# Task: Explain in a comment how the line with the word moose in it works.
# task answer: the line in question is an echo command as a process line of the error-message function.
# programName is a variable assigned earlier that uses basename with $0 to fetch the file's name to utilise in the script
# ${1: tells the machine it's looking at the first arguement in the list with the error message attached to it
#l astly the >&2 says to send all of that output from ${1:message_here} to the same destination as stderr
# this means that that portion will not print out onto the terminal

#### Variables
programName="$(basename $0)" # used by error_functions.sh
sleepTime=1 # delay used by sleeptime
numberOfSleeps=10 # how many sleeps to wait for before quitting for inactivity

#### Functions

# This function will send an error message to stderr
# Usage:
#   error-message ["some text to print to stderr"]
#
function error-message {
        echo "${programName}: ${1:-Unknown Error - a moose bit my sister once...}" >&2
}

# This function will send a message to stderr and exit with a failure status
# Usage:
#   error-exit ["some text to print" [exit-status]]
#
function error-exit {
        error-message "$1"
        exit "${2:-1}"
}
function usage {
        cat <<EOF
Usage: ${programName} [-h|--help ] [-w|--waittime waittime] [-n|--waitcount waitcount]
Default waittime is 1, waitcount is 10
EOF
}

function trap-INT { #Created the trapint function to serve as the reaction to the trap for Interupt signals
    sleepCount="$(($numberOfSleeps+1 ))" #I assign sleepcount back to the number of sleeps +1 so that it starts back at the starting/max count rather than 1 less
    echo ": you may not use Interupt in this script, resetting countdown..." #an echo message informing them of what has just happened
}

function trap-QUIT { #created the trapquit function to server as the reaction to the trap for quit signals
  echo ": Congrats on finding the secret exit method, exiting now..." #an echo message informing them on utilising the desired signal method
  exit #exit to end the script w/o waiting out the remaining sleepcounts
}



#### Main Program

# Process command line parameters

trap trap-INT SIGINT #created the traps for SIGINT (interupt) and SIGQUIT (quit) specified them to run their respective Functions
trap trap-QUIT SIGQUIT

while [ $# -gt 0 ]; do
    case $1 in
        -w | --waittime )
            shift
            sleepTime="$1"
            ;;
        -n | --waitcount)
            shift
            numberOfSleeps="$1"
            ;;
        -h | --help )
            usage
            exit
            ;;
        * )
            usage
            error-exit "$1 not a recognized option"
    esac
    shift
done

if [ ! $numberOfSleeps -gt 0 ]; then
    error-exit "$numberOfSleeps is not a valid count of sleeps to wait for signals"
fi

if [ ! $sleepTime -gt 0 ]; then
    error-exit "$sleepTime is not a valid time to sleep while waiting for signals"
fi

sleepCount=$numberOfSleeps

while [ $sleepCount -gt 0 ]; do
    echo "Waiting $sleepCount more times for signals"
    sleep $sleepTime
    sleepCount=$((sleepCount - 1))
done
echo "Wait counter expired, exiting peacefully"
