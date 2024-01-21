---
layout: drawpile_post
title:  "Dev Update: Week 3 of 2024"
date: 2024-01-21 00:00:00 +0100
category: "devblog"
tag: "@askmeaboutloom"
---

This week has been spent mostly with some trailing work from the 2.2.0 release, fixing up some issues that came up in it and further work on the browser version of Drawpile.

As always, these changes are available right now [in the continuous release](https://github.com/drawpile/Drawpile/releases/tag/continuous){:target="_blank"}.

## Flatpak and Docker

The [Flatpak release on Flathub](https://flathub.org/apps/net.drawpile.drawpile){:target="_blank"} has been updated to version 2.2.0. This is probably a bit nicer than the AppImage version for most Linux users.

The [Docker images on Docker Hub](https://hub.docker.com/u/drawpile){:target="_blank"} have also been updated accordingly. They're also currently now available for ARM devices (thanks to user for requiring this.)

## Web Compatibility

While the web browser version of Drawpile still needs further work, the necessary changes to make the client and server compatible with it have been mainlined.

For the client, this means that invite links will now lead to a page that contains a "join in the browser" button if appropriate and that you can toggle if users are allowed to join a session using the web client or not (if you have permission to do so.) For the server, this enables WebSocket support and various permission settings relating to it, such as who is allowed to join from the browser.

## Canvas Performance

An earlier fix to jittery pixels on the canvas made in 2.2.0-beta.11 apparently caused some performance issues on some devices, particularly on macOS. It has been turned off again by default and made optional.

The setting can be toggled in the general preferences under Canvas view. Additionally, you can turn off interpolation here now, which may bring some speedup on slower devices as well.

This was reported by DevonJP [on Discord](https://drawpile.net/discord/){:target="_blank"}.

![Canvas view performance settings]({{ "/assets/img/2024-01-21_performance.webp" | relative_url }})

## Minor Additions and Selected Bugfixes

Don't revert to strange directories like Program Files or System32 when saving a fresh file. Reported by Crow [on Discord](https://drawpile.net/discord/){:target="_blank"}.

Invite links now will include if a session is tagged NSFM and include an appropriate notice on the website page when this is the case. Suggested by Blozzom [on GitHub](https://github.com/drawpile/website/issues/34){target="_blank"}.

When the brush settings dock is reduced to its absolute minimum width, it will no longer get wider when switching between different brush types. Reported by Meiren [on Discord](https://drawpile.net/discord/){:target="_blank"}.

Cancelling a connection while it's being established now properly re-enables the host and join buttons, rather than having to restart the application. Reported by Fox directly.

Drawpile now switches from the eraser to the brush if it detects that the pen tip comes into proximity, rather than only doing so when the eraser leaves proximity, because apparently some tablets don't properly report the latter. Reported by Daystream [on Discord](https://drawpile.net/discord/){:target="_blank"}.
