---
layout: drawpile_post
title: "Dev Update: Week 35 and 36 of 2026"
date: 2026-09-08 00:00:00 +0100
category: "devblog"
tag: "@askmeaboutloom"
---

The last two weeks have seen a bunch of development in various directions. Unless something else comes up, I'd suspect that after the project editing mentioned below is implemented, the feature set for Drawpile 2.3.1 will be complete and a next beta will be released to test it.

You can already use the current state of it through [the alpha release](https://github.com/drawpile/Drawpile/releases/tag/continuous){:target="_blank"}.

## Project Repair

You can now repair corrupted dppr and dpcs files with SQLite's built-in recovery mechanism. If you somehow end up with a corrupted autorecovery file, this also works for them, since they are just dppr files as well.

The feature is available directly under File → Repair file. If a file is detected to be corrupted when you open it or on the recovery page in the start dialog, you will also be prompted to repair it, so you probably don't need to use this action directly in most cases. Repairing a file that isn't actually corrupted may restore bogus data, you will be warned after attempting to repair such a file.

Thanks to ciell for providing a real corrupted file to test with.

## Work In Progress Project Editing

The recording conversion dialog is currently being extended to also handle dppr files. You can add them like dprec and dptxt files and their individual sessions will show up in the list.

The purpose of this is basically to let you merge and break apart projects, in case you somehow end up with a piecemeal situation or want to get rid of a wrongly-saved session.

Currently, the dialog works and lets you load up project files, but actually converting them is still being worked on.

## Qt6 On Android

Some work is going on to get Drawpile and Krita working on Qt 6 on Android. While this is available on all other platforms and the default for some of them, on Android both programs only run on Qt 5.

Unfortunately, Qt 6 is still fundamentally broken on Android, despite having had several years to bake and Qt 5 having reached its end of life. I'd suspect Drawpile will stay on it for another while, since there's really nothing to gain and a lot of stability to lose from the update. Google and the Qt company are involved in the process though, so maybe it will get there eventually.

## UDP Activity Stream

You can now turn on an "activity stream" via Tools → Developer Tools → UDP Activity Stream. This will send information about your cursor position on the canvas, current tool, color and some other stuff to a local UDP socket.

The purpose of this is to let you integrate with applications like stream avatars or programs that make noises in response to brush strokes. To develop your own program, just start the activity stream and it will show you what data it sends, it should be reasonably obvious what that means. It doesn't send data about what's on the canvas or anything, nor can you input actions this way, the purpose isn't some kind of remote control or deep integration.

Here's an example provided by Manikobunneh of their "Drawvatar" program, which also integrates with Krita in a similar way. At the time of writing, it's not released publicly yet, but it probably will be at some point.

<video controls>
  <source src="{{ "/assets/vid/2026-09-08_drawvatar.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Minor Additions and Bugfixes

You can now export animations as PNG spritesheets. It automatically chooses the best spritesheet size leaving the least amount of empty slots. This was suggested by greendyno and ULTRA TECH [on Discord](https://drawpile.net/discord/){:target="_blank"}.

Fixed a crash when resizing the canvas smaller while a lasso transform is active. This was reported by greendyno.

When you use Save As to save a dppr file, it will now copy the previously-saved project into that file, rather than just saving the current session. This was suggested by tiar.

Selection → Fill Selection as well as the shape fill and gradient tools now adhere to layer alpha lock. This was reported by hipofiz and Verdrusk.

Double-clicking titlebars of dock widgets no longer toggles their dock state and they now have a much higher threshold to rearrange. This should prevent accidental undocking, which sometimes lead to confusion.
