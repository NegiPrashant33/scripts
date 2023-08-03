#!/bin/bash

src=/home/prashant/demo
base_dir=day

for ((day=11; day<=90; day++))
do
	dir_name="$base_dir$day"
	mkdir "$src/$dir_name"

	touch "$src/$dir_name/answers.md"
	touch "$src/$dir_name/tasks.md"
done
