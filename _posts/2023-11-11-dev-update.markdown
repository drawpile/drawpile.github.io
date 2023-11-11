---
layout: drawpile_post
title:  "Dev Update: Week 45 of 2023"
date: 2023-11-11 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---

Drawpile 2.2 beta 9 has been released today! You can read more about it [in the news post](https://drawpile.net/news/release-2.2b9/).

Onto the changes from this week.

## Brush Sharing

While it's not (yet) a fully-featured brush sharing system like I'd like to have, you can now take another user's brush settings directly. The option is found by clicking on the three dots next to their entry in the user list next to the chat or right-click on them. This will set your current brush settings to be the same as the brush they are currently using.

If you want to save these settings, you'll have to create a new preset from them, so just trying out someone's brush doesn't clutter your presets. This also only works if the other person has updated Drawpile. If not, nothing will happen. This feature was caused by Annoy and their cool brush everyone else wanted to try.

![Taking a brush from another user]({{ "/assets/img/2023-11-11_takebrush.webp" | relative_url }})

## Recolor Mode Optimization

The Recolor blend mode, which is used to alpha-lock brushes, has been sped up. It now operates directly on the premultiplied pixels and uses vector processing if possible.

This makes it *way* faster overall. In the video below, you can see how it used to lag behind massively, but now it paints instantaneously.

Some other blend modes may also have gotten very slightly faster because the formulas have been cleaned up slightly, but I don't think it's nearly as noticeable.

<video controls>
  <source src="{{ "/assets/vid/2023-11-11_recolorspeed.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Making Touch Pads Work Again

For some reason that I'm still not toally sure about, laptop touch pads that support pinching and twisting to zoom and rotate stopped working in Drawpile 2.2. I *think* they should work again now, although not totally sure if it covers every device.

There's now a setting under Edit → Preferences → Input → Touch mode that lets you switch between touchscreen, the default on Android, and gestures, the default everywhere else. Gestures should work for both touch pads and screens, but depending on your device, one or the other may work better.a

This was reported by Charmandrigo [on GitHub](https://github.com/drawpile/Drawpile/issues/1092) and Drippeydroplet [on Discord](https://discord.gg/M3yyMpC).

![Gesture touch mode setting]({{ "/assets/img/2023-11-11_gesture.webp" | relative_url }})

## Touch Tester

…and if touch stuff isn't working at all for you, there's now a touch tester under Help → Touch Tester. Here you can touch around in the area on the left to generate a log, which will help figure out what's going on.

To see where you can report this, take a look at [the help page](https://drawpile.net/help/).

![Touch tester]({{ "/assets/img/2023-11-11_touchtester.webp" | relative_url }})

## Classic Brush Dynamics

In addition to pressure, velocity and distance dynamics are back for classic brushes. They are a bit more capable than they were in Drawpile 2.1 in that you can assign different dynamics to size, opacity, hardness and smudging. They are particularly useful if you don't have a pressure-sensitive pen, since you can use the speed or length of your strokes to control the line thickness or opacity.

MyPaint brushes offer even more flexible dynamics in that regard, but they're quite a bit harder to configure.

![Classic brush dynamics]({{ "/assets/img/2023-11-11_dynamics.webp" | relative_url }})

## Server Bits

The server will now tell you if a session you want to join through a direct link isn't actually running. Previously, it would just leave you sitting at the list of running sessions with no indication that the session you're looking for isn't there. Suggested by Meru [on Discord](https://discord.gg/M3yyMpC).

Server owners can also now configure that their server only allows joining sessions through a direct link. This requires clients to have an up to date Drawpile version, otherwise the server will tell them to go update. Also suggested by Meru.

Lastly, server owners can now configure a minimum protocol version that they want to allow on their server, in case they don't want to keep around old Drawpile versions to moderate those sessions.

<div class="notification">
    <span class="fa fa-circle-info"></span> This is only available if the server is updated. At the time of writing, most servers aren't yet.
</div>

## Minor Additions and Selected Bugfixes

Invite links should now include the password properly on all browsers.

Selection transforms no longer cancel themselves just because they're ever so slightly larger than the canvas. You could always work around this by cutting and pasting what you wanted to transform, but now it just works without this extra step.
