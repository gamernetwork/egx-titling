#!/bin/bash

DURATION=150
#FILENAME=EGX`date +%Y`_`date +%a_%T`_$SHOT.ts

usage()
{
cat << EOF
usage: $0 options <template filename> <output filename>

Renders egx titling templates to Prores

OPTIONS:
   -h      Show this message
   -d      Duration of render in seconds (default=150)
EOF
}

while getopts “d:” OPTION
do
     case $OPTION in
         h)
             usage
             exit 1
             ;;
         d)
             DURATION=$OPTARG
		 	 echo "Rendering a $DURATION second clip\n"
             ;;
         ?)
             usage
             exit
             ;;
     esac
done

shift $((OPTIND-1))

template=$1
output=$2
echo "Using template $template"
echo "Using output $output"

# pop off everything but custom params
shift $((2))

LD_LIBRARY_PATH=/usr/local/lib/ \
	melt \
	-profile atsc_1080p_30 \
	webvfx:$template \
	length=$DURATION \
	"$@" \
	-consumer avformat:$output \
	vb=8000k \
	preset=fast \
	no_audio=1 \
	frame_rate_num=30000 \
	frame_rate_den=1001 \
	width=1920 \
	height=1080

