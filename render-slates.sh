#!/bin/bash

# Renders full screen slates for
# - Now
# - Next
# - "Technical difficulties"
# - "Join us next year"
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

	NEXT_IN_VID="$OUTPUT_DIR/$DAY/video/next-in-$START.mov"
	NEXT_IN_STATIC="$OUTPUT_DIR/$DAY/static/next-in-$START.png"
	#NEXT_OUT_VID="$OUTPUT_DIR/$DAY/video/next-out-$START.mov"
	#NEXT_OUT_STATIC="$OUTPUT_DIR/$DAY/static/next-out-$START.png"

	mkdir -p $OUTPUT_DIR/$DAY/video
	mkdir -p $OUTPUT_DIR/$DAY/static

	$EGX_BASE/bin/render_template -d 600 $EGX_BASE/templates/egx/next.webvfx.html $NEXT_IN_VID \
		time="$START - $FINISH" \
		name="$NAME" \
		build="in" \
		info="$INFO"

	#$EGX_BASE/bin/qtrle_render_slide.sh -d 120 $EGX_BASE/templates/egx/next.webvfx.html $NEXT_OUT \
	#	time="$START - $FINISH" \
	#	name="$NAME" \
	#	build="out" \
	#	info="$INFO"

	# Convert to PNG
	ffmpeg $FFOPTS -ss 00:00:10 -r 1 -i $NEXT_IN_VID -frames 1 $NEXT_IN_STATIC < /dev/null
	#ffmpeg $FFOPTS -ss 00:00:10 -r 1 -i $NEXT_OUT_VID -frames 1 $NEXT_OUT_STATIC < /dev/null
}

# Read from sesssions.txt and build the lower thirds
declare -a tDAY
declare -a tSTART
declare -a tFINISH
declare -a tNAME
declare -a tINFO
COUNTER=0
SCHEDULE_DURATION=1200
while read line; do

	DAY=$(echo "$line" | cut -f 1)
	START=$(echo "$line" | cut -f 2)
	FINISH=$(echo "$line" | cut -f 3)
	NAME=$(echo "$line" | cut -f 4)
	INFO=$(echo "$line" | cut -f 5)

	echo "-------------------------------------------"
	echo "Day $DAY, $START-$FINISH: $NAME"
    echo "Rendering lower thirds"
	render "$DAY" "$START" "$FINISH" "$NAME" "$INFO"
    echo "Rendering schedule skip: $COUNTER"
    $EGX_BASE/bin/render_template -d $SCHEDULE_DURATION $EGX_BASE/templates/egx/schedule.webvfx.html $OUTPUT_DIR/$DAY/video/schedule.$START.mov day=$DAY skip=$COUNTER
	echo "---DONE---"
	echo

	COUNTER=$((COUNTER + 1))
	SCHEDULE_DURATION=$((SCHEDULE_DURATION - 100))

done < $1

exit 0

# Do general slates
for file in "technical_difficulties" "egx/end" "egx/end-of-day"; do
	OUT="$OUTPUT_DIR/$file.mov"
	$EGX_BASE/bin/render_template -d 10 $EGX_BASE/templates/$file.webvfx.html $OUT
	ffmpeg $FFOPTS -r 1 -i $OUT -frames 1 ${OUT/.mov/.png} < /dev/null
done
