---
layout: drawpile_post
title: "Removal of the Roomcode Feature"
date: 2024-04-18 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---

The "roomcode" feature will be removed in Drawpile 2.2.2. If you don't know what this is about, you probably weren't using it, and I doubt anybody really did anymore.

## What Roomcodes Were

Back in the old times, Drawpile used to have a single, central listing server. When you used Drawpile's session browser, it would always pull its listings from there and if you wanted your session to show up, you had to list it there.

There were two options of listing your session. The "normal" way was to list it publicly, which made it show up in the session browser. But there was also the way to do a "private listing", which would only generate a so-called roomcode, a six character code. You could give that to yourf friends, who would type it into Drawpile, which would ask the listing server if it knew that roomcode. If it did, it would resolve it to the session's address.

So basically, roomcodes were a link shortener for Drawpile sessions.

## Falling Out Of Favor

Later, Drawpile changed the way listings work. There's no longer a central listing server hard-wired into the program. Instead, anyone can run their own listing server and you can add any number of listing servers to Drawpile's browser.

This poses a problem for roomcodes, since they really relied on there being a central server to resolve them. That poses many questions on how they even continued to work at all.

What happens when you type a roomcode into Drawpile? Uh, it just asks every listing server you added hoping one of them knows the code. This can take a while, depending on how many list servers you added.

What if you don't have the list server added? Well, then the roomcode is useless to you. So you if you want to invite a friend that never used Drawpile before, you first have to explain to them what hoops to jump through go through to actually make the code work.

How do listing servers coordinate to avoid duplicate roomcodes? Um, they don't. If you have particularly bad luck, you might type in a roomcode and get sent to the wrong session.

Altogether, that makes roomcodes very hard to actually use sensibly. On top of all that, calling it "private listing" is questionable, since it's not actually all that private. If you want privacy, you gotta set a password on your session, since otherwise someone that just knows the server's address can join it anyway.

## Replacement

With Drawpile 2.2.0, invite links were added. They're superior to room codes in pretty much every way: you don't have to list them anywhere, people joining don't have to add a list server first, they provide a website that explains how to get Drawpile or join via browser and they will also include the session password so that you don't have to type that in manually.

And if the link is too long for your taste, you can use a regular link shortener, there's plenty of them out there.

## Removal

Actually, pub.drawpile.net already disabled roomcodes about half a year ago. It doesn't look like they're missed.

With version 2.2.2, roomcodes and the private listing option will be removed from Drawpile itself, both the client and the server. The GitHub issue tracking this is [drawpile/Drawpile#1224](https://github.com/drawpile/Drawpile/issues/1224){:target="_blank"}.

The listing server will remove support for them with version 1.8.0, the tracking issue is [drawpile/listserver#8](https://github.com/drawpile/listserver/issues/8){:target="_blank"}.
