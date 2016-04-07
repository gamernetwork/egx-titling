#!/bin/bash

# Renders lower thirds for
# - Now
# - Next
# Outputs .mov and .png files.

OUTPUT_DIR=~/Videos/egx-rezzed-2016
mkdir -p $OUTPUT_DIR

function render {

	DAY=$1
	START=$2
	FINISH=$3
	NAME=$4
	INFO=$5
	
	TEMPLATE=templates/lower-thirds.webvfx.html
	TEMPLATE_NOW=templates/lower-left-thirds.webvfx.html
	TEMPLATE_NEXT=templates/lower-right-thirds.webvfx.html
	
	NOW="$OUTPUT_DIR/$DAY/lower-thirds-now-$START.mov"
	NEXT="$OUTPUT_DIR/$DAY/lower-thirds-next-$START.mov"

	mkdir -p $OUTPUT_DIR/$DAY

	# Now
	./bin/qtrle_render_slide.sh $TEMPLATE_NOW $NOW \
		title="NOW" \
		name="$NAME" \
		info="$INFO"

	# Next
	./bin/qtrle_render_slide.sh $TEMPLATE_NEXT $NEXT \
		title="NEXT" \
		name="$NAME" \
		info="$INFO"

	# Convert to PNG
	LD_LIBRARY_PATH=/usr/local/lib/ /usr/local/bin/ffmpeg -ss 00:00:03 -r 1 -i $NOW -frames 1 ${NOW/.mov/.png}
	LD_LIBRARY_PATH=/usr/local/lib/ /usr/local/bin/ffmpeg -ss 00:00:03 -r 1 -i $NEXT -frames 1 ${NEXT/.mov/.png}
}

# Read from sesssions.txt and build the lower thirds
while read line; do

	DAY=$(echo "$line" | cut -f 1)
	START=$(echo "$line" | cut -f 2)
	FINISH=$(echo "$line" | cut -f 3)
	NAME=$(echo "$line" | cut -f 4)
	INFO=$(echo "$line" | cut -f 5)
	
	echo "Rendering $DAY, $START-$FINISH: $NAME"
	echo "-------------------------------------------"
	render "$DAY" "$START" "$FINISH" "$NAME" "$INFO"
	echo

done < $1
