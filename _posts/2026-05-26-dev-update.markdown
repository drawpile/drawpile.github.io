---
layout: drawpile_post
title: "Dev Update: Week 20 and 21 of 2026"
date: 2026-05-26 00:00:00 +0100
category: "devblog"
tag: "@askmeaboutloom"
---

The first beta version for Drawpile 2.3.1 has been released and further work has commenced.

Everything else described here was added afterwards, you can get access to it already [through the alpha release](https://github.com/drawpile/Drawpile/releases/tag/continuous){:target="_blank"}.

## Beta Release

Drawpile 2.3.1-beta.1 has been released last week.

* The release announcement is at <https://drawpile.net/news/release-2.3.1-beta.1/>
* An illustrated guide of the changes is at <https://docs.drawpile.net/help/common/update2x3x1>
* Downloads are at <https://drawpile.net/download/#Beta>

A few more fixes have made it in before that: unsetting default layers now works again, frames on move-locked animation tracks now don't block the exposure tool, the small-screen mode tabs on the sides now get sized more reasonably (thanks CosmosX007), hidden layers in frame view mode now behave consistently (thanks hipofiz) and the timelapse dialog is now sized more appropriately by default.

## Windows Thumbnails

On Windows, DPPR and DPCS files now have thumbnail support in the Windows file explorer. This is automatically wired up if you install Krita through the Windows installer.

This was developed and contributed by cow.

## Touch Actions

You can now assign any action to touch tap inputs, similar to how it works with canvas shortcuts. You can do so under Edit → Preferences → Touch by choosing "Trigger Action" for the touch tap inputs and then picking whichever action you want for them.

You can also now assign things to double-tapping with one finger. This is not assigned by default, since it can delay touch drawing.

For convenience, mirroring and flipping the canvas is also available from the drop-down for tap shortcuts, since those are pretty common actions.

This was suggested by Bnuuyman [on Discord](https://drawpile.net/discord/){:target="_blank"}.

![Touch tap settings]({{ "assets/img/2026-05-26_touchactions.webp" | relative_url }})

## Minor Additions and Bugfixes

Ratchet rotation now works properly again when the canvas is mirrored or flipped. This was reported by Bovy.

The default filename now correctly uses *months* instead of *minutes*. Qt flips around the meaning of `m` and `M` formats from normal strftime formatting for some reason. This was reported by hipofiz [on Discord](https://drawpile.net/discord/){:target="_blank"}.

You can now drag the initial point of a bezier curve again to make it curved instead of straight. Unlike before, it now also previews properly. This was reported by Astre [on Discord](https://drawpile.net/discord/){:target="_blank"}.

Drawpile should now work on Android earlier than 8 again. This was reported by freyalupen.
