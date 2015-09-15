# EGX Rezzed titling templates

Titling framework using HTML, GSAP, and WebVFX for MLT.

## Installation dev/test tools

```
sudo apt-get install libmlt-dev libmlt++-dev qt4-dev-tools
git clone git@github.com:mltframework/webvfx.git
```

Then build WebVFX using instructions in the README for WebVFX.

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





