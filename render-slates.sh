#!/bin/bash

# Renders full screen slates for
# - Now
# - Next
# - "Technical difficulties"
# - "Join us next year"
# Outputs .mov and .png files.

OUTPUT_DIR=~/Videos/egx-2016
FFOPTS=" -loglevel quiet -y "
mkdir -p $OUTPUT_DIR
mkdir -p $OUTPUT_DIR/idents

function render {

	DAY=$1
	START=$2
	FINISH=$3
	NAME=$4
	INFO=$5

	#NOW="$OUTPUT_DIR/$DAY/now-$START.mov"
	NEXT_IN="$OUTPUT_DIR/$DAY/next-in-$START.mov"
	NEXT_OUT="$OUTPUT_DIR/$DAY/next-out-$START.mov"

	mkdir -p $OUTPUT_DIR/$DAY

	# Now
	#./bin/qtrle_render_slide.sh templates/now.webvfx.html $NOW \
	#	time="$START - $FINISH" \
	#	name="$NAME" \
	#	info="$INFO"

	# Next
	#./bin/qtrle_render_slide.sh -d 120 templates/egx/next.webvfx.html $NEXT_IN \
	#	time="$START - $FINISH" \
	#	name="$NAME" \
	#	build="in" \
	#	info="$INFO"

	echo ./bin/qtrle_render_slide.sh templates/egx/next.webvfx.html $NEXT_OUT \
		time="$START - $FINISH" \
		name="$NAME" \
		build="out" \
		info="$INFO"

	# Convert to PNG
	#ffmpeg $FFOPTS -ss 00:00:03 -r 1 -i $NEXT_IN -frames 1 ${NEXT_IN/.mov/.png} < /dev/null
	ffmpeg $FFOPTS -ss 00:00:03 -r 1 -i $NEXT_OUT -frames 1 ${NEXT_OUT/.mov/.png} < /dev/null
}

# Ident
#for file in idents/*.mov; do
#	cp $file "$OUTPUT_DIR/${file}"
#	ffmpeg $FFOPTS -ss 00:00:05 -r 1 -i $file -frames 1 "$OUTPUT_DIR/${file/.mov/.png}" < /dev/null
#done


# Read from sesssions.txt and build the lower thirds
declare -a tDAY
declare -a tSTART
declare -a tFINISH
declare -a tNAME
declare -a tINFO
COUNTER=1
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

	COUNTER=$((COUNTER + 1))
	
	echo "Rendering $DAY, $START-$FINISH: $NAME"
	echo "-------------------------------------------"
	render "$DAY" "$START" "$FINISH" "$NAME" "$INFO"
	echo

done < $1

exit 0

# Do general slates
for file in "technical_difficulties" "join_us_for_egx"; do
	OUT="$OUTPUT_DIR/$file.mov"
	./bin/qtrle_render_slide.sh -d 10 templates/$file.webvfx.html $OUT
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
