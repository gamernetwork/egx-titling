#!/bin/bash

# Renders lower thirds for
# - Now
# - Next
# Outputs .mov and .png files.

EGX_BASE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OUTPUT_DIR=~/egx/assets/egx-2016
FFOPTS=" -loglevel quiet -y "
mkdir -p $OUTPUT_DIR

function render {

	DAY=$1
	START=$2
	FINISH=$3
	NAME=$4
	INFO=$5
	
	TEMPLATE_NOW=$EGX_BASE/templates/egx/overlay-lower-left.webvfx.html
	TEMPLATE_NEXT=$EGX_BASE/templates/egx/lower-right-thirds.webvfx.html
	
	NOW_VID="$OUTPUT_DIR/$DAY/video/lower-thirds-now-$START.mov"
	NEXT_VID="$OUTPUT_DIR/$DAY/video/lower-thirds-next-$START.mov"
	NOW_STATIC="$OUTPUT_DIR/$DAY/static/lower-thirds-now-$START.png"
	NEXT_STATIC="$OUTPUT_DIR/$DAY/static/lower-thirds-next-$START.png"

	mkdir -p $OUTPUT_DIR/$DAY/video/
	mkdir -p $OUTPUT_DIR/$DAY/static/

	# Now
	$EGX_BASE/bin/render_template $TEMPLATE_NOW $NOW_VID \
        --duration 360 \
		title="NOW" \
		start="$START" \
		name="$NAME" \
		info="$INFO"

	# Next
	$EGX_BASE/bin/render_template $TEMPLATE_NEXT $NEXT_VID \
        --duration 360 \
		title="NEXT" \
		start="$START" \
		name="$NAME" \
		info="$INFO"

	# Generate a still
	ffmpeg $FFOPTS -ss 00:00:05 -r 1 -i "$NOW_VID" -frames 1 "$NOW_STATIC" < /dev/null
	ffmpeg $FFOPTS quiet -ss 00:00:05 -r 1 -i "$NEXT_VID" -frames 1 "$NEXT_STATIC" < /dev/null
}

# Read from sesssions.txt and build the lower thirds
while read line; do

	_DAY=$(echo "$line" | cut -f 1)
	_START=$(echo "$line" | cut -f 2)
	_FINISH=$(echo "$line" | cut -f 3)
	_NAME=$(echo "$line" | cut -f 4)
	_INFO=$(echo "$line" | cut -f 5)
	
	echo "Rendering $_DAY, $_START-$_FINISH: $_NAME"
	echo "-------------------------------------------"
	render "$_DAY" "$_START" "$_FINISH" "$_NAME" "$_INFO"
	echo

done < $1
