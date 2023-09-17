---
layout: drawpile_post
title:  "Dev Update: Week 37 of 2023"
date: 2023-09-17 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---

This week was mostly spent working on the command-line tools. One tool has returned from Drawpile 2.1 and another new one has been added.

## drawpile-cmd

The drawpile-cmd command-line tool is back. It should work mostly like it did in Drawpile 2.1, rendering out images from recordings.

Unlike in Drawpile 2.1, it no longer requires the Drawpile client, so it should be a bit easier to use on a GUI-less server. It also supports being fed multiple recordings, rather than having to do so one-by-one.

## drawpile-timelapse

There's a new command-line tool called drawpile-timelapse. As the name implies, it produces timelapse videos from drawpile recordings.

Run `drawpile-timelapse --help` to see how to use it, it has a bunch of different options. You need `ffmpeg`, which is used to actually produce the videos.

Here's a short example of such a timelapse video.

<video controls>
  <source src="{{ "/assets/vid/2023-09-17_timelapse.mp4" | relative_url }}" type="video/mp4"/>
</video>

## More Layers for Operators

Operators can now create more than 256 layers, which is useful for doing animations. They were always allowed to create more layers, the client just didn't support doing it.

After they run out of their own 256 layers, they will start creating layers owned by the server, before spilling into layers owned by user 255, 254, 253 etc. Since most sessions don't have hundreds of users, this shouldn't cause issues in practice.

When you're drawing offline, you count as an operator, so you can also use more layers there.

This was suggested by [haxekhaex2 on GitHub](https://github.com/drawpile/Drawpile/issues/1148).

## Minor Additions and Selected Bugfixes

You can now change the color behind the canvas from the default gray to something else. The setting for this is under Edit → Preferences → User Interface → Color behind canvas. This was suggested by Nightshade [on Discord](https://discord.gg/M3yyMpC).

Drawpile 2.1 recordings now play back properly, even if they don't have proper permissions inside.
