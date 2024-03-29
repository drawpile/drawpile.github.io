---
layout: drawpile_post
title: "Dev Update: Weeks 12 and 13 of 2024"
date: 2024-03-29 00:00:00 +0100
category: "devblog"
tag: "@askmeaboutloom"
---

The last two weeks have mostly been work on getting the OpenGL canvas ready, which is now generally available. As usual, the stuff here is available [in the continuous development release](https://github.com/drawpile/Drawpile/releases/tag/continuous).

## OpenGL Canvas

The OpenGL canvas is now ready for use. It's enabled by default in the web browser version of Drawpile, due to how huge the performance difference is, as illustrated in the video below.

<video controls>
  <source src="{{ "/assets/vid/2024-03-29_glcanvas.mp4" | relative_url }}" type="video/mp4"/>
</video>

It also has some other improvements: the transparency checkerboard is now a real background instead of moving along with the canvas, the brush outline has more contrast and the pixel grid adapts its color instead of it being a fixed gray. The navigator should also be a bit faster when you're using the OpenGL canvas. Pixel jitter when the canvas isn't moving should also not be a thing with it.

On other platforms, you can enable it in the Preferences, under the General tab in the Renderer setting. Restart Drawpile after changing it.

It's currently marked as experimental, since it needs testing on different platforms. It will become the default eventually, once it's known to be stable.

![OpenGL canvas in preferences]({{ "/assets/img/2024-03-29_glcanvastoggle.webp" | relative_url }})

This should not add any additional hardware or software requirements to Drawpile, since Qt should already have been useing OpenGL under the hood, it just didn't use it to render the canvas. On Windows, ANGLE is used instead of straight OpenGL by default. It uses Direct3D to emulate OpenGL and comes with a bunch of bug workarounds so that it works even in the face of terrible graphics drivers. You can override that by passing `--opengl desktop` to Drawpile, but the performance difference is probably minuscule.

## System Information Dialog

You can now get a whole slew of information about how Drawpile sees your system via Tools → Developer Tools → System Information. It shows a slew of information about Drawpile itself, your operating system, OpenGL properties, tablet preferences and the arrangement of your screens.

The text can be copied and thrown at a developer or someone else trying to help with diagnosing issues, which should cut down on the necessary questioning. Additional information may be added here in the future if we find stuff that could be useful.

## Windows Pastery

Pasting images with transparency into other programs now no longer causes the transparent area to go black. This is really a bug in those other programs, for some reason they prefer images without transparency if they find the format to be available on the clipboard. So the fix was for Drawpile to just not offer that format anymore.

According to Qt's documentation on the issue, that in turn means that pasting into Word and other Office suite programs doesn't work anymore, since they in turn refuse to cooperate if the format without transparency is not available. But that's not really important for Drawpile, so it's probably fine.

This was reported by lungy [on Discord](https://drawpile.net/discord/){:target="_blank"}.

## Minor Additions and Bugfixes

Vertical sync can now be configured in the preferences. Turning it on may cause input lag. Turning it off may cause screen tearing. The default is for it to be off.

The colors for the transparency checkerboard can now be adjusted in the preferences. Suggested by lungy [on Discord](https://drawpile.net/discord/){:target="_blank"}.

PNGs with corrupted checksums can now be opened again. Reported by xxxx directly.
