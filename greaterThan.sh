#!/bin/bash

# Print which number is greater of the two

a=10
b=5

if [ $a -gt  $b ]
then
	echo "The greater number is: $a"

elif [ $a -lt $b ]
then
	echo "The greater number is: $b"

else 
	echo "Both numbers are equal"

fi
