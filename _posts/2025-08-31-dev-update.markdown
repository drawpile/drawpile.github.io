---
layout: drawpile_post
title: "Dev Update: Week 34 and 35 of 2025"
date: 2025-08-31 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---

The last two weeks have been spent on several bugfixes, necessary upgrades to the Android version of Drawpile to keep it installable on newer devices and getting the anti-overflow feature usable. It's all available [in the alpha release](https://github.com/drawpile/Drawpile/releases/tag/continuous){:target="_blank"}, especially on Android it would be appreciated to have some testing to tell if the upgrades broke anything on any devices or OS versions.

## Android Upgrades

Drawpile has been updated to target Android 15. This shouldn't have any effect on older devices, things should continue to work as they did before. It's just required for newer devices, otherwise Google will block the installation there in November. Thanks in this regard goes to Dmitry Kazakov, who did this on Krita and Drawpile's changes are based on that.

With that, I also switched over to Krita's version of Qt. It has a bunch of additional fixes and a few features on top of what the regular Qt brings, so this should improve performance and compatibility. It also fixes the issue of drop-downs and some dialogs not properly reacting to stylus input.

I've also started working on keeping you connected when you put Drawpile into the background or turn off the screen, but it looks like this is going to need some larger-scale rearchitecting to move the entire networking stuff to an Android service.

## Anti-Overflow

You can now toggle "anti-overflow" mode in the freehand settings and the brush settings editor. This will replace most of the freehand settings with a tolerance and expand slider, as well as giving you a button to set the fill source layer.

When enabling this mode, brush strokes will stay inside of the lines of your fill source layer. The way this works under the hood is that Drawpile does a flood fill from the center of the brush and builds an invisible selection from it, which is then synchronized to other users and used to mask the brush strokes.

This was suggested by Ausjamcian and Null, the idea for the user interface comes from Axocrat [on Discord](https://drawpile.net/discord/){:target="_blank"}.

<video controls>
  <source src="{{ "/assets/vid/2025-08-31_antioverflow.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Self-Censorship

You can now "block" layers via the Layer menu at the top, through the layer properties or by right-clicking on the layer. This effectively censors the layer for yourself, replacing the content of the layer with striped tiles.

Of course you could also just hide the layer instead, but then you run the risk of accidentally drawing over other people's stuff. Blocking the layer still lets you tell where things are already drawn, but not having to see it.

<video controls>
  <source src="{{ "/assets/vid/2025-08-31_blocklayer.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Minor Additions and Bugfixes

The software renderers now properly support canvases larger than 32767 in a single direction. This worked on some operating systems and on the hardware renderer already, but on others the area beyond those points turned blank or black instead. This was reported by Ben.

ORA files with dimensions beyond 32767 now open properly, rather than saying their dimensions are invalid. This was just due to an extraneous check left over from before the limit was increased. This was reported by Nimono.

The `/roll` message now has its own protocol flag, making the message translatable to other languages and visually differentiating it from `/me` messages to make cheating a little less easy. Of course older clients don't set this flag, so it's not yet an indicator of foul play.

Layer clipping now disregards pass-through groups, like it does in other programs.

The zoom tool now makes more of an attempt to detect whether you're just clicking or making a rectangle to zoom into. This was reported by Scruff.

Changing the brush size using the mouse wheel now behaves predictably, rather than seemingly randomly skipping some low values. It wasn't actually random, there was a logic to it, that logic just didn't feel good. This was reported by Meiren [on Discord](https://drawpile.net/discord/){:target="_blank"}.

The freehand brush icon in the drawing tools toolbar now shows up properly when you start the program with the eraser tool selected. This was also reported by Meiren [on Discord](https://drawpile.net/discord/){:target="_blank"}.
