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
COUNTER=1
SCHEDULE_DURATION=1200
while read line; do

	DAY=$(echo "$line" | cut -f 1)
	START=$(echo "$line" | cut -f 2)
	FINISH=$(echo "$line" | cut -f 3)
	NAME=$(echo "$line" | cut -f 4)
	INFO=$(echo "$line" | cut -f 5)

	tDAY[$COUNTER]=$(echo "$line" | cut -f 1)
	tSTART[$COUNTER]=$(echo "$line" | cut -f 2)
	tFINISH[$COUNTER]=$(echo "$line" | cut -f 3)
	tNAME[$COUNTER]=$(echo "$line" | cut -f 4)
	tINFO[$COUNTER]=$(echo "$line" | cut -f 5)

	
	echo "Rendering $DAY, $START-$FINISH: $NAME"
	echo "-------------------------------------------"
	render "$DAY" "$START" "$FINISH" "$NAME" "$INFO"
	echo

    echo "Rendering schedule $DAY skip: $SKIP"
    $EGX_BASE/bin/render_template -d $SCHEDULE_DURATION $EGX_BASE/templates/egx/schedule.webvfx.html $OUTPUT_DIR/$DAY/video/schedule.$START.mov day=$DAY skip=$COUNTER

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


## this is all broken :(
#mkdir -p $OUTPUT_DIR/friday/slates/
#
#./bin/render_slide.sh -d 150 templates/slates/full_schedule.webvfx.html $OUTPUT_DIR/friday/slates/full_schedule.mov \
#	t1="${tSTART[1]} - ${tFINISH[1]}" s1="${tNAME[1]}" d1="${tINFO[1]}" \
#	t2="${tSTART[2]} - ${tFINISH[2]}" s2="${tNAME[2]}" d2="${tINFO[2]}" \
#	t3="${tSTART[3]} - ${tFINISH[3]}" s3="${tNAME[3]}" d3="${tINFO[3]}" \
#	t4="${tSTART[4]} - ${tFINISH[4]}" s4="${tNAME[4]}" d4="${tINFO[4]}" \
#	t5="${tSTART[5]} - ${tFINISH[5]}" s5="${tNAME[5]}" d5="${tINFO[5]}" \
#	t6="${tSTART[6]} - ${tFINISH[6]}" s6="${tNAME[6]}" d6="${tINFO[6]}" \
#	day="FRIDAY"

#./bin/render_slide.sh -d 180 templates/slates/full_schedule.webvfx.html $OUTPUT_DIR/saturday/slates/full_schedule.mp4 \
#	t1="13:00 - 13:40" s1="Torment: Tides Of Numenera" d1="Colin McComb discusses developing for player experience and perception." \
#	day="SATURDAY"
#
#./bin/render_slide.sh -d 180 templates/slates/full_schedule.webvfx.html $OUTPUT_DIR/friday/slates/tomorrow.mp4 \
#	t1="13:00 - 13:40" s1="Torment: Tides Of Numenera" d1="Colin McComb discusses developing for player experience and perception." \
#	t2="14:00 - 14:40" s2="Life Is Strange 2" d2="Dontnod Entertainment on what to expect from the next installment of the five part adventure game." \
#	t3="15:00 - 15:40" s3="Guild Wars 2: Heart Of Thorns" d3="Designers from ArenaNet walkthrough the key features and reveal of the massive open world combat." \
#	t4="16:00 - 16:40" s4="Rebirth Of The 3D Platformer" d4="Playtonic Games detail plans to resurrect the 3D platformer." \
#	t5="17:00 - 17:40" s5="Creative Assembly Game Jam" d5="Individuals & teams create a game in a day and have it reviewed by a panel of games industry professionals." \
#	day="COME BACK TOMORROW FOR"
