#!/bin/bash

OUTPUT_DIR=~/Videos/egx/2015

mkdir -p $OUTPUT_DIR
mkdir -p $OUTPUT_DIR/thursday
mkdir -p $OUTPUT_DIR/friday
mkdir -p $OUTPUT_DIR/saturday
mkdir -p $OUTPUT_DIR/sunday

function render {

	# Now
	./bin/qtrle_render_slide.sh templates/lower_thirds/lt.webvfx.html $OUTPUT_DIR/$1/now-$2.mov \
		title="NOW" \
		name="$3" \
		info="$4"

	# Next
	./bin/qtrle_render_slide.sh templates/lower_thirds/lt.webvfx.html $OUTPUT_DIR/$1/next-$2.mov \
		title="NEXT" \
		name="$3" \
		info="$4"

	# Convert to PNG
	$file = $OUTPUT_DIR/$1/now-$2.mov
	avconv -ss 5 -r 1 -i "$file" -frames 1 ${file/.mov/.png}

	$file = $OUTPUT_DIR/$1/next-$2.mov
	avconv -ss 5 -r 1 -i "$file" -frames 1 ${file/.mov/.png}
}

render "thursday" "1300" "Lords of War!" "Creative Assembly host live gameplay of Total War: WARHAMMER."
#render "thursday" "1400" "Hellblade" "A behind the scenes look at the creation of Ninja Theory's new title."
#render "thursday" "1500" "Valve: The Year Ahead in VR" "Valve developer Chet Faliszek looks ahead to the year in VR."
#render "thursday" "1600" "Creating Real Games in Virtual Reality" "nDreams founder Patrick O'Luanaigh gives a candid view on developing games for VR."
#render "thursday" "1700" "TBA" "TBA."

#render "friday" "1300" "The Journey of VR - Project Morpheus" "Developers from PlayStation give attendees a little insight into Sony's latest innovations."
#render "friday" "1400" "TBA" "TBA."
#render "friday" "1500" "Homefront: The Revolution" "Devs from Dambuster Studios walk gamers through the process of rebooting Homefront."
#render "friday" "1600" "Elite Dangerous" "David Braben and Frontier developers discuss the past, present, and future of Elite Dangerous."
#render "friday" "1700" "Total War: ARENA - The Journey to Closed Beta" "Creative Assembly explore the journey taken by the Total War: ARENA developers in creating this epic game."

#render "saturday" "1300" "20 Years of Play - a Q&A with Shuhei Yoshida" "Shuhei Yoshida, President of Worldwide Studios SCE, looks back at the last 20 years of PlayStation."
#render "saturday" "1400" "Prison Architect" "Producer Mark and Director Chris will present a live update video showing the secret features that they've been developing."
#render "saturday" "1500" "TBA" "TBA."
#render "saturday" "1600" "An Uncharted Retrospective - Greatness from Small Beginnings" "Naught Dog's Arne Meyer shares anecdotes from a decade of development of the Uncharted series."
#render "saturday" "1700" "TBA" "TBA."

#render "sunday" "1300" "Mike Bithell" "Mike Bithell talks about his games, how he got to making them, and answers your questions."
#render "sunday" "1400" "Eitr" "Eitr - How it started and where it's going."
#render "sunday" "1500" "Eurogamer Live Let's Play" "The Eurogamer team show off their Merio Maker skills and get members of the audience to test their mettle."
#render "sunday" "1600" "TBA" "TBA."
#render "sunday" "1700" "TBA" "TBA."

#avplay $OUTPUT_DIR/thursday/lowerthirds/now-1300.mov -x 640 -y 360
