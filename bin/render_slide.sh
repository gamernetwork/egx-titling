#!/bin/bash

DURATION=240

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

echo "- Using template $1"
echo "- Using output $2"
echo "- Rendering a $DURATION second clip"

shift $((2))

LD_LIBRARY_PATH=/usr/local/lib/ \
	melt \
	webvfx:$template \
	length=$DURATION \
	"$@" \
	speaker="Mark Kennedy" \
	company="Gamer Network Ltd" \
	transparent=1 \
	-consumer avformat:$output \
	no_audio=1 \
	frame_rate_num=30000 \
	frame_rate_den=1001 \
	width=1920 \
	height=1080 \
	transparent=1 \
	alpha_bits=8 \
	pix_fmt=yuva444p10le \
	mlt_image_format=rgb24a \
	profile=4444 \
	vcodec=prores

