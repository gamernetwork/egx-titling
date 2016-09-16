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
	IMAGE=$6

	NEXT_IN_VID="$OUTPUT_DIR/$DAY/video/next-in-$START.mov"
	NEXT_IN_STATIC="$OUTPUT_DIR/$DAY/static/next-in-$START.png"
	NEXT_OUT_VID="$OUTPUT_DIR/$DAY/video/next-out-$START.mov"
	NEXT_OUT_STATIC="$OUTPUT_DIR/$DAY/static/next-out-$START.png"

	mkdir -p $OUTPUT_DIR/$DAY/video
	mkdir -p $OUTPUT_DIR/$DAY/static

	$EGX_BASE/bin/render_template -d 120 $EGX_BASE/templates/egx/next.webvfx.html $NEXT_IN_VID \
		time="$START - $FINISH" \
		name="$NAME" \
		build="in" \
		info="$INFO" \
		image="$IMAGE"

	$EGX_BASE/bin/render_template -d 120 $EGX_BASE/templates/egx/next.webvfx.html $NEXT_OUT_VID \
		time="$START - $FINISH" \
		name="$NAME" \
		build="out" \
		info="$INFO" \
		image="$IMAGE"

	# Convert to PNG
	ffmpeg $FFOPTS -ss 00:00:10 -r 1 -i $NEXT_IN_VID -frames 1 $NEXT_IN_STATIC < /dev/null
	ffmpeg $FFOPTS -ss 00:00:01 -r 1 -i $NEXT_OUT_VID -frames 1 $NEXT_OUT_STATIC < /dev/null
}

# Read from sesssions.txt and build the lower thirds
declare -a tDAY
declare -a tSTART
declare -a tFINISH
declare -a tNAME
declare -a tINFO
declare -a tIMAGE
COUNTER=0
SCHEDULE_SLIDE_DURATION=180
SCHEDULE_BASE_DURATION=540
while read line; do

	DAY=$(echo "$line" | cut -f 1)
	START=$(echo "$line" | cut -f 2)
	FINISH=$(echo "$line" | cut -f 3)
	NAME=$(echo "$line" | cut -f 4)
	INFO=$(echo "$line" | cut -f 5)
	IMAGE=$(echo "$line" | cut -f 6)

	daycount=`grep -ce "^$DAY" $1`
	SCHEDULE_DURATION=$((SCHEDULE_BASE_DURATION + (daycount - COUNTER) * SCHEDULE_SLIDE_DURATION))

	echo "-------------------------------------------"
	echo "Day $DAY, $START-$FINISH: $NAME"
    echo "Rendering lower thirds"
	render "$DAY" "$START" "$FINISH" "$NAME" "$INFO" "$IMAGE"
    echo "Rendering schedule skip: $COUNTER"
    $EGX_BASE/bin/render_template -d $SCHEDULE_DURATION $EGX_BASE/templates/egx/schedule.webvfx.html $OUTPUT_DIR/$DAY/video/schedule.$START.mov day=$DAY skip=$COUNTER
	echo "---DONE---"
	echo

	COUNTER=$((COUNTER + 1))

done < $1

exit 0

# Do general slates
for file in "technical_difficulties" "egx/end" "egx/end-of-day"; do
	OUT="$OUTPUT_DIR/$file.mov"
	$EGX_BASE/bin/render_template -d 10 $EGX_BASE/templates/$file.webvfx.html $OUT
	ffmpeg $FFOPTS -r 1 -i $OUT -frames 1 ${OUT/.mov/.png} < /dev/null
done
