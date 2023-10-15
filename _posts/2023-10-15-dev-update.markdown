---
layout: drawpile_post
title:  "Dev Update: Week 40 and 41 of 2023"
date: 2023-10-15 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---

I didn't have too much actually finished last weekend, but now this post covers the last two weeks of what's going on. Most of it has been rummaging around in the server backend, but there's been a few interesting client-side changes.

As usual, everything you see here is available [in the development release](https://github.com/drawpile/Drawpile/releases/tag/continuous) right now.

## PSD File Support

Drawpile can now read and write Photoshop document (PSD) files, since a lot of closed source software uses it as an interchange format of sorts. PSD is poorly specified, so compatibility with other programs is probably all over the place. Your mileage will certainly vary.

This was suggested by pachuco [on GitHub](https://github.com/drawpile/Drawpile/issues/260), onyx [on Discord](https://discord.gg/M3yyMpC), Geese to me directly and probably others over time.

## Jaggy Line Compensation

With some devices, especially on Android and with some bad tablets on Windows, fast strokes may end up looking jaggy. With some of them, it only happens when the computer is under higher load, like when screen sharing or something, with others it always happens.

Drawpile now compensates for that. If the points in a stroke are too far apart, they will be smoothed into a curve.

This is enabled by default, but can be disabled under *Edit → Preferences → Input → Compensate jagged curves* if you like the feel without it better.

<video controls>
  <source src="{{ "/assets/vid/2023-10-15_interpolate.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Brush Preset Thumbnail Textery

The brush preset dialog now lets you put a text label on your thumbnail. This will simply be painted onto the image itself, letting you distinguish your custom brushes without having to go through the effort of fiddling together a whole custom image for something you may just be testing out.

This was sort of suggested by Paris Green [on Discord](https://discord.gg/M3yyMpC).

![Brush being labelled "smol brush"]({{ "/assets/img/2023-10-15_brushlabel.webp" | relative_url }})

## Ban Rework

There's some ongoing work to make server bans less confusing and error-prone. Currently, moderators have to manually input a lot of information into every server, so it's easy to get something wrong. And if you're falsely banned because of one of these accidents, you just get the message "BANNED", which can be very confusing.

To help with that, a shared ban system is being worked on. It will let moderators put their bans in one place, which will automatically be applied to all [community servers](https://drawpile.net/communities/). This should reduce the number of mistakes and inconsistencies. The bans are *only* shared between the servers listed behind that link, other servers won't have access to it.

The server will also actually say something more sensible when you're banned. Instead of just giving a generic "BANNED" message, it will provide a reason, an expiry date and a link to more information about the bans. This way, if you're caught up by mistake, you'll actually be able to tell that fact and get in contact with a moderator to get that rectified. In that regard it'll also be possible to exempt users from bans, so if you're in a region that had to be banned for spam or whatever, you can get a special privilege on your account to punch through it regardless.

This stuff is working, but not rolled out yet at this point. It will probably be gradually coming to [the community servers](https://drawpile.net/communities/). You should hopefully not notice any difference, unless you were caught by one of these wrong bans that may be rectified in the process.

## LCH Color Wheel Correction

The LCH (or HCL or HCY) color wheel now uses more sensible colors for the outside ring. Instead of super bright and discontinuous hues, it now uses something more akin to what Krita and MyPaint do.

You can change your color picker in *Edit > Preferences > Tools*.

![LCH color picker with a proper hue wheel]({{ "/assets/img/2023-10-15_lchpicker.webp" | relative_url }})

## Minor Additions and Selected Bugfixes

Indirect mode is now allowed in 2.1 sessions again as long as you don't use pressure opacity with it, since that works the same in 2.2 and doesn't cause desync. Reported by Blozzom [on Discord](https://discord.gg/M3yyMpC).

Correct a rounding error when displaying pixels. The error was so tiny that it wasn't perceptible, but it caused the color picker to drift slightly. Reported by deovise and hipofiz.

Fix a crash when joining a session using the builtin server (the "host on this computer" option.) This was reported by Kink to me directly.

Properly stop the bound action when releasing modifier keys of a keyboard-only canvas shortcut. Reported by Daystream [on Discord](https://discord.gg/M3yyMpC).

Make IPv6 addresses work in invite links, because they need a special mess to make them work in URLs.
