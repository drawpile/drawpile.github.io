---
layout: drawpile_post
title:  "Dev Update: Week 34 of 2023"
date: 2023-08-26 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---
Drawpile 2.2.0-beta.7 is to be released later today, so this update comes a day early.

There's mostly been bugfixes, but also some improvements to animation stuff again. There was also some fiddling with the website behind the scenes – if you didn't notice anything amiss, it worked as intended!

## Key Frame Exposure Controls

The timeline now lets you increase and decrease the exposure of a key frame. That is, it will lengthen or shorten the number of frames it is visible, shifting all subsequent frames to the right or left respectively. The shortcuts for these are <kbd>Ctrl+Shift+Plus</kbd> and <kbd>Ctrl+Shift+Minus</kbd>. The suggestion for this feature came from Tabuley.

<video controls>
  <source src="{{ "/assets/vid/2023-08-26_keyframeexposure.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Export Animations from the Flipbook

The Flipbook (the dialog you get when you press the play button on the timeline or hit <kbd>Ctrl+F</kbd>) now has an export option in the bottom-right corner. This will save the animation as you're currently viewing it, using the cropping, frame range and speed you have set. That should make it a lot less faff to save a single animation out of a larger canvas.

![Export option in the flipbook dialog]({{ "/assets/img/2023-08-26_flipbookexport.webp" | relative_url }})

## Adding Avatars During Login

It happened a lot that new users join a Drawpile session and notice that they're the only one without an avatar. Then they go through the dance of picking through the preferences, adding the avatar and reconnecting. That's a pretty annoying process.

So now you can add avatars while you're joining or hosting a session, hopefully cutting out that round-trip.

![Add avatar option during login]({{ "/assets/img/2023-08-26_addavatar.webp" | relative_url }})

## Minor Additions and Selected Bugfixes

The Flipbook now remembers the crop area, frame range and playback speed you set for the current window. It will no longer remember the crop area across program restarts, which just ended up applying the crop from one animation to another, making it seem like it's blank until you realize it's zoomed into some random corner.

The font size on emoji in chat has been increased so that you can actually make them out. The suggestion for this feature came from [leandro2222 on GitHub](https://github.com/drawpile/Drawpile/issues/1130#issuecomment-1685303686).

There's now shortcuts to swap the contents of the current brush slot with another. These can be used to set up slot toggling, since you can just hit the shortcut repeatedly to swap the slot contents back and forth. The suggestion for this feature came from xxxx [on Discord](https://discord.gg/M3yyMpC).

The "registered" permissions now work properly. Before, every user would get treated as registered. This was found by xxxx as well.

The installer for Drawpile now sets up the handling of `drawpile://` URLs properly on Windows. The path it put into the Registry was wrong previously, leading a confusing message about the program not being installed. This was found by Sal.

Reloading the brush preset (<kbd>Ctrl+P</kbd> by default) now resets the current slot to the preset you last put into it, rather than just blindly reloading the last clicked-on preset into the current slot. This also now works across program restarts, previously it forgot the last preset when you closed Drawpile.

Using the fill tool on a transparent area now only takes transparency into account, rather than acting as if you were filling a black area. This was found by Meru [on Discord](https://discord.gg/M3yyMpC).

Layer folders are now usable as fill sources, before they just wouldn't work.
