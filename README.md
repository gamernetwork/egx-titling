# EGX Rezzed titling templates

Titling framework using HTML, GSAP, and WebVFX for MLT.

# Installation dev/test tools

```
sudo apt-get install libmlt-dev libmlt++-dev qt4-dev-tools
git clone git@github.com:mltframework/webvfx.git
```

Then build WebVFX using instructions in the README for WebVFX.

# Howto render lower thirds
 
```
./render_all_lt_next.sh
```

Puts renders in ~/Videos/egx/*day/lowerthirds/

# Howto render animated slates for playout

```
./render_all_slates.sh
```

Puts renders in ~/Videos/egx/*day/slates/

# Howto update text

Just edit the `render_*.sh` scripts, it's all in there - just check for quotes and bash special chars, etc (or rather, don't use 'em) ;-)
