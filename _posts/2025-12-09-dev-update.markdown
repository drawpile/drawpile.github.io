---
layout: drawpile_post
title: "Dev Update: Week 48 and 49 of 2025"
date: 2025-12-10 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---

After releasing Drawpile 2.3.0, the last two weeks have been mostly "infrastructure" work for upcoming changes, so nothing too exciting to show yet.

## Project File Format

There's been some work on the project file format already written about [in an earlier blog post](https://docs.drawpile.net/devblog/2025/03/15/dev-update.html#project-file-format). The idea is mainly that Drawpile will automatically record your drawing, serving as autosave, timelapses and more.

The work on that is still going on, but some infrastructure has been built to run this auto-recording on a separate thread. It still needs to be integrated though.

## Settings Supplantment

The settings in Drawpile have historically been using Qt's QSettings implementation to persist its settings. This implementation has several problems: it's slow, inconsistent between different Qt versions and seems to sometimes get corrupted in strange ways. The slowness even requires some workarounds in Drawpile that make it only actually save the settings when you're not actively using it to avoid it chugging.

There's also a very pretty wrapper around the settings, which allows the code using settings to be very clean and concise. Unfortuantely, that code uses C++ and the Qt meta-object system pretty intensely, which has turned out to be a mistake. For one, it causes Drawpile to build significantly slower, by far the slowest files in the entire codebase. And for another, it has caused multiple crashing bugs in the past because Qt just doesn't expect to be used that intensely.

The solution is, as usual, to use SQLite instead. It's fast, robust and allows partial writes. Drawpile already uses it for certain settings and it's also the basis for the new file formats, where it's showing just how fast it can be. There's been some work done to start transitioning over to this, but there's quite a lot of settings to work through, so this isn't done yet.

## Minor Additions and Bugfixes

* When using the hardware renderer, the canvas view's dimensions are now forced to be even by adding a single pixel of padding if necessary. This is necessary on some devices to prevent the view getting scrunched in a weird way.
* MyPaint brushes now handle stair-step curves properly. Previously they could end up generating values inside of a stair step, which didn't make sense.
* The user interface for MyPaint brush curves now doesn't show the curve continuing straight before the first and after the last point, because that's not accurate to what's going on (what really happens is that the values go really high or low very quickly.)
* You can now set a blank brush cursor in the tool preferences. This was suggested by mixnmatt [on Discord](https://drawpile.net/discord/){:target="_blank"}.
* Drawpile now tries harder to detect whether an eraser is brought near the canvas, even if the tablet doesn't properly report it. This fixes the eraser not being detected on some Linux systems at minimum, possibly other operating systems as well. This was reported by Lauwenmark [on Discord](https://drawpile.net/discord/){:target="_blank"}.
* Rectangle selections now show the extents of the selection in the status bar. This was suggested by Mercia [on Discord](https://drawpile.net/discord/){:target="_blank"}.
