#!/bin/bash

while read line; do

	DAY=$(echo "$line" | cut -f 1)
	TIME=$(echo "$line" | cut -f 2)
	NAME=$(echo "$line" | cut -f 3)
	INFO=$(echo "$line" | cut -f 4)

done < sessions.txt