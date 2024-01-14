---
layout: drawpile_post
title:  "Dev Update: Week 2 of 2024"
date: 2024-01-14 00:00:00 +0100
category: "devblog"
tag: "@askmeaboutloom"
---

This week, Drawpile 2.2.0 has been released. It no longer carries the beta moniker. This week was mostly spent on getting that ready, but also some work happening to get the web version of Drawpile out to server owners.

## Drawpile 2.2.0 Release

The stable release of 2.2.0 is out now. Along with the downloads on drawpile.net, a bunch of surrounding stuff has been updated too, such as the documentation, the Flatpak version on Flathub, the web admin UI and the Docker images.

## Web Browser Work

The web client test page has been rolled out to drawpile.net and a few server owners have successfully managed to set it up on their servers. I'll probably be grabbing some more of them next week and write up some documentation about it. Putting it on the official community servers is also a work in progress.

The session listings and invite page on drawpile.net have also been updated to be able to link to web sessions. When you send an invite link to a web-enabled session, the invite page will show the options to copy the link and join in the application as usual, but there will also be a button to join through the browser.

![Invite link page with web browser link]({{ "/assets/img/2024-01-14_invite.webp" | relative_url }})

## Active Drawing User Counts

Session listings have gained the ability to include an "active drawing users" count, which will show how many users have actually been drawing in the last five minutes. This allows recognizing if a session is actually being drawn in or if everyone is just sitting in it idle. Only drawing commands count toward this, so people just chatting won't count as being actively drawing.

In the Browse page of the client, you can filter out inactive sessions.

This requires drawpile-srv and/or the list server to be updated, so you probably won't see this change in most places yet.

## Minor Additions and Selected Bugfixes

The login dialog should no longer sometimes end up behind the start dialog that it was supposed to be a child of. Reported by shablagoo and Bluestrings [on Discord](https://drawpile.net/discord/){:target="_blank"}.
