#!/bin/bash

src=/home/prashant/scripts
tgt=/home/prashant/backups
filename=$(date +'%d-%m-%Y').tar.gz


echo "Backup started for $filename"

tar -cvf $tgt/$filename $src

echo "Backup completed"

