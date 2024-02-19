---
layout: drawpile_post
title:  "Dev Update: Week 4 of 2024"
date: 2024-01-28 00:00:00 +0100
category: "devblog"
tag: "@askmeaboutloom"
---

This week has been bugfixing and a bunch minor features that didn't quite make it into 2.2.0.

These changes are available right now [in the continuous release](https://github.com/drawpile/Drawpile/releases/tag/continuous){:target="_blank"}.

## Experimental High-DPI Scaling

Drawpile now supports enabling scaling for high-DPI displays, such as 4K screens or retina displays. It can be turned on in Edit → Preferences, in the User Interface tab.

If Drawpile's interface appears too tiny for you, this may be worth trying out. On Android, make sure to also disable overriding the font size, as shown in the screen shot below, otherwise your text will remain tiny.

This feature is still experimental. Currently, there's some known issues on Windows with the KisTablet drivers (View → Tablet Driver) not working properly. If you find anything else, report it! You can find out where [on the help page](https://drawpile.net/help/){:target="_blank"}.

![Experimental scaling preferences]({{ "/assets/img/2024-01-28_scaling.webp" | relative_url }})

## Eraser Actions

You can now make Drawpile react to the eraser on your pen by switching the current brush to erase mode, rather than toggling to the eraser slot. You can pick this option under Edit → Preferences, in the Input tab.

In the browser, switching the current brush to erase mode is the only option available. The browser only reports that you are using the eraser while you're actually pressing it down, but not when it's brought into proximity, so this is the only sane way to handle it.

![Eraser actions preferences]({{ "/assets/img/2024-01-28_eraser.webp" | relative_url }})

## Web Browser Client Work

There's been a bunch of fixes done on the web browser client.

On Windows, the handwriting panel should no longer show up when you tap the application with your pen. I think this also fixes the phantom text cursor in the corner on iPad, but that's yet unconfirmed.

Safari interpreting touching the screen or moving the pen as gestures that zoom, refresh the page or go back a page may be fixed, but this is also yet unconfirmed.

Touch interactions should no longer break after a while of using them while drawing.

The eraser tip on a pen is now detected properly.

Event recording now lets you save the resulting files, allowing diagnosing of tablet and touch issues that way. Performance profiles also work, but the browser's timer accuracy is so bad that they are of limited usefulness.

## Minor Additions and Selected Bugfixes

You can now jump to the next and previous keyframe in the timeline using the "Next Key Frame" (Ctrl+Alt+Shift+L) and "Previous Key Frame" (Ctrl+Alt+Shift+H) actions. Suggested by BulletPepper [on Discord](https://drawpile.net/discord/){:target="_blank"}.

User cursors now follow MyPaint brush strokes better. If the brush has no jitter, it will snap to the position directly. If there's spread, it should still be much closer than it was before. Reported by Blozzom [on GitHub](https://github.com/drawpile/Drawpile/issues/1178){:target="_blank"}.

Latency (also known as "ping" or "lag") is now shown in the status message in the bottom-left corner, along with the session size and cursor coordinates. Suggested by Meiren [on Discord](https://drawpile.net/discord/){:target="_blank"}.

When making the brush settings as narrow as possible, they will now stay this way when switching between different brush types, rather than expanding itself. Reported by Meiren [on Discord](https://drawpile.net/discord/){:target="_blank"}.

Censored layers are now saved properly into PSD files. Reported by Blozzom [on GitHub](https://github.com/drawpile/Drawpile/issues/1178){:target="_blank"}

The brush and fill tool outline now rotates when you rotate your canvas, so the square shape actually stays at the correct angle. Reported by Bluestrings directly and some issues resolved with the help of xxxx.

When making a selection or doing some other action that updates the canvas locally, the last visible user cursors will no longer flash up.

MyPaint brush dab counts per radius are now capped at a combined value of 20, rather than having some ludicrously high cap that just makes things chug. Reported by Blozzom on [on Discord](https://drawpile.net/discord/){:target="_blank"}.

Picking a color from the screen is now available in the Edit menu, rather than having to switch to the color picker for it. The default shortcut is Shift+I. Suggested by Meru [on Discord](https://drawpile.net/discord/){:target="_blank"}.
