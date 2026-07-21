---
layout: drawpile_post
title: "Dev Update: Week 26 and 27 of 2026"
date: 2026-07-20 00:00:00 +0100
category: "devblog"
tag: "@askmeaboutloom"
---

Things are still pretty busy, but the last two weeks had some bugfixes, a major performance improvement, video export additions and more work on project file playback.

If you want to help test the video export on Windows, you can do so with [the alpha release](https://github.com/drawpile/Drawpile/releases/tag/continuous){:target="_blank"}.

## Windows Video Export

Similar to Android, you can now export animations and timelapses using the encoder provided by the operating system. On most machines, you'll get access to the option "MP4 Video (H.264)" this way, which is a very fast and probably the most compatible video format. This format isn't provided with Drawpile because of licensing problems in some countries, but Microsoft has already dealt with those licenses when going through Windows.

It would be good if this could be tested on different devices and versions of Windows. I suspect that it won't work on Windows 7 because it doesn't have all the functionality needed, but I currently only have access to a Windows 11 installation on a Surface tablet. You can tell whether it's available if you see the "MP4 Video (H.264)" format in the animation or timelapse export dialog and under the advanced settings you should see "Windows - Media Foundation" under the encoder setting.

On Linux and macOS, you still need to install ffmpeg for this, but that's a way easier process there than having to manually download stuff like on Windows. On Linux, you might even already have it installed.

## Project Playback Progress

As talked about last time, I've been working on the playback dialog for dppr files. This has progressed by a bit, it is now possible to load and convert dprec files into dppr on the fly. The playback information is also loaded up. What's still missing is the actual playback.

I've also done some more thinking on how to actually implement the playback. Currently, the playback dialog directly interacts with the paint engine. This leads to the somewhat strange feature of being able to manipulate the canvas while it's playing back, e.g. moving layers around and then continuing playback. While this is kind of cute, it totally doesn't work with regards to skipping around in the recording or indexing it, since that only makes sense if the results are predictable. Worse, if you make changes and then skip to a different point in an indexed recording, your changes will be lost without even asking you.

I think the way it'll be solved instead is to play back the recordings separately and only send the actual canvas states to the paint engine. That keeps the two realms separate and allows indexing the playback along the way. If you make changes, the playback can tell you that they will be lost, since the drawing commands aren't intermingled anymore. I don't think this should cause performance issues from rapidly swapping canvas states out, the paint engine works like this under the hood anyway every time something about the canvas changes.

## Better Canvas Resizing

Non-aligned canvas resizing has been sped up and made to use much less memory. For some background on what that means: Drawpile's layers are split into 64 by 64 pixel tiles, blank tiles don't have any pixel data and so they basically use no memory. The top-left corner of the canvas is always at coordinate (0, 0). When you resize the canvas only right- and/or downwards or at a multiple of 64 pixels, Drawpile usually only has to move entire tiles around, which is pretty fast. However, if you expand the canvas left- and/or upwards at a different interval, Drawpile has to move individual pixels within the tiles around. Obviously there's thousands of times more pixels than there is tiles, so this is much slower.

The canvas resize function is one of the oldest ones in the entire paint engine and apparently the way I decided to solve it back then was to effectively copy and paste the contents of the layer to a different position. Which means it actually took a detour of converting the contents of the layers from 15 bit tiles to an 8 bit contiguous image, only to then convert it back to 15 bit tiles at a different position. Worse, the image is contiguous, which means blankness actually also go t copied and pasted, which is a waste of time because those blank tiles just get deleted again after the resize.

That has now been optimized, Drawpile now just copies the pixels directly instead. This is much faster and uses less memory. In one very pathological case, the resize went from taking 6 seconds down to 200 milliseconds, around 30 times faster, and from allocating over 50 GiB of additional memory to around 0.5 GiB, around 100 times less memory. More common cases probably don't have nearly this much improvement, but they should still do better.

This was reported by Bluestrings.

## Minor Additions and Bugfixes

File display names are now retrieved better on Android. This should solve some cases where you could end up with Drawpile showing your file name as just a number or something else ugly. It might also allow you to open recording files from directories where they previously didn't open from.

The brush editor now uses the proper ranges for the maximum and minimum input sliders. Previously it accidentally used the output ranges, which often lead to them getting clipped. This was reported by Pine [on Discord](https://drawpile.net/discord/){:target="_blank"}.
