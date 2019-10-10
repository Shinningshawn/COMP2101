#!/bin/bash
#
# this script demonstrates doing arithmetic

# Improve this script by asking the user to supply the two numbers
# Improve this script by demonstrating using subtraction and multiplication
# Improve this script by demonstrating the modulus operation
#   - the output should look something like:
#   - first divided by second gives X with a remainder of Y
# Improve this script by calculating and displaying the first number raised to the power of the second number


#read with -p to provide a prompt to capture text, some text to explain what the user is being asked for.
#the input is assigned to the variables called firstnum and secondnum
read -p "input a number :" firstnum
read -p "input a second number :" secondnum

# a collection of lines performing various calculations using different arithmetic signs and assigning all the results to various variables
# + is addition, - is subtractions, / is division (without any remainder), % is modulus (division's remainder only), ** is exponent
sum=$((firstnum + secondnum))
difference=$((firstnum - secondnum))
dividend=$((firstnum / secondnum))
product=$((firstnum * secondnum))
modulus=$((firstnum % secondnum))
powerOf=$((firstnum ** secondnum))
#This was the line already provided, which provides the results of the long division in decimal format
fpdividend=$(awk "BEGIN{printf \"%.2f\", $firstnum/$secondnum}")

#each line outputs the assigned variables explaining what math was performed for each result
cat <<EOF

$firstnum plus $secondnum is $sum
$firstnum subtract $secondnum is $difference
$firstnum multiplied by $secondnum is $product
$firstnum modulus $secondnum is $modulus
$firstnum raised to the power of $secondnum is $powerOf
$firstnum divided by $secondnum is $dividend with a remainder of $modulus
  - More precisely, it is $fpdividend
EOF
