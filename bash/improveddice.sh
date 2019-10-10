#!/bin/bash
#
# this script rolls a pair of six-sided dice and displays both the rolls and the sum
#

# Improve this script by re-organizing it to:
#  put the number of sides in a variable which is used as the range for the random number
#  put the bias, or offset, for the RANDOM number in a variable (it is 1 for our purposes)
#     - you can think of this as the minimum value for the generated number
#  roll the dice using the variables for the range and bias i.e. RANDOM % range + bias
#  generate the sum of the dice
#  generate the average of the dice
#  display a summary of what was rolled, and what the result was

# Tell the user we have started processing
echo "Rolling..."
#generating a random value with a range of 1-100 and saving it to variable diceSide
diceSide=$(( RANDOM % 100 + 1))
#generating a random value with a range of 1-25 and saving it to variable diceOffset
diceOffset=$((RANDOM % 25 + 1))
#generating a RANDOM value and running the result through a modulus of the variable diceSide and adding diceOffset to the results
die1=$(( RANDOM % diceSide + diceOffset ))
die2=$(( RANDOM % diceSide + diceOffset ))
# sum up the rolls
sum=$(( die1 + die2 ))
# display the results of the two dice rolls and providing the sum of the two dice
echo "Rolled $die1, $die2 for a sum of $sum"
#calculating and displaying the average of the two dice by add the two values together and dividing the result by two
echo "the average of the two dice is $(((die1 + die2) / 2 ))"

#an extra bit added just to confirm function by informing us what the variables diceSide and diceOffset was.
echo "diceside is $diceSide, diceOffset is $diceOffset,"
