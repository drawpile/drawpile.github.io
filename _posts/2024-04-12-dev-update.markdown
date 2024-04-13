---
layout: drawpile_post
title: "Dev Update: Week 15 of 2024"
date: 2024-04-12 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---

This week has been some work on organizational stuff and some usability improvements.

Everything here is available [in the continuous development release](https://github.com/drawpile/Drawpile/releases/tag/continuous). The web browser version of Drawpile is also updated to this version.

## Organizational Issues

The [GitHub Issues](https://github.com/drawpile/Drawpile/issues){:target="_blank"} have been cleaned up and many issues added for stuff that didn't have proper documentation before

There's also now documentation pages on [architecture](/help/development/architecture){:target="_blank"} and [coding guidelines](/help/development/codingguidelines){:target="_blank"}. The [contributing page](/help/development/contributing){:target="_blank"} has also been updated.

A lot of this came from MorrowShore and work is still ongoing on organizing all of this stuff.

## Dynamic Interface

Changing the interface mode between desktop and small screen no longer requires restarting Drawpile, it will just switch immediately. There's also now a "dynamic" option, which will automatically pick an appropriate mode for the size of the window. On Android and in the web browser, dynamic mode is now the default. On Windows, macOS and Linux, it still defaults to desktop mode.

Changing kinetic scrolling settings also now applies immediately instead of requiring a restart.

![Interface mode and kinetic scrolling settings]({{ "/assets/img/2024-04-12_interfacemode.webp" | relative_url }})

## Pan Tool

There's now a pan ("hand") tool, which you can use to move the canvas around using left click or using your tablet pen. This is effectively the same as using middle click or holding space to move the canvas, but useful e.g. if you can only use one hand or if you just want to watch don't want a tool that messes with the canvas.

This was suggested by DeeJii [on Discord](https://drawpile.net/discord/){:target="_blank"}.

## Minor Additions and Bugfixes

The default canvas size when you first start the program is now 2000x2000 instead of 800x600, because that's a more sensible minimum size for a collaborative canvas. This was contributed by MorrowShore.

The login dialog will now tell you when you try to join a session that you're not allowed to join, instead of graying it out and having to guess why that's the case. For example, it will tell you if the session is closed or full, if it requires an account, if it doesn't allow joining via web browser or if there's some kind of version mismatch.

The canvas view will no longer jerk into a completely different position when you switch to canvas-only mode (hitting Tab by default) or when you toggle docks in small-screen mode.

The autosave interval is now actually in minutes like it's supposed to be, rather than being in seconds, which just caused it to save constantly if enabled. This was reported by D'mitri [on Discord](https://drawpile.net/discord/){:target="_blank"}.
