#!/bin/bash

# Renders full screen slates for
# - Now
# - Next
# - "Technical difficulties"
# - "Join us next year"
# Outputs .mov and .png files.

OUTPUT_DIR=~/Videos/egx-rezzed-2016
mkdir -p $OUTPUT_DIR
mkdir -p $OUTPUT_DIR/idents

function render {

	DAY=$1
	START=$2
	FINISH=$3
	NAME=$4
	INFO=$5

	NOW="$OUTPUT_DIR/$DAY/now-$START.mov"
	NEXT="$OUTPUT_DIR/$DAY/next-$START.mov"

	mkdir -p $OUTPUT_DIR/$DAY

	# Now
	./bin/render_slide.sh templates/now.webvfx.html $NOW \
		time="$START - $FINISH" \
		name="$NAME" \
		info="$INFO"

	# Next
	./bin/render_slide.sh templates/next.webvfx.html $NEXT \
		time="$START - $FINISH" \
		name="$NAME" \
		info="$INFO"

	# Convert to PNG
	avconv -ss 00:00:03 -r 1 -i $NOW -frames 1 ${NOW/.mov/.png}
	avconv -ss 00:00:03 -r 1 -i $NEXT -frames 1 ${NEXT/.mov/.png}
}

# Ident
for file in idents/*.mov; do
	cp $file "$OUTPUT_DIR/${file}"
	avconv -ss 00:00:05 -r 1 -i $file -frames 1 "$OUTPUT_DIR/${file/.mov/.png}"
done

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

done < schedule/sessions.txt

# Do general slates
for file in "technical_difficulties" "join_us_for_egx"; do
	OUT="$OUTPUT_DIR/$file.mov"
	./bin/render_slide.sh -d 2 templates/$file.webvfx.html $OUT
	avconv -r 1 -i $OUT -frames 1 ${OUT/.mov/.png}
done
