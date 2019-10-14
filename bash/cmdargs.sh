#!/bin/bash
# This script demonstrates how the shift command works
debuglevel='0'
unknownargs=' '
verbs='off'

# loop through the command line arguments
while [ $# -gt 0 ]; do
  # tell the user how many things are left on the command line
  echo "There are $# things left to process on the command line."
  # display whatever is in $1
  echo '$1 has '"''$1' in it."

# TASK 1: replace the echo command that just says processing with a case statement that
#             recognizes the following command line options and tells the user if
#             they were found on the command line
#          Options to recognize: -h for help, -v for verbose mode
# TASK 2: add recognition of a debug option -d that expects a number that specifies the debug level (e.g. -d 3)
#             save the debug level in a variable to be available to use later in the script
#             display an error if the user gave the -d option without a number after it
# TASK 3: put anything that wasn't recognized on the command line into a variable for use later in the script
  echo "Processing '$1'."
  case "$1" in
    "-h" | "--help")
      if [ $verbs = 'yes' ]
        then echo "displaying available help text"
      fi
      echo "[-h|--help] [-d [1-5]|--debug [1-5] [-v|-verbose]]"
      exit
  ;;
    "-v" | "--verbose" )
        if [ $verbs = 'on' ]
          then
            echo "verbose mode already active"
          else
            verbs="on"
            echo "engaging verbose mode"
        fi
  ;;
    "-d" | "--debug" )
      case $2 in
        1 | 2 | 3 | 4 | 5 )
          echo "engaging debug level $2"
          debuglevel=$2
            if [ $verbs = 'yes' ]
              then echo "shifting command line one extra spot to accomidate for utilised debug level"
            fi
          shift
      ;;
      * )
        echo "unknown debug level, please use a value between 1 and 5"
        exit
      ;;
    esac
  ;;
  * )
    if [ $verbs = 'yes' ]
      then echo 'unrecognized arguement $1, saving for later'
    fi
    unknownargs=("$unknownargs$1 ")
  ;;
  esac

  # each time through the loop, shift the arguments left
  # this decrements the argument count for us
  shift
  # tell the user we shifted things
  echo "Shifted command line, leaving $# things left to process."
  echo ' '
  echo "--------------------------"
  echo ' '
  # go back to the top of the loop to see if anything is left to work on
done
echo "these were the unknown arguements provided :'$unknownargs':"
echo "debug level was set to $debuglevel"
echo "verbose more was set to $verbs"
echo "Done"
