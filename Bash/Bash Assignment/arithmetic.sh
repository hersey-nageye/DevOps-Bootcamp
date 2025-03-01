#!/bin/bash

# Challenge - Write a script that takes two numbers as input
# from the user and performs basic arithmetic operations
# (addition, subtraction, multipliation and division) and then displays 
# all the answers of those operations in the terminal


echo "Enter first number:"
read num1
echo "Enter second number:"
read num2

addition=$((num1 + num2))
subtraction=$((num1 - num2))
multiplication=$((num1 * num2))
division=$((num1 / num2))

echo "$num1 + $num2 = $addition"
echo "$num1 + $num2 = $subtraction"
echo "$num1 x $num2 = $multiplication"
echo "$num1 / $num2 = $division"