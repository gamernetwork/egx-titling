#!/bin/bash

OUTPUT_DIR=~/Videos/egx/2015
mkdir -p $OUTPUT_DIR

function render {

	DAY=$1
	TIME=$2
	NAME=$3
	INFO=$4
	
	TEMPLATE="templates/lower-thirds.webvfx.html"
	
	NOW="$OUTPUT_DIR/$DAY/now-$TIME.mov"
	NEXT="$OUTPUT_DIR/$DAY/next-$TIME.mov"

	mkdir -p $OUTPUT_DIR/$DAY

	# Now
	./bin/qtrle_render_slide.sh $TEMPLATE $NOW \
		title="NOW" \
		name="$NAME" \
		info="$INFO"

	# Next
	./bin/qtrle_render_slide.sh $TEMPLATE $NEXT \
		title="NEXT" \
		name="$NAME" \
		info="$INFO"

	# Convert to PNG
	avconv -ss 3 -r 1 -i $NOW -frames 1 ${NOW/.mov/.png}
	avconv -ss 3 -r 1 -i $NEXT frames 1 ${NEXT/.mov/.png}
}

# Read from sesssions.txt and build the lower thirds
while read line; do

	DAY=$(echo "$line" | cut -f 1)
	TIME=$(echo "$line" | cut -f 2)
	NAME=$(echo "$line" | cut -f 3)
	INFO=$(echo "$line" | cut -f 4)
	
	echo "Rendering $DAY, $TIME: $NAME"
	echo "-------------------------------------------"
	render $DAY $TIME $NAME $INFO
	echo

done < sessions.txt

#avplay $OUTPUT_DIR/thursday/lowerthirds/now-1300.mov -x 640 -y 360