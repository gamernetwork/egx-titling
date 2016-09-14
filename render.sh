#!/bin/bash

# Convenience script to render everything in one go.

python make_schedule.py schedule/sessions.txt > templates/egx/schedule.js 
./render-lower-thirds.sh $1
./render-slates.sh $1
