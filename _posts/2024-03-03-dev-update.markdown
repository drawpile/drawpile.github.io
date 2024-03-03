---
layout: drawpile_post
title: "Dev Update: Week 9 of 2024"
date: 2024-03-03 00:00:00 +0100
category: "devblog"
tag: "@askmeaboutloom"
---

Last week the browser version of Drawpile has been enabled on pub.drawpile.net and, since Windows Smart Screen seems to have mostly calmed down, version 2.1 will now prompt users to update. Otherwise it's mostly been documentation work.

## Documentation

* An article on [updating to Drawpile 2.2](https://docs.drawpile.net/help/common/update2x1){:target="_blank"}, with the important stuff that's changed since 2.1.
* How [stabilization and smoothing](https://docs.drawpile.net/help/draw/stabilization){:target="_blank"} work.
* And a page on [brush settings](https://docs.drawpile.net/help/draw/brushsettings){:target="_blank"}.

## Community Server Overview

The [Communities page on drawpile.net](https://drawpile.net/communities/){:target="_blank"} now shows a summary of the permissions on each server: who can join and host, how they handle adult content, for which sessions the browser version is enabled and what account system they use.

The server's browser situation is also listed on the individual community pages now.

## Minor Additions and Selected Bugfixes

You can now choose to use different cursors in erase and alpha lock mode. An eraser cursor has been added for this. Suggested by Hipofiz and Rylan [on Discord](https://drawpile.net/discord/){:target="_blank"}.

Annotations are now properly loaded from ORA files saved by Drawpile 2.1. Reported by RyanMolyneux [on GitHub](https://github.com/drawpile/Drawpile/issues/1186){:target="_blank"}.

The browser client on web.drawpile.net is now distributed into a cache, which should make the initial loading faster for folks who don't have a fast connection to the main server.
