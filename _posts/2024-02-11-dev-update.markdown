---
layout: drawpile_post
title: "Dev Update: Week 6 of 2024"
date: 2024-02-04 00:00:00 +0100
category: "devblog"
tag: "@askmeaboutloom"
---

Last week has mostly been more fixing going on, while banging desperately around on some Windows issues that are blocking the release of 2.0.1.

These changes are available right now [in the continuous release](https://github.com/drawpile/Drawpile/releases/tag/continuous){:target="_blank"}.

## Documentation

A help article on [Contributing](https://docs.drawpile.net/help/development/contributing){:target="_blank"} has been added. It lists ways that someone can contribute to Drawpile. Stuff like providing art, translations, documentation etc., plus a list of stuff for developers to tackle. This includes some simpler or at least contained things, as well as stuff that needs specific hardware or operating systems.

## Server Sorting

The browse tab will now no longer change the order of the list servers when you sort by name. This was always kind of an annoying side-effect of how Qt handles sorting, but with some chicanery under the hood, it can be convinced to keep the order instead.

Since that's no longer an issue, the tab will also now remember the last sort order you had it set to.

## Windows Troubles

For some reason, the Windows file picker didn't accept the directory it was told to use, throwing you into Program Files instead. This is now fixed, but instead a warning is now logged. Still sorting that out.

There also seems to be some problems with the Windows installer thing, where it whinges about not being able to update shortcuts for no good reason, since the shortcuts are already correct. Still trying to figure out how to make it not do that.

## Minor Additions and Selected Bugfixes

When a server's certificate changes and it's not a self-signed certificate, it won't ask you to confirm that you want to accept it. This is because regular certificates renewing is a normal process, there's no need to confirm anything. If you still want to pin a certificate, you can do so in the server preferences. Reported by Bluestrings and Pepper [on Discord](https://drawpile.net/discord/){:target="_blank"}.

Edit → Copy Merged will now fill the background of a lasso selection, letting you copy stuff out of Drawpile more sensibly this way. Reported by Bluestrings [on Discord](https://drawpile.net/discord/){:target="_blank"}.

The bezier curve tool now makes smooth curves even at small sizes, before they were jaggy. Reported by Crow [on Discord](https://drawpile.net/discord/){:target="_blank"}.

Server owners can now kick users through the web UI even when they are not connected to any session.
