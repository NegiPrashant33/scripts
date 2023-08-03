#!/bin/bash

# Print numbers divisible by 3 and 5 but not 15 from the range of 1 to 100

for i in $(seq 1 100)
do
if ([ $(expr $i % 3) == 0 ] || [ $(expr $i % 5) == 0 ]) && [ $(expr $i % 15) != 0 ]
    then
        echo $i
    fi
done

