---
layout: drawpile_post
title:  "Dev Update: Week 39 of 2023"
date: 2023-10-01 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---

This week, Drawpile 2.2.0-beta.8 has been released. All the changes are [in the news post](https://drawpile.net/news/release-2.2b8/). There were still a few changes in the week leading up to it, mostly fixing stuff before getting it out the door. By the way it's looking right now, the next beta release may be the last. So, what's left?

In its current state, I think 2.2.0 is reasonably close to coming out of its beta. Probably not as soon as next week, but probably also not as late as Christmas of next year. The client is pretty much ready, the only "major" feature still missing is a way to import animations from Drawpile 2.1. There's still some significant stuff left to add on the server side and it could use some more testing before it can be confidently called "stable", but it's not nearly as big of an overhaul as the client was, which is a Ship of Theseus at this point.

There's of course plenty of stuff that can still be worked on after 2.2.0 is released! But in its current state, it's enough to be stable and that other stuff could come just as well in 2.2.1 or something. Really, if you're already using the 2.2 beta, it won't make much a difference.

So as it's currently looking, 2.2.0-beta.9 may be a "release candidate". That means it's supposed to be the stable version with no new features being added, but possibly still getting bugfixes and giving time to update the translations.

If *you* (or your friends or your acquaintances or anyone in your vicinity) still got some kind of problem or missing feature in the current version, say something [on Discord](https://discord.gg/M3yyMpC) or [on GitHub](https://github.com/drawpile/Drawpile/issues). If nobody knows about it, it probably won't be fixed!

With that out of the way, onto the changes from this week.

## Less Disruptive Reset Notice

Session resets no longer show a dialog that you have to dismiss to continue drawing. Instead, they show the progress bar in the corner of the canvas and will disappear on its own. The prompt asking you if you want to save the canvas as it was before the reset is still there, but at the top of the canvas and will automatically dismiss itself if you continue drawing.

This was by Blozzom, vipperz, xxxx, zheida and probably others [on Discord](https://discord.gg/M3yyMpC) and [on GitHub](https://github.com/drawpile/Drawpile/issues/1142).

![Updated reset notice]({{ "/assets/img/2023-10-01_resetnotice.webp" | relative_url }})

## Different Icons for Different Things

When you hide a layer group, it now shows a struck-out folder icon, rather than using the same icon as hidden layers, which didn't make much sense. This was reported by Blozzom [on Discord](https://discord.gg/M3yyMpC).

Erase mode now has a different icon from the eraser tool, hopefully making them harder to mix up. The brush tool icon in the toolbar now also shows you if you're in erase or alpha lock mode, to alleviate confusion as to why you're erasing when the eraser isn't selected. When you click on that button, it will cause the brush to revert to normal mode. This was reported by Geese in a drawing session.

![Layer group and erase mode icons]({{ "/assets/img/2023-10-01_icons.webp" | relative_url }})

## Minor Additions and Selected Bugfixes

Drag-zooming, which is bound to Ctrl + Middle Click by default, now zooms where you initially clicked, rather than in the center of the canvas. This was reported by Valaek [on Discord](https://discord.gg/M3yyMpC).

The preferences dialog should no longer become unusably tiny on Windows when you have two monitors with different resolutions. It also now works properly in Arabic and other right-to-left languages. You can also also scroll and resize it now. This comes at the expense of looking less sleek, especially on macOS, but it should be more usable in this state.

Server messages like "preparing for session reset" can now be translated, rather than always being in English.

The server now explicitly tells the client when it's done catching up, so it should no longer happen that you get stuck catching up at 99% when you join or during a reset.

When you paste an image that's as large or larger than the canvas, it will be centered on canvas, rather than being centered on your view. That means if you're pasting a canvas-sized image, it will actually fill out the canvas exactly, rather than being off by an annoyingly tiny amount. This was reported by Meru [on Discord](https://discord.gg/M3yyMpC).

In the same vein, if you paste while a selection is currently still present, it will be centered on the selection properly, rather than randomly shifting by a pixel in some direction. Also reported by Meru.
