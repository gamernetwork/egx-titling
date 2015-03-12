#!/bin/bash

OUTPUT_DIR=~/Videos/egx/

mkdir -p  $OUTPUT_DIR/friday/slates/
mkdir -p  $OUTPUT_DIR/saturday/slates/

./bin/render_slide_noalpha.sh -d 180 templates/slates/full_schedule.webvfx.html $OUTPUT_DIR/friday/slates/full_schedule.mp4 \
	t1="13:00 - 13:40" s1="Virtual Reality in 2015" d1="Valve's Chet Faliszek looks forward to creating content for 2015 and beyond." \
	t2="14:00 - 14:40" s2="Total War" d2="15 years of battle animation in Total War with Developers from Creative Assembly." \
	t3="15:00 - 15:40" s3="The Swindle" d3="Dan Marshall talks stealth game design decisions." \
	t4="16:00 - 16:40" s4="Titan Souls" d4="Mark Foster and David Fenn from Devolver Digital on the origins of their team and the design philosophy" \
	t5="17:00 - 17:40" s5="LA Cops" d5="Modern Dream on the fast, action packed 3D top down shooter." \
	day="FRIDAY"

./bin/render_slide_noalpha.sh -d 180 templates/slates/full_schedule.webvfx.html $OUTPUT_DIR/saturday/slates/full_schedule.mp4 \
	t1="13:00 - 13:40" s1="Torment: Tides Of Numenera" d1="Colin McComb discusses developing for player experience and perception." \
	t2="14:00 - 14:40" s2="Life Is Strange 2" d2="Dontnod Entertainment on what to expect from the next installment of the five part adventure game." \
	t3="15:00 - 15:40" s3="Guild Wars 2: Heart Of Thorns" d3="Designers from ArenaNet walkthrough the key features and reveal of the massive open world combat." \
	t4="16:00 - 16:40" s4="Rebirth Of The 3D Platformer" d4="Playtonic Games detail plans to resurrect the 3D platformer." \
	t5="17:00 - 17:40" s5="Creative Assembly Game Jam" d5="Individuals & teams create a game in a day and have it reviewed by a panel of games industry professionals." \
	day="SATURDAY"

./bin/render_slide_noalpha.sh -d 180 templates/slates/full_schedule.webvfx.html $OUTPUT_DIR/friday/slates/tomorrow.mp4 \
	t1="13:00 - 13:40" s1="Torment: Tides Of Numenera" d1="Colin McComb discusses developing for player experience and perception." \
	t2="14:00 - 14:40" s2="Life Is Strange 2" d2="Dontnod Entertainment on what to expect from the next installment of the five part adventure game." \
	t3="15:00 - 15:40" s3="Guild Wars 2: Heart Of Thorns" d3="Designers from ArenaNet walkthrough the key features and reveal of the massive open world combat." \
	t4="16:00 - 16:40" s4="Rebirth Of The 3D Platformer" d4="Playtonic Games detail plans to resurrect the 3D platformer." \
	t5="17:00 - 17:40" s5="Creative Assembly Game Jam" d5="Individuals & teams create a game in a day and have it reviewed by a panel of games industry professionals." \
	day="COME BACK TOMORROW FOR"

#fri 

./bin/render_slide_noalpha.sh -d 180 templates/slates/now.webvfx.html $OUTPUT_DIR/friday/slates/now_1300.mp4 \
	sessionName="Virtual Reality in 2015" sessionInfo="Valve's Chet Faliszek looks forward to creating content for 2015 and beyond." 

./bin/render_slide_noalpha.sh -d 180 templates/slates/now.webvfx.html $OUTPUT_DIR/friday/slates/now_1400.mp4 \
	sessionName="Total War" sessionInfo="15 years of battle animation in Total War with Developers from Creative Assembly." 

./bin/render_slide_noalpha.sh -d 180 templates/slates/now.webvfx.html $OUTPUT_DIR/friday/slates/now_1500.mp4 \
	sessionName="The Swindle" sessionInfo="Dan Marshall talks stealth game design decisions." 

./bin/render_slide_noalpha.sh -d 180 templates/slates/now.webvfx.html $OUTPUT_DIR/friday/slates/now_1600.mp4 \
	sessionName="Titan Souls" sessionInfo="Mark Foster and David Fenn from Devolver Digital on the origins of their team and the design philosophy" 

./bin/render_slide_noalpha.sh -d 180 templates/slates/now.webvfx.html $OUTPUT_DIR/friday/slates/now_1700.mp4 \
	sessionName="LA Cops" sessionInfo="Modern Dream on the fast, action packed 3D top down shooter." 


