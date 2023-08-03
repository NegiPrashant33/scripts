#!/bin/bash

# Count the frequency of the character "s" in the word mississippi

x=mississippi

grep -o "s" <<< "$x" | wc -l
