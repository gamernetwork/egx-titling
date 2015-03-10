#!/bin/bash

LD_LIBRARY_PATH=/usr/local/lib melt webvfx:/home/mark/Documents/Work/egx/2015/sessions/titling/poc.html width=1920 height=1080 length=300 progressive=0 -consumer sdl audio_off=1 frame_rate_num=60 frame_rate_den=1 width=960 height=540 display_aspect_num=1920 display_aspect_den=1080 progressive=0 sample_aspect_num=1 sample_aspect_den=1 terminate_on_pause=1