./bin/render_slide_noalpha.sh -d 180 templates/slates/next.webvfx.html $OUTPUT_DIR/friday/slates/next_1300.mp4 \
	sessionName="Virtual Reality in 2015" sessionInfo="Valve's Chet Faliszek looks forward to creating content for 2015 and beyond." 

./bin/render_slide_noalpha.sh -d 180 templates/slates/next.webvfx.html $OUTPUT_DIR/friday/slates/next_1400.mp4 \
	sessionName="Total War" sessionInfo="15 years of battle animation in Total War with Developers from Creative Assembly." 

./bin/render_slide_noalpha.sh -d 180 templates/slates/next.webvfx.html $OUTPUT_DIR/friday/slates/next_1500.mp4 \
	sessionName="The Swindle" sessionInfo="Dan Marshall talks stealth game design decisions." 

./bin/render_slide_noalpha.sh -d 180 templates/slates/next.webvfx.html $OUTPUT_DIR/friday/slates/next_1600.mp4 \
	sessionName="Titan Souls" sessionInfo="Mark Foster and David Fenn from Devolver Digital on the origins of their team and the design philosophy" 

./bin/render_slide_noalpha.sh -d 180 templates/slates/next.webvfx.html $OUTPUT_DIR/friday/slates/next_1700.mp4 \
	sessionName="LA Cops" sessionInfo="Modern Dream on the fast, action packed 3D top down shooter." 


#sat

./bin/render_slide_noalpha.sh -d 180 templates/slates/now.webvfx.html $OUTPUT_DIR/saturday/slates/now_1300.mp4 \
	sessionName="Torment: Tides Of Numenera" sessionInfo="Colin McComb discusses developing for player experience and perception." 

./bin/render_slide_noalpha.sh -d 180 templates/slates/now.webvfx.html $OUTPUT_DIR/saturday/slates/now_1400.mp4 \
	sessionName="Life Is Strange 2" sessionInfo="Dontnod Entertainment on what to expect from the next installment of the five part adventure game." 

./bin/render_slide_noalpha.sh -d 180 templates/slates/now.webvfx.html $OUTPUT_DIR/saturday/slates/now_1500.mp4 \
	sessionName="Guild Wars 2: Heart Of Thorns" sessionInfo="Designers from ArenaNet walkthrough the key features and reveal of the massive open world combat." 

./bin/render_slide_noalpha.sh -d 180 templates/slates/now.webvfx.html $OUTPUT_DIR/saturday/slates/now_1600.mp4 \
	sessionName="Rebirth Of The 3D Platformer" sessionInfo="Playtonic Games detail plans to resurrect the 3D platformer." 

./bin/render_slide_noalpha.sh -d 180 templates/slates/now.webvfx.html $OUTPUT_DIR/saturday/slates/now_1700.mp4 \
	sessionName="Creative Assembly Game Jam" sessionInfo="Individuals & teams create a game in a day and have it reviewed by a panel of games industry professionals." 


./bin/render_slide_noalpha.sh -d 180 templates/slates/next.webvfx.html $OUTPUT_DIR/saturday/slates/next_1300.mp4 \
	sessionName="Torment: Tides Of Numenera" sessionInfo="Colin McComb discusses developing for player experience and perception." 

./bin/render_slide_noalpha.sh -d 180 templates/slates/next.webvfx.html $OUTPUT_DIR/saturday/slates/next_1400.mp4 \
	sessionName="Life Is Strange 2" sessionInfo="Dontnod Entertainment on what to expect from the next installment of the five part adventure game." 

./bin/render_slide_noalpha.sh -d 180 templates/slates/next.webvfx.html $OUTPUT_DIR/saturday/slates/next_1500.mp4 \
	sessionName="Guild Wars 2: Heart Of Thorns" sessionInfo="Designers from ArenaNet walkthrough the key features and reveal of the massive open world combat." 

./bin/render_slide_noalpha.sh -d 180 templates/slates/next.webvfx.html $OUTPUT_DIR/saturday/slates/next_1600.mp4 \
	sessionName="Rebirth Of The 3D Platformer" sessionInfo="Playtonic Games detail plans to resurrect the 3D platformer." 

./bin/render_slide_noalpha.sh -d 180 templates/slates/next.webvfx.html $OUTPUT_DIR/saturday/slates/next_1700.mp4 \
	sessionName="Creative Assembly Game Jam" sessionInfo="Individuals & teams create a game in a day and have it reviewed by a panel of games industry professionals." 


./bin/render_slide_noalpha.sh -d 180 templates/slates/join_us_for_egx.webvfx.html $OUTPUT_DIR/saturday/slates/join_us_for_egx.mp4

