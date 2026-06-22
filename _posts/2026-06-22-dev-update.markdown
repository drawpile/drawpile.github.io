---
layout: drawpile_post
title: "Dev Update: Week 24 and 25 of 2026"
date: 2026-06-22 00:00:00 +0100
category: "devblog"
tag: "@askmeaboutloom"
---

The last two weeks saw some brush fixes, more animation features and a new fan filling mode for the formerly lasso fill tool.

All that's described here is available [in the alpha release](https://github.com/drawpile/Drawpile/releases/tag/continuous){:target="_blank"}.

## Animation Additions

There are two new actions in the animation timeline. One of them is decloning key frame layers. This will duplicate the layers of any key frames that have the same layer assigned. If you previously copied a key frame and it's now referring to the same layer as another one, this lets you break that reference and have them refer to different layers so that you can edit only one of them.

The other new action is pasting decloned layers. This has a similar effect, but when pasting key frames, it also duplicates the associated layers if necessary. It will not duplicate layers that aren't assigned to anything, so if you cut and paste key frames like this, you don't end up with pointless dupes. If you paste multiple key frames, it will retain any clones within that set of key frames and only duplicate them once.

On Android, you can now export videos using the operating system's video encoder capabilities. Depending on your device, fast hardware encoding is also available, although that's not used by default because some of them have weird constraints on resolutions or framerates and from my testing they're hardly any faster for it. Thanks to Bluestrings, hpar and marddle for testing this. This feature is also making its way into Krita, you can take a look at [the thread on testing it in their forum](https://krita-artists.org/t/testing-wanted-android-timelapse-export/185468){:target="_blank"}.

Also, the WEBM export on desktop now uses a proper quality setting. Previously it could often end up with some pretty hefty compression artifacts due to the maximum bitrate being set excessively low.

## Fan Filling

The lasso fill tool got renamed to shape fill tool because it now has two shapes: lasso and fan. The lasso option works like it did before, which is basically the same as the lasso selection does.

The new fan option will instead never make any holes in the shape, instead always filling from the starting point to where you are drawing. That kind of tool exists in some vector drawing programs, probably named after triangle fans that you see used in 3D graphics. This is also how it works under the hood in Drawpile, although usually the triangles are so close together that you don't see their edges.

This was suggested by lan700ng [on GitHub](https://github.com/drawpile/Drawpile/issues/1516){:target="_blank"} and some more information taken from VolutBrum [on the Krita forums](https://krita-artists.org/t/shapes-fill-brush-settings-to-fill-all-affected-area-like-fan-brush-in-heavypaint/184359){:target="_blank"}.

<video controls>
  <source src="{{ "/assets/vid/2026-06-22_shapefill.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Stroke Directionality

MyPaint brushes should now interpret the direction of a stroke at the beginning of it better. Previously they could sometimes punt to it being angled at zero degrees and then suddenly jump to the actual direction. This was reported by tiar.

On the other hand, MyPaint brushes that don't require a direction should now put down their first dab even if you just make a tap instead of requiring you to move a little bit. This was reported by dAVePAGE.

In the tablet preferences, you can also now toggle whether you want Drawpile to start a stroke immediately when you press down your stylus. This doesn't happen by default because the pressure value at the beginning of a stroke is often unreliable and jittery, so normally you don't get any input until you move a bit or lift your stylus. Depending on your hardware, turning this off may feel better though.

## Minor Additions and Bugfixes

Key frame properties are now properly saved to dppr files, previously it could error on saving. This was reported by marddle [on Discord](https://drawpile.net/discord/){:target="_blank"}.

On macOS, the preferences now call the Option key by its proper name, rather than calling it Alt. It's really the same key, they've just been historically called different names on PC and Mac. This was reported by Axocrat [on Discord](https://drawpile.net/discord/){:target="_blank"}.

You can now hit Enter on a numeric input twice to accept the enclosing dialog, rather than being trapped in a loop of editing and not being able to close the dialog unless you use your mouse or tab away to a different control. You can also press Shift+Enter to always close it and Ctrl+Enter to always enter edit mode. Not sure I like how this feels though, it may change again.

You can now configure the default save file name in the preferences. It lets you input placeholders for the current date and time, in case you want a different format or something. This was suggested by Bluestrings [on Discord](https://drawpile.net/discord/){:target="_blank"}.
