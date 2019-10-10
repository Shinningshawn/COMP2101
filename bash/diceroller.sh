#!/bin/bash
#
# this script rolls a pair of six-sided dice
#

# Improve this script by adding a second line of output showing a roll of 5 six-sided dice
# Improve this script by adding a third line of output that rolls a single 20-sided die
# These improvements should also take into consideration the user, and make all 3 output lines self-explanatory to the user
#    - e.g. the first line should be changed to read something like:
#         Rolling a pair of standard dice: x,y rolled
#      and the other output lines should be similarly helpful to the user

# roll the dice and display the result
echo "
 Rolling a pair of 6-sided Dice...
 $(( RANDOM % 6 + 1)), $(( RANDOM % 6 + 1 )) rolled
 "
# Simular to what was performed above, RANDOM is used 5 seperate times to generate a random number for each dice.
# We run that generated number through the math formula modulus of 6 (to make the number in the range of a 6 sided die)
# and add 1 to match a dice roll else the remainder is always 0-5 when a dice goes from 1-6
# this is all run through echo with wording to tell the user the dice rolled values
echo "
 rolling 5 more 6-sided dice...
 $(( RANDOM % 6 +1)), $(( RANDOM % 6 + 1 )), $(( RANDOM % 6 + 1 )), $(( RANDOM % 6 + 1 )), $(( RANDOM % 6 + 1 )), rolled
 "
# again simular to what was ran above, only we're aiming for a 20 sided Dice
# this time we run the number generated from RANDOM through modulus 20 instead of 6 to simulate 20 possible number
#the plus 1 again achieves the goal of a dice roll of 1-20 instead of 0-19 that RANDOM % 20 yields
echo "
 rolling a single 20-sided dice...
 $((RANDOM % 20 +1)), rolled
 "
