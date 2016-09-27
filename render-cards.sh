EGX_BASE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OUTPUT_DIR=~/egx/assets/egx-2016
FFOPTS=" -loglevel quiet -y "
mkdir -p $OUTPUT_DIR

# DoV general slates
for file in "egx/end" "egx/end-of-day"; do
	OUT="$OUTPUT_DIR/`basename $file`.mov"
	$EGX_BASE/bin/render_template -d 120 $EGX_BASE/templates/$file.webvfx.html $OUT
	ffmpeg $FFOPTS -r 1 -i $OUT -frames 1 ${OUT/.mov/.png} < /dev/null
done
