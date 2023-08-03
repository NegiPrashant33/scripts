#!/bin/bash

if [ $# -ne 3 ]; then
	echo "Enter 3 arguments directory name, start range and end range"
	exit 1
fi

base_dir=$1
start_range=$2
end_range=$3

if ! [[ $start_range =~ ^[0-9]+$ ]] || ! [[ $end_range =~ ^[0-9]+$ ]]; then
    echo "Error: Start and end range must be integers."
    exit 1
fi

if [ $start_range -gt $end_range ]; then
    echo "Error: Start range must be less than or equal to end range."
    exit 1
fi

for ((i=start_range; i<=end_range; i++)); do
	dir_name=${base_dir}${i}
	mkdir $dir_name
	echo "Created directory: $dir_name"
done
