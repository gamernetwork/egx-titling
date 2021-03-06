Want to work for Gamer Network? [We are hiring!](http://www.gamesindustry.biz/jobs/gamer-network)

# EGX Rezzed titling templates

Titling framework using HTML, GSAP, and WebVFX for MLT.

Tested on Linux only (Ubuntu 16.04 LTS).

## Installing render pipeline

You need `melt` and the WebVFX plugin from the MLT project. While `melt` is generally avaiable in most distros, WebVFX is not. Two options:

### HARD WAY

Build it all from source.

```
sudo apt-get install libmlt-dev libmlt++-dev build-essential qt4-dev-tools libavcodec-dev libavdevice-dev libavfilter-dev libavresample-dev libavutil-dev libswscale-dev
```

Build and install:

  - https://github.com/mltframework/mlt
  - https://github.com/mltframework/webvfx

### EASIER WAY

Install Shotcut, the MLT based video editor, from a all-inc tarball.

https://www.shotcut.org/download/

Unpack somewhere and update your environment.

e.g.

```
cd ~/opt/
tar -xjvf shotcut-debian8-x86_64-160901.tar.bz2
export PATH=~/opt/Shotcut/Shotcut.app/:$PATH
export LD_LIBRARY_PATH=~/opt/Shotcut/Shotcut.app/lib/:$PATH
```

## QUICK: Howto render lower thirds as static PNGs

(Quick hack because Wirecast dropped support for Animation Codec temporarily with Version 6)
 
```
./render_all_lt_next.sh
```

Puts renders in ~/Videos/egx/*day/lowerthirds/

## QUICK: Howto render animated slates for playout

```
./render_all_slates.sh
```

Puts renders in ~/Videos/egx/*day/slates/

## Howto update text

Just edit the `render_*.sh` scripts, it's all in there - just check for quotes and bash special chars, etc (or rather, don't use 'em) ;-)

## The scripts

The `<key>="<val>"` pairs are for template variable substitution. See templates and scripts for examples.

Render a template to an Apple Animation Codec MOV file, which has transparency for use in Wirecast. Duration is seconds.

```
bin/qtrle_render_slide.sh -d <duration> templates/<template>.html <output>.mov [<key>="<val>" ...]
```

Render an MP4 which can be used when no transparecny required.
```
bin/render_slide_noalpha.sh -d <duration> templates/<template>.html <output>.mov [<key>="<val>" ...]
```





