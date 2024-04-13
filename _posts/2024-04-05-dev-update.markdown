---
layout: drawpile_post
title: "Dev Update: Week 14 of 2024"
date: 2024-04-05 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---

This week has been a bit more work on the OpenGL canvas renderer, adding a software renderer for folks that the hardware one doesn't work for and some smaller features in the fill tool, the user pointers and layer creation.

It's all available [in the continuous development release](https://github.com/drawpile/Drawpile/releases/tag/continuous).

## Canvas Renderer Stuff

The OpenGL canvas renderer has been fiddled with a bit further. It should now have less wobbly pixels when moving the canvas around and the pixel grid should now work on more GPUs.

There's also now a "Software" option for the canvas renderer settings. Performance should be similar to the Qt Graphics View option, which is set to go away eventually. It's useful on devices where the hardware renderer causes input delays or visual artifacts.

The "OpenGL" option in the preferences has also been renamed to "Hardware", since that's more accurate to reality in most cases. For example, on Windows it actually uses Direct3D under the hood instead of OpenGL directly.

## More Filling

The fill tool now lets you toggle between the normal, continuous fill mode and filling all similar colors regardless of them being continuous or not. This is useful for e.g. recoloring pixel art or outlining text.

This was suggested by Ben directly.

<video controls>
  <source src="{{ "/assets/vid/2024-04-05_fillcontinuous.mp4" | relative_url }}" type="video/mp4"/>
</video>

## User Pointer Evasion

User pointers, those black speech bubbles that show where someone else is drawing or pointing with the laser pointer, now disappear by default when your cursor gets close, to avoid them covering up the spot where you're drawing. It can be toggled via View → User Pointers → Hide From Cursor. This was suggested by Crowley [on Discord](https://drawpile.net/discord/){:target="_blank"}.

Also, under View → User Pointers → Stay Time, you can now pick how long they are supposed to stick around. The default is still 1 second like it was before, but you can turn it up to 10 seconds, a minute, an hour or even letting them stick around forever. This was suggested by johannesCmayer [on GitHub](https://github.com/drawpile/Drawpile/issues/1194){:target="_blank"}.

<video controls>
  <source src="{{ "/assets/vid/2024-04-05_usermarkerevasion.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Layer Creation Bits

When you create a layer while drawing online, it now names it after your username plus a number, rather than whatever "Layer" or "Group" are translated as in the language that you have Drawpile set to. If you're drawing offline, it continues using those names.

In the User Interface preferences, you can also now enable "Prompt when creating layers" for Drawpile to ask you for a title, blend mode etc. when you create a layer or layer group, like it works in e.g. GIMP. This was suggested by Ben directly.

![Prompt when creating layers setting]({{ "/assets/img/2024-04-05_layercreate.webp" | relative_url }})

## Minor Additions and Bugfixes

You can now turn off the on-canvas HUD messages when you zoom, rotate, mirror or flip the canvas in the user interface preferences (see screenshot above.) This was suggested by Parthack [on Discord](https://drawpile.net/discord/){:target="_blank"}.

Rotating the canvas by a single step (default shortcut Ctrl+Period and Ctrl+Comma) now works properly when the canvas is mirrored or flipped. This was reported by Ragged [on IRC](https://drawpile.net/irc/){:target="_blank"}.

Selections that are only moved, rotated by a multiple of 90 degrees, flipped or mirrored don't get blurred by bilinear interpolation anymore. Reported by lungy [on Discord](https://drawpile.net/discord/){:target="_blank"}.
