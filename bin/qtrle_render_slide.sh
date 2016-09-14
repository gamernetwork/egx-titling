#!/bin/bash

DURATION=600

usage()
{
cat << EOF
usage: $0 options <template filename> <output filename> [var=val ...]

Renders egx titling templates to Prores

OPTIONS:
   -h      Show this message
   -d      Duration of render in frames (default=600)
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
echo "- Using template $template"
echo "- Using output $output"
echo "- Rendering a $DURATION second clip"

shift $((2))

melt \
	-profile atsc_1080p_60 \
	webvfx:$template \
	length=$DURATION \
	"$@" \
	transparent=1 \
	-consumer avformat:$output \
	vcodec=qtrle \
	no_audio=1 \
	mlt_image_format=rgb24a \
	frame_rate_num=60 \
	frame_rate_den=1 \
	width=1920 \
	height=1080 \
	transparent=1 \
	pix_fmt=argb
