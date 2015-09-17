#!/bin/bash

OUTPUT_DIR=~/Videos/egx/

mkdir -p  $OUTPUT_DIR/friday/lowerthirds/
mkdir -p  $OUTPUT_DIR/saturday/lowerthirds/

./bin/render_slide.sh templates/lower_thirds/lt.webvfx.html $OUTPUT_DIR/saturday/lowerthirds/now_1300.mov \
	name="Torment: Tides Of Numenera" info="Colin McComb discusses developing for player experience and perception." \
	title="NOW:"
./bin/render_slide.sh templates/lower_thirds/lt.webvfx.html $OUTPUT_DIR/saturday/lowerthirds/now_1400.mov \
	name="Life Is Strange 2" info="Dontnod Entertainment on what to expect from the next installment of the five part adventure game." \
	title="NOW:"
./bin/render_slide.sh templates/lower_thirds/lt.webvfx.html $OUTPUT_DIR/saturday/lowerthirds/now_1500.mov \
	name="Guild Wars 2: Heart Of Thorns" info="Designers from ArenaNet walkthrough the key features and reveal of the massive open world combat." \
	title="NOW:"
./bin/render_slide.sh templates/lower_thirds/lt.webvfx.html $OUTPUT_DIR/saturday/lowerthirds/now_1600.mov \
	name="Rebirth Of The 3D Platformer" info="Playtonic Games detail plans to resurrect the 3D platformer." \
	title="NOW:"
./bin/render_slide.sh templates/lower_thirds/lt.webvfx.html $OUTPUT_DIR/saturday/lowerthirds/now_1700.mov \
	name="Creative Assembly Game Jam" info="Individuals & teams create a game in a day and have it reviewed by a panel of games industry professionals." \
	title="NOW:"

./bin/render_slide.sh templates/lower_thirds/lt.webvfx.html $OUTPUT_DIR/saturday/lowerthirds/next_1300.mov \
	name="Torment: Tides Of Numenera" info="Colin McComb discusses developing for player experience and perception." \
	title="NEXT:"
./bin/render_slide.sh templates/lower_thirds/lt.webvfx.html $OUTPUT_DIR/saturday/lowerthirds/next_1400.mov \
	name="Life Is Strange 2" info="Dontnod Entertainment on what to expect from the next installment of the five part adventure game." \
	title="NEXT:"
./bin/render_slide.sh templates/lower_thirds/lt.webvfx.html $OUTPUT_DIR/saturday/lowerthirds/next_1500.mov \
	name="Guild Wars 2: Heart Of Thorns" info="Designers from ArenaNet walkthrough the key features and reveal of the massive open world combat." \
	title="NEXT:"
./bin/render_slide.sh templates/lower_thirds/lt.webvfx.html $OUTPUT_DIR/saturday/lowerthirds/next_1600.mov \
	name="Rebirth Of The 3D Platformer" info="Playtonic Games detail plans to resurrect the 3D platformer." \
	title="NEXT:"
./bin/render_slide.sh templates/lower_thirds/lt.webvfx.html $OUTPUT_DIR/saturday/lowerthirds/next_1700.mov \
	name="Creative Assembly Game Jam" info="Individuals & teams create a game in a day and have it reviewed by a panel of games industry professionals." \
	title="NEXT:"
