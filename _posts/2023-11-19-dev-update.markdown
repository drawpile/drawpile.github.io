---
layout: drawpile_post
title:  "Dev Update: Week 46 of 2023"
date: 2023-11-19 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---

Drawpile 2.2 beta 10 was released last week, shortly after beta 9, to fix a bug that caused a lock-up on startup. You can read more [in the news post](https://drawpile.net/news/release-2.2b10/).

This week has mosly been lots of bugfixes and a few organizational things.

## Drawpile on libera.chat

Drawpile now has an IRC channel on [libera.chat](https://libera.chat/) called `#drawpile`. It's a place that's more convenient for many developers, since they'll already be on there due to other open source projects.

It also lets people join it [directly through the browser](https://web.libera.chat/#drawpile), which is nice for folks who don't want to deal with Discord. There's some work going on to relay messages between IRC and Discord, allowing folks from one place to help folks in the other without needing to be online in two messengers, because everyone already has enough different messengers nowadays.

## Shape Up

The rectangle tool now works better with MyPaint brushes, no longer causing the corners to break open when the shape gets too large. This was reported by haxekhaex2 [on GitHub](https://github.com/drawpile/Drawpile/issues/1151).

The circle and curve tools now calculate the number of points they need given their size, rather than always using a fixed number. That means large circles and curves will now be smooth, rather than all jaggy like before.

## Phoning In

Several things have been fixed and improved with regards to Android, especially on devices with small screens like phones.

Drawpile will now check if the device has a stylus or not and enable or disable fingerpainting accordingly.

The preferences dialog now allows horizontal scrolling and puts the former sidebar at the bottom, which avoids the close button getting thrown off-screen and doesn't squash the settings pages into a very narrow area on vertical screens. The main window also makes more of an effort to resize itself to fit the screen now, so its controls should also not end up being pushed beyond its bounds. These were reported by Xkower [on Discord](https://discord.gg/M3yyMpC).

Copying and pasting has been fixed on Android, it didn't work at all before. Reported by ariqhadiyan [on GitHub](https://github.com/drawpile/Drawpile/issues/1162).

Opening large files should also now uses way less memory and doesn't lock up the UI, which makes it less likely for Android to terminate the application because of it. Also reported by ariqhadiyan [on GitHub](https://github.com/drawpile/Drawpile/issues/1163).

## Noninstall

As a convenience for people who want to compile Drawpile from source, it will now look in the source directory for assets by default. That means you no longer have to install it into the system for stuff like brush presets or icons to work. Previously, it would just not load those properly and then require some annoying manual cleanup to get it working again.

It can be turned off by passing `-DSOURCE_ASSETS=OFF` to the cmake configuration step. Sort of reported by Meru, lowontrash and some others who ran into trouble with the install requirement.

## Translation Experimentation

Drawpile's documentation (help articles and whatnot) will probably be moved to this website (docs.drawpile.net), rather than being scattered across drawpile.net, a GitHub wiki, some files in the source code and even some stuff being buried in pinned Discord messages.

The plan is to allow the documentation to be translated as well. As a test, there's [a German translation](https://docs.drawpile.net/help/draw/clipping.de_DE) of the [help article on alpha preserve, clipping groups, masks and alpha lock](https://docs.drawpile.net/help/draw/clipping) now.

## Minor Additions and Selected Bugfixes

Scrolling on macOS and touch pads like the Apple Magic Trackpad should now behave as expected. This was reported and got lots of help from Charmandrigo [on GitHub](https://github.com/drawpile/Drawpile/issues/1092).

The tablet tester, playback and event log dialogs now have close buttons, so that systems without window decorations can get rid of them without resorting to hitting physical keys or buttons.

Building on Fedora should now work even when Qt4 is installed. Reported by lowontrash directly.

The server now no longer shows a "cannot look up one session and then join another" when joining a session with an ID alias. Reported by Kink and Fabian.
