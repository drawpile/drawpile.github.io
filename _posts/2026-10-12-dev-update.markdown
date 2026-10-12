---
layout: drawpile_post
title: "Dev Update: Week 39 to 41 of 2026"
date: 2026-10-12 00:00:00 +0100
category: "devblog"
tag: "@askmeaboutloom"
---

The last few weeks had mostly testing and bugfixes going into 2.3.1, which is now effectively ready for release.

You can already use it through [the alpha release](https://github.com/drawpile/Drawpile/releases/tag/continuous){:target="_blank"}, not much more is going to change.

## Liquify

Progress on the liquify tool that will be added after 2.3.1 is released has been progressing. I ended up not using Krita's implementation of it after all, since its solution of using a grid is pretty inaccurate and tricky to optimize.

The new implementation uses a displacement map instead, where each pixel can be shifted. This parallelizes much more easily, since it's just a map of pixels. It can also be optimized better, since affected areas can be narrowed down better when everything is uniform like this.

I'd expect to release an alpha version of this right after 2.3.1 comes out basically.

## Nicer Zoom Tool

The zoom tool got a bit of attention to make it work a bit more nicely. It's also consistent with the pan and rotation tools now.

It can now zoom by dragging (or "scrubbing"), which by default it now does with left click. The rectangle selection behavior is on the right click. You can swap this by changing the setting. Holding the constraint key (Shift by default) also swaps them. Holding the center key (Alt by default) lets you scrub horizontally.

Left and right click continues to zoom in and out. Holding the constraint key swaps those again. Drawing a rectangle will now always zoom to the rectangle, rather than the previous behavior where you could zoom out into a rectangle, which didn't really make sense.

And it now has buttons at the top, rather than the two big ones in the middle. They let you zoom in, zoom out, reset the zoom and fit the canvas to the view.

This was suggested by Shuko.

## Minor Additions and Bugfixes

Selecting multiple key frames now also selects their associated layers. Switching tracks when a key frame was already visible previously now properly selects the new key frame.

The flipbook now no longer gets stuck when switching between a reversed range and a regular range. This was because it skipped one frame in the middle and would then wait eternally for it to never render (well, until you refreshed.)

The opacity of a parent layer group is now visible in the rendered animation as well, rather than only on the canvas.

The "Normal View" button is now gone from the timeline header, since the "Frame View" button on its own already serves as a toggle. This makes it need less horizontal space.

Server owners can now allow new sessions to clobber empty, non-persistent, lingering sessions. This lets you prevent "server is full" errors caused by somebody testing out Drawpile and hosting a bunch of sessions that are still waiting to time out or something. This was suggested by Bluestrings [on Discord](https://drawpile.net/discord/){:target="_blank"}.

Hitting save after joining a session in the same window no longer saves over your previous file. This was reported by Bonbli and D'mitri [on Discord](https://drawpile.net/discord/){:target="_blank"}.

Drawpile will reset the default save format to dppr once, even if you previously picked a different one. This is to prevent losing timelapse data for people who previously chose to use the dpcs format. This was reported by Sheepolution [on Discord](https://drawpile.net/discord/){:target="_blank"}.

On Android, pressing the back button while a dock or chat is open in the mobile view will close it instead of quitting the application. This was suggested by anonymous on IRC.

When playing back recordings, the first command is no longer skipped over. This was basically only noticeable on old converted recordings, where it skipped the canvas sizing command, causing the canvas to remain at zero size. This was reported by dango [on Discord](https://drawpile.net/discord/){:target="_blank"}.

The start screen now takes a bit less horizontal space to make it fit better on narrow screens. This was reported by anonymous on IRC.

Unchecking the show conflicts box on Windows while editing a shortcut no longer causes a crash. This was reported by yellow circle [on Discord](https://drawpile.net/discord/){:target="_blank"}.
