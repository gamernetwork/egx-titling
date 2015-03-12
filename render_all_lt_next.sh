#!/bin/bash

OUTPUT_DIR=~/Videos/egx/

mkdir -p  $OUTPUT_DIR/friday/lowerthirds/
mkdir -p  $OUTPUT_DIR/saturday/lowerthirds/

./bin/render_single_slide.sh templates/lower_thirds/lt.webvfx.html $OUTPUT_DIR/friday/lowerthirds/now_1300.mov \
	name="Virtual Reality in 2015" info="Valve's Chet Faliszek looks forward to creating content for 2015 and beyond." \
	title="NOW:"
./bin/render_single_slide.sh templates/lower_thirds/lt.webvfx.html $OUTPUT_DIR/friday/lowerthirds/now_1400.mov \
	name="Total War" info="15 years of battle animation in Total War with Developers from Creative Assembly." \
	title="NOW:"
./bin/render_single_slide.sh templates/lower_thirds/lt.webvfx.html $OUTPUT_DIR/friday/lowerthirds/now_1500.mov \
	name="The Swindle" info="Dan Marshall talks stealth game design decisions." \
	title="NOW:"
./bin/render_single_slide.sh templates/lower_thirds/lt.webvfx.html $OUTPUT_DIR/friday/lowerthirds/now_1600.mov \
	name="Titan Souls" info="Mark Foster and David Fenn from Devolver Digital on the origins of their team and the design philosophy" \
	title="NOW:"
./bin/render_single_slide.sh templates/lower_thirds/lt.webvfx.html $OUTPUT_DIR/friday/lowerthirds/now_1700.mov \
	name="LA Cops" info="Modern Dream on the fast, action packed 3D top down shooter." \
	title="NOW:"

./bin/render_single_slide.sh templates/lower_thirds/lt.webvfx.html $OUTPUT_DIR/saturday/lowerthirds/next_1300.mov \
	name="Torment: Tides Of Numenera" info="Colin McComb discusses developing for player experience and perception." \
	name="NEXT:"
./bin/render_single_slide.sh templates/lower_thirds/lt.webvfx.html $OUTPUT_DIR/saturday/lowerthirds/next_1400.mov \
	name="Life Is Strange 2" info="Dontnod Entertainment on what to expect from the next installment of the five part adventure game." \
	name="NEXT:"
./bin/render_single_slide.sh templates/lower_thirds/lt.webvfx.html $OUTPUT_DIR/saturday/lowerthirds/next_1500.mov \
	name="Guild Wars 2: Heart Of Thorns" info="Designers from ArenaNet walkthrough the key features and reveal of the massive open world combat." \
	name="NEXT:"
./bin/render_single_slide.sh templates/lower_thirds/lt.webvfx.html $OUTPUT_DIR/saturday/lowerthirds/next_1600.mov \
	name="Rebirth Of The 3D Platformer" info="Playtonic Games detail plans to resurrect the 3D platformer." \
	name="NEXT:"
./bin/render_single_slide.sh templates/lower_thirds/lt.webvfx.html $OUTPUT_DIR/saturday/lowerthirds/next_1700.mov \
	name="Creative Assembly Game Jam" info="Individuals & teams create a game in a day and have it reviewed by a panel of games industry professionals." \
	name="NEXT:"

for file in $OUTPUT_DIR/{friday,saturday}/lowerthirds/*.mov;
do
	avconv -ss 5 -r 1 -i $file -frames 1 ${file/.mov/.png}
	rm $file
done;
