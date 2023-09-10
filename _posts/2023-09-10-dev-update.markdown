---
layout: drawpile_post
title:  "Dev Update: Week 36 of 2023"
date: 2023-09-10 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---

I didn't expect to get much done this week, since I was away for most of it, but that was very wrong. There's been quite a lot of changes – most significantly, Drawpile now works on phones!

This is entirely Verdrusk's fault, who has a phone with a drawing pen. They are also to thank for showing me around how things could work on such a device.

## Small-Screen Mode

Drawpile now has a user interface mode that works better on small screens. It hides all docks by default and gives access to them through on-canvas buttons instead. It's still somewhat experimental, so bugs and weirdness are likely, but it works and should be usable.

This mode can be enabled under *Edit → Preferences → User Interface*. On Android, it's enabled automatically if the device screen has a low resolution (in pixels) or is physically small (in millimeters/inches.)

<video controls style="height:720px;">
  <source src="{{ "/assets/vid/2023-09-10_smallscreenmode.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Font Size Override

You can now change the font size of Drawpile under *Edit → Preferences → User Interface*. You can turn it down if your screen resolution is very low or up if it's very high, making the application work a bit better. This doesn't solve all scaling issues, but should still help.

On Android, the font size is overridden by default, since the system font size is usually some ginormous value that makes every window spill over.

![Drawpile with 9pt, 7pt and 16pt fonts]({{ "/assets/img/2023-09-10_fontsize.webp" | relative_url }})

## Kinetic Scrolling

Drawpile now lets you scroll many controls by clicking/tapping and dragging. It's how scrolling works on a phone, but it's also nice when using a tablet, since you don't need to pick at the scroll bar or reach for the mouse to spin its wheel.

Kinetic scrolling can be enabled under *Edit → Preferences → User Interface*. On Android, it's enabled automatically, on other platforms you have to explicitly turn it on.

<video controls>
  <source src="{{ "/assets/vid/2023-09-10_kineticscrolling.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Android Volume Rockers

Drawpile now captures the volume rockers on Android. By default, Volume Up is Undo and Volume Down is Redo.

You can change these bindings under *Edit → Preferences → Shortcuts*. If you don't want Drawpile to capture your volume keys at all, you can turn that off under *Edit → Preferences → General*.

This suggestion came from cl, relayed directly.

## Minor Additions and Selected Bugfixes

The opacity of layer groups now applies to animation frames within them. So if you stick all of your sketch frame layers into the same folder, you can turn down the opacity of it and draw over them. This was suggested by TeaLord9000 [on Discord](https://discord.gg/M3yyMpC).

I *finally* found and fixed the bug where selections would disappear when transforming them. It was hard to catch because restarting Drawpile usually made it go away.

Selecting brushes no longer crash on Android in some configurations. This was reported in different flavors on GitHub by [zetalambo](https://github.com/drawpile/Drawpile/issues/1108) and [VeeBeeArt](https://github.com/drawpile/Drawpile/issues/1140).

Two-finger zoom and rotation no longer goes all crazy when the canvas is mirrored or flipped. This was repoted by BoyOnion [on Discord](https://discord.gg/M3yyMpC).

Compatibility mode for Drawpile 2.1 sessions now handles indirect mode brushes, reducing the amount of desync you have to deal with in those sessions. I previously thought it was too tricky to make this work, since the painting is very deep inside the core of Drawpile and it doesn't know anything about the session you're connected to, but I found a good place to stick that extra bit of information now.
