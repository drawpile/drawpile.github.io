---
layout: drawpile_post
title:  "Dev Update: Week 51 of 2023"
date: 2023-12-24 00:00:00 +0100
category: "devblog"
tag: "@askmeaboutloom"
---

Merry Christmas. Last week pub.drawpile.net got moved to a new home and work on a browser version of Drawpile has begun.

## Pub Rehoming

The public Drawpile server at pub.drawpile.net has moved to a new machine, which is significantly faster than the old one. We're keeping an eye on the resource usage for now, but since the server is really bored even at the maximum of 30 sessions running, we'll probably be increasing the session limit.

The new machine is also in Europe, while the old one was in North America. This makes latency, uh, different. Better in some places, worse in others.

## Drawpile Web

The paint engine that Drawpile currently uses actually started out as something that was able to run in a web browser. After getting side-tracked (well, main-tracked, really) with improving Drawpile itself, it's now back to where it began.

This is all of Drawpile running in the browser. It uses WebAssembly for its code and Web Workers to run stuff on multiple CPU cores, so performance looks pretty reasonable. It's not as fast as running it natively, but also not as dreadfully slow as the usual web application fare.

It's confirmed to work on Chromium in Linux, Chrome on Android and Safari on iPad (thanks to WitchesSwitches for helping figure this one out.) Firefox on Linux and Android doesn't have working pen pressure, which is [a known issue](https://bugzilla.mozilla.org/show_bug.cgi?id=1606832){:target="_blank"}. Haven't tried it on Windows and macOS yet, but pen pressure there generally works fine on just about any browser.

While it's a lot more than I'd have expected to be working in such a short time, this is only about four days of development, so many things still don't work properly. In particular, anything involving files isn't functional yet, so you can't load or save. Joining and hosting sessions is difficult to use because the interface isn't designed for how the browser handles things. The assets (icons, sounds etc.) need to be bundled together, since loading them all as separate files is pointlessly slow. Also, there's some asynchronous code in Drawpile, which WebAssembly really doesn't like and e.g. causes some message boxes to make the rest of the application disappear until they're dismissed. Rewriting those parts would probably also make the application smaller and faster.

Server-wise, it uses WebSockets for its networking, which currently uses a proxy application in the middle that translates between those and drawpile-srv's TCP sockets. I had WebSockets integrated directly into drawpile-srv over 2 years ago, but at that time, Qt's implementation was way too slow to be usable. I'll have to see if that has gotten better since then.

Here's a screenshot of it. It's just the Drawpile you know, but in a web browser.

![Drawpile running in the browser]({{ "/assets/img/2023-12-24_browser.webp" | relative_url }})

## Minor Additions and Selected Bugfixes

The "back" button in the login dialog (which says stuff like "Rules" or "No" depending on what you're going back to) has been moved to the left edge, since its previous position was the same as the OK button, which lead to accidental clicks out of habit. Reported by Blozzom [on Discord](https://drawpile.net/discord/){:target="_blank"}.

Editing a remembered account and unchecking the "remember password" option will now forget the password for that account, rather than having to forget the whole account to do it. Reported by Meru [on Discord](https://drawpile.net/discord/){:target="_blank"}.
