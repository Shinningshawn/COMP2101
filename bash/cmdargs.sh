#!/bin/bash
# This script demonstrates how the shift command works

#TASK
#we start by assigning some variables for future use in the script

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

#TASK
# and here we begin the identification process for specified arguements.
# the case loop to test for matching arguement names and performs the appropriate sections to each arguement
# note i wasn't sure how much extra detail you wanted so i added extra portions should -v be active.
# all situations of if [ $verbs = 'on' ] know that that outputs text to provide extra info on what is happening
# asside from 1 test in -v | --verbose, the tests are only add echo dialog

  echo "Processing '$1'."
  case "$1" in
    # we start with -h --help for the help arguement
    # when this part is matched, we echo the utilised possible arguements and exit the script to allow the user to re-active the script using the arguements
    "-h" | "--help")
      if [ $verbs = 'on' ]
        then echo "displaying available help text"
      fi
      echo "[-h|--help] [-d [1-5]|--debug [1-5] [-v|-verbose]]"
      exit

  ;;

    # if -v | --verbose is matched, then we first test to see if verbose is already active.
    # we then inform the user if it is or isn't and activate verbose if it isn't

    "-v" | "--verbose" )
        if [ $verbs = 'on' ]
          then
            echo "verbose mode already active"
          else
            verbs="on"
            echo "engaging verbose mode"
        fi

  ;;

    # if -d | --debug is matched, we run a case within the case to test the second arguement for a numerical value
    # if we match one of the 5 numbers, we inform the user that they have activated debug mode and assign the debug lvl to their numbers
    # lastly to avoid running through the script with the numerical value from $2, we perform an extra shift to accomidate this
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

      # this portion only runs if $2 does not match any of our 5 numbers then we infrom them of the error and exit the script
      # this portion does not shift as the script would exit due to error
      * )
        echo "unknown debug level, please use a value between 1 and 5"
        exit

    ;;

    esac

  ;;

  #lastly any values that does not match will be assigned to the variable unknownargs
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
#this portion was added to inform the user on the changes they made
#as well as which arguements were unrecognized before finishing the script
echo "these were the unknown arguements provided :'$unknownargs':"
echo "debug level was set to $debuglevel"
echo "verbose more was set to $verbs"
echo "Done"
