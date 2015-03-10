LD_LIBRARY_PATH=/usr/local/lib/ \
	melt \
	webvfx:$1 \
	length=50 \
	speaker="Mark Kennedy" \
	company="Gamer Network Ltd" \
	transparent=1 \
	-consumer avformat:$2 \
	vcodec=qtrle \
	no_audio=1 \
	mlt_image_format=rgb24a \
	frame_rate_num=30000 \
	frame_rate_den=1001 \
	width=1920 \
	height=1080 \
	transparent=1 \
	pix_fmt=argb
