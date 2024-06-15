---
layout: drawpile_post
title: "Dev Update: Week 23 and 24 of 2024"
date: 2024-06-15 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---

The last two weeks had some selection- and animation-related work. There will likely be a "beta" release for 2.2.2 somewhat soon, since the selection changes could use some testing.

If you can't wait, everything here is already available [in the continuous development release](https://github.com/drawpile/Drawpile/releases/tag/continuous){:target="_blank"}.

Note that if you previously installed this release on Windows, you may have ended up with two (or more) installations of Drawpile, since the installer was broken by updates on GitHub. To be sure, check in the Add or Remove Programs control panel and uninstall any Drawpile entries you see there, then install it fresh. This won't delete any of your settings, those are separate from the program installation.

## Fill Confirm

The fill tool will now show you a local preview of your fill and ask you for confirmation to apply it. You can left-click, hit enter or switch tools to apply it. Undo, right-click or hitting escape cancels it.

Only after you apply it will other people in the session see the fill, so this helps avoid disruption. It also makes undoing a spilled fill quicker if you have a high latency, since cancelling it locally is instant.

You can also now change the size limit of the fill tool to be unlimited if you move the slider all the way to the highest position. Maybe this will become the default, but not too sure yet, since having a smaller limit makes the fill tool work faster and the default setting is likely large enough for most fills and avoids issues where someone uses the non-continuous mode and accidentally fills stuff way out of their view.

## Magic Wand Selection Tool

There's now a magic wand tool. It's basically like a fill tool, but instead of filling with color, it fills with selection.

It has pretty much the same controls as the fill tool, so you can feather, close gaps, select continuous or by color etc. You can also add to, remove from or intersect with the existing selection by holding shift and/or alt, or using the buttons in the header.

This was suggested by ChristianJohnsten [on GitHub](https://github.com/drawpile/Drawpile/issues/292){:target="_blank"}.

## Animation Import

You can now import animations from a bunch of PNGs or JPEGs via File → Import Animation Frames. There's also Import Animation from Layers, which will let you import from an ORA or PSD file. The latter replaces the previous Drawpile 2.1 animation import.

Both of these options will give you a dialog where you can pick the stuff you want to import and set some parameters, such as how long you want each key frame to be held. Importing will then create a new canvas with the timeline set up with those frames.

This was suggested by Meru, BulletPepper, Ben and RubberRoss in various places.

## Animation Export

When you export an animation, you now get a dialog for it where you can pick the format and configure the inputs, instead of just picking a file. This lets you configure the frame range, framerate and cropping before exporting, with buttons to apply the parameter from the flipbook or using the whole canvas. Like before, if you use the export button in the flipbook, it will automatically apply the parameters from there.

New export formats have been added. One of them that's available on all platforms is to export the frames as PNGs in a ZIP. This is relevant for Android and the web browser, where exporting multiple files into a directory is hard or impossible.

There's also MP4 video, WEBM video and animated WEBP exports. However, these require the ffmpeg libraries (libav and friends) to be provided when building the application. On Linux that's very easy, the AppImage already includes them and it should be similarly easy if you build it yourself. Other platforms are much more obtuse in that regard and so the official builds don't yet provide these formats.

## Minor Additions and Bugfixes

Some tablets on Windows emit a mouse click when you briefly press the pen down. Drawpile now ignores click like that and no longer makes a full-pressure blotch from them. This was reported by Ausjamcian directly.

The NSFM setting in the host dialog is now remembered properly and when you type a title that contains keywords marked NSFM in the parental control settings, it now auto-checks the box like it was supposed to do. This was reported by Bluestrings and cupcake [on Discord](https://github.com/drawpile/Drawpile/issues/292){:target="_blank"}.

The Windows installer now updates properly again. An update to CMake in GitHub Actions broke it. This was reported by Bluestrings, Blozzom and anonymous in various places, see [the issue on GitHub](https://github.com/drawpile/Drawpile/issues/1201){:target="_blank"}.
