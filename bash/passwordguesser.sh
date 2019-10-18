#!/bin/bash
# This script demonstrates testing to see if 2 strings are the same

# TASK 1: Improve it by asking the user for a password guess instead of using inline literal data
# TASK 2: Improve it by rewriting it to use the if command
# TASK 3: Improve it by giving them 3 tries to get it right before failing (test 3 times but only if necessary)
#           *** Do not use the exit command

#adjusted the first line to use read to instruct the user and capture the user's input, assigning it to myString


#assign the referenceString (the password the user is trying to guess) and userGuesses (to keep track of user's attempt count)

#TASK
#added a userGuesses variable to set a value before performing the while loop
referenceString="password"
userGuesses=0

#initiating a while statement to begin the process, upon reaching 3 userGuesses, the statement is false and the while ends w/o using exit
while [ $userGuesses != 3 ]

  #this section asks the user to guess the password and captures their input assigning it to the variable myString
  #we then run if to compare the two variables to see if the guess was correct
  do
    read -p "please guess the password: " myString
    if [ $myString = $referenceString ]

      #this section runs if the statement above is true, telling the user they succeeded and breaking the while loop
      then
        echo "You guessed the password!"
        break

      #this section runs if the if statement above is false, we increase the user guess count by 1
      #we then inform the user that they were incorrect and tell them which guess out of 3 they attempted
      else
        userGuesses=$(($userGuesses + 1 ))
        echo "incorrect, that was guess $userGuesses/3 attempts..."

        #an if statement in the incorrect section to check if their guesscount is equal to 3
        #a return of true means that they have hit their limit, informing them of this before finishing the if statement and subsequently the while loop
        if [ $userGuesses = 3 ]
          then
            echo "The password eludes you..."
          fi
      fi
  done
  #done to denote the end of the while loop's content, with nothing else beyond this, the script has reached it's end and finishes without utilising exit
  #both successful and unseccessful finish by reaching the end of the script rather then using exit

  #extra note
  #the ammount of times i've messed this up because my brain keeps going into 2nd semester python language mode is insane, but the structure and format was similar to what I used in python
  #hopefully this is acceptable, however i suspect there is a way easier method to achieving this requirement
