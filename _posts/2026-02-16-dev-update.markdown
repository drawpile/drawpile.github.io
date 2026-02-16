---
layout: drawpile_post
title: "Dev Update: Week 6 and 7 of 2026"
date: 2026-02-16 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---

The last two weeks have been some work to support animations in timelapses, some other minor animation improvements, better scaling on Android and a rotation tool. You can test them [in the alpha release](https://github.com/drawpile/Drawpile/releases/tag/continuous){:target="_blank"}.

## Animation Timelapses

The new timelapse feature [described in the last dev update](/devblog/2026/02/02/dev-update.html#timelapses){:target="_blank"} now supports playing back animations. If Drawpile detects that there's an animation on the canvas, it shows a checkbox in the timelapse dialog to play the animation as the result, which is checked by default if you're currently in frame view. If the flipbook is using a different range or speed than the global timeline, you also get a checkbox whether you want to use that. By default the animation is played once at the start of the timelapse. You can change that in the advanced settings.

Note that to make use of this, you have to **enable autosaving and save your project as a dppr file!** To enable autosave on the current session, use File → Autosave. To enable it for new sessions by default, use the options Edit → Preferences → Files. Note that there's currently not yet any limits on these files, so you shouldn't enable it if you plan to idle in a public session for a long time.

Here's an example of this feature, thanks to BulletPepper for providing this.

<video controls loop>
  <source src="{{ "/assets/vid/2026-02-16_animationtimelapse.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Animation Playback Improvements

The flipbook now properly updates its frame range if it encompassed the entire timeline range and you change it while the dialog is closed. Previously it got stuck with its original range unless you kept the dialog open. Refreshing the flipbook also no longer resets the playback to the first frame of the range, it instead keeps playing from the current frame.

The previous "zoom" menu is now a more general menu with settings to reset the frame range and speed manually. There's also now an action that lets you set the flipbook speed by FPS, letting you enter the desired amount and then setting the speed to match that exactly based on the current canvas FPS.

There's now new actions in Animation → Next/Previous Frame Within Range, which let you move around the timeline while wrapping around within the frame range. The same also happens when you focus the timeline and hold Shift while pressing the arrow keys.

Most of these were reported and suggested by BulletPepper [on Discord](https://drawpile.net/discord/){:target="_blank"}.

## Android Scaling

The user interface scaling method has been reworked on Android to make it easier to pick a comfortable interface scale without having to restart Drawpile a bunch and potentially ending up with an unusable interface size. When you start Drawpile, it will prompt you with a dialog to pick a comfortable scale for the interface and whether you want to use the dynamic, desktop or mobile mode. Changes are previewed on the fly.

The second time you start Drawpile, you'll also get a checkbox whether you want Drawpile to ask you about the scale every time, which you can uncheck once you're sure you're happy with it. It isn't shown the first time to avoid users unchecking it before even using the program and potentially picking a scale that makes it unusable after all. You can bring the dialog back via View → Interface scale… or via Edit → Preferences → User Interface.

Some issues with font sizing were also fixed, some devices had a wonky relation between the default font size and the rest of the user interface scale. Existing scaling and font settings will be reset, since the new system works quite differently.

![Android scaling dialog with different interface sizes]({{ "assets/img/2026-02-16_androidscaling.webp" | relative_url }})

## Rotation Tool

Analogously to the pan and zoom tools, there's now a rotation tool. It lets you rotate the canvas without requiring some secondary action or poking at small interface elements, which can be useful especially if you only have one hand and no keyboard available.

The tool offers the same options as canvas shortcuts do: a regular rotation that snaps around 0°, a free rotation that doesn't snap and a ratchet rotation that rotates in 15° increments. The default shortcut for the tool is Shift+R.

This was suggested by Cryankiebuillars [on Discord](https://drawpile.net/discord/){:target="_blank"}.

<video controls>
  <source src="{{ "/assets/vid/2026-02-16_rotationtool.mp4" | relative_url }}" type="video/mp4"/>
</video>
