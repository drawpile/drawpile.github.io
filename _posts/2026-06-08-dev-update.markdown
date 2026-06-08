---
layout: drawpile_post
title: "Dev Update: Week 22 and 23 of 2026"
date: 2026-06-08 00:00:00 +0100
category: "devblog"
tag: "@askmeaboutloom"
---

The last two weeks were spent implementing frame multiselection, some usability features, Android stuff and some smaller fixes.

Everything here is available [in the alpha release](https://github.com/drawpile/Drawpile/releases/tag/continuous){:target="_blank"} right now.

## Frame Multiselection

You can now (finally) select multiple frames on the animation timeline. If you have a keyboard to do so, you can hold Shift or Ctrl to do so. If not, there is a new mode you can pick where dragging across the timeline will select and deselect the range.

Selecting multiple frames lets you move those around, copy, paste, delete, assign a color to them etc. The exposure mode that lets you adjust the space between key frames still exists, since it's convenient in many other cases.

The previous behavior of holding Shift and pressing the arrow keys to move around on the timeline while staying within the timeline range has been moved to Ctrl, since Shift is taken by selecting stuff.

<video controls>
  <source src="{{ "/assets/vid/2026-06-08_framemultiselect.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Right-Click Drawing Configuration

Since defaulting it to drawing with the background color has shown itself to be annoying for some people, there's now options what should happen when right-clicking with the freehand and eraser tools: doing nothing, drawing with the background color or erasing. The default is to do nothing, as it did it 2.3.0 and earlier. You can configure this through the tool preferences or via the hamburger menu in the brush tool settings.

If you assign a canvas shortcut to the right-click, such as color picking, that will take precedence over right-click drawing, as it did before.

This was suggested by noelle and walnut [on Discord](https://drawpile.net/discord/){:target="_blank"}.

![Right-click drawing settings]({{ "assets/img/2026-06-08_rightclickdrawing.webp" | relative_url }})

## Layer Selection Shortcuts

You can now assign keyboard shortcuts to selecting layers by their color marker. Pressing the shortcut will select the next layer marked with that color, spinning through them if you have multiple.

Relatedly, the select above/below actions in the layer menu are now called select *layer* above/below in the shortcuts dialog so that you have a chance of finding them.

This was suggested by anonymous [on IRC](https://drawpile.net/irc/){:target="_blank"}.

<video controls>
  <source src="{{ "/assets/vid/2026-06-09_layercolorselect.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Minor Additions and Bugfixes

Exporting an animation now lets you pick a fractional scaling value, in case you need to hit a specific resolution.

Repeatedly moving a transform should no longer sometimes scale it by one pixel. This was reported by Hermanni [on Discord](https://drawpile.net/discord/){:target="_blank"}.

Android now properly supports stylus barrel rotation, at least on Wacom Artist styluses. Previously it would transmit the tilt orientation as the barrel rotation, which was incorrect. This was reported and tested by kwh0209 [on the krita-artists forum](https://krita-artists.org/t/barrel-rotations-seems-doesnt-work-in-android-system/184547){:target="_blank"} and has also gone into Krita.

If Drawpile on Android is terminated due to resource exhaustion, it will now tell you that this happened when you next start it. This lets you tell apart running out of memory from a crash, since annoyingly they look pretty much the same on Android with the application simply poofing out of existence in front of you.

There's a new workaround in the tablet preferences to prevent full-pressure blotches on Ugee tablets on Android. They have an extremely weak pressure response, but will randomly transmit a single event at 100% pressure. This option will filter those out. It is enabled by default on Android and the browser, which shouldn't cause interference, since normal devices don't jump from a really low pressure to a really high one so abruptly. This was reported by London [on Discord](https://drawpile.net/discord/){:target="_blank"}.
