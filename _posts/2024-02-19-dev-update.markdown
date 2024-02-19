---
layout: drawpile_post
title: "Dev Update: Week 7 of 2024"
date: 2024-02-19 00:00:00 +0100
category: "devblog"
tag: "@askmeaboutloom"
---

Last week has been getting Drawpile 2.2.1 ready, which [has been released today](https://drawpile.net/news/release-2.2.1/){:target="_blank"}.

It also brought some performance improvements for classic brushes contributed by kiroma.

## Classic Brush Speedup

The classic, soft Drawpile brush was using some rather unoptimal code, using fractional numbers for its calculations, whereas the actual pixel data uses integers. It has been rewritten to use integers entirely, which notably speeds up the processing.

This was contributed by kiroma [on Github](https://github.com/drawpile/Drawpile/pull/1184){:target="_blank"}.

## Windows Detroubles

The Windows issues [mentioned last week](/devblog/2024/02/10/dev-update.html#windows-troubles){:target="_blank"} have been resolved.

When saving or opening files, the file picker dialog should now properly use the previous directory and not log any warnings in the log file.

The installer will now no longer mess with your shortcuts when you update Drawpile, neither adding nor removing them. It will create desktop and start menu shortcuts when you install it, recreate them when you repair the installation and remove them when you uninstall.

## Web Browser Client Developments

The web browser client will now show a progress bar when it's loading the assets and application. Depending on the connection, this may take quite a while, so now it should be clearer that it's not actually stuck at those spots.

When connecting to a server that uses drawpile.net accounts for its logins, it will now use the website directly to let you log in and pick which username you want to use. That means you don't have to type in your password every time, your browser will remember you being logged into the website.

## Minor Additions and Selected Bugfixes

The server now disconnects users if they enter a wrong password too many times.

Attempts by a client to host or join a session are now logged in the server log, even if they end up getting disconnected because of a ban or don't enter a valid password. Reported by Bluestrings [on Discord](https://drawpile.net/discord/){:target="_blank"}.
