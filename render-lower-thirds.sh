#!/bin/bash

# Renders lower thirds for
# - Now
# - Next
# Outputs .mov and .png files.

OUTPUT_DIR=~/Videos/egx-2016
mkdir -p $OUTPUT_DIR

function render {

	DAY=$1
	START=$2
	FINISH=$3
	NAME=$4
	INFO=$5
	
	TEMPLATE_NOW=templates/egx/overlay-lower-left.webvfx.html
	TEMPLATE_NEXT=templates/egx/lower-right-thirds.webvfx.html
	
	NOW="$OUTPUT_DIR/$DAY/lower-thirds-now-$START.mov"
	NEXT="$OUTPUT_DIR/$DAY/lower-thirds-next-$START.mov"

	mkdir -p $OUTPUT_DIR/$DAY

	# Now
	./bin/qtrle_render_slide.sh $TEMPLATE_NOW $NOW \
		title="NOW" \
		start="$START" \
		name="$NAME" \
		info="$INFO"

	# Next
	./bin/qtrle_render_slide.sh $TEMPLATE_NEXT $NEXT \
		title="NEXT" \
		start="$START" \
		name="$NAME" \
		info="$INFO"

	# Convert to PNG
	ffmpeg -loglevel quiet -ss 00:00:05 -r 1 -y -i "$NOW" -frames 1 "${NOW/.mov/.png}" < /dev/null
	ffmpeg -loglevel quiet -ss 00:00:05 -r 1 -y -i "$NEXT" -frames 1 "${NEXT/.mov/.png}" < /dev/null
}

# Read from sesssions.txt and build the lower thirds
while read line; do

echo "$line"

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
