---
layout: drawpile_post
title:  "Dev Update: Week 5 of 2024"
date: 2024-02-04 00:00:00 +0100
category: "devblog"
tag: "@askmeaboutloom"
---

This week has been more bugfixing, some optimizing, some attention being given to the Windows installer and finally some documentation written up for how to animate in Drawpile.

As always, these changes are available right now [in the continuous release](https://github.com/drawpile/Drawpile/releases/tag/continuous){:target="_blank"}.

## Documentation

The following help articles have been added:

* [Animation](https://docs.drawpile.net/help/draw/animation){:target="_blank"}, which explains how to animate in Drawpile.
* [Flood Fill Tool](https://docs.drawpile.net/help/draw/floodfill){:target="_blank"}, which talks about how the fill tool works, particularly the size limit aspect of it.
* [Running Public Sessions](https://docs.drawpile.net/help/server/sessionoperation){:target="_blank"}, which replaces the old "Mod Tips" article and explains how to handle public sessions, permissions, bans etc.

## Windows Installer

The installer in Windows will now create a shortcut on the desktop. Apparently this is what Windows users expect, or at least there's been a few cases where people asked "where it went" after installing Drawpile. The other start menu shortcut is still there as before.

The installer will also no longer break shortcuts pinned to the task bar. For some reason Microsoft's installer will remove those shortcuts and attempt to recreate them by default, which in turn fails because installers aren't allowed to create task bar shortcuts. Not sure why they can't make their installer technology with their own operating system, but it's been changed. This was reported by Bluestrings [on Discord](https://drawpile.net/discord/){:target="_blank"} and anonymous [on libera.chat](https://drawpile.net/irc/){:target="_blank"}.

The 32 bit installer is also now actually 32 bit and will ask you to install a 32 bit version of Microsoft's Visual C++ Redistributable. Previously, it was still partially 64 bit, which wasn't terribly useful.

## Session User Limit

It's now possible to set a maximum user limit per session in the server, rather than having it always be 254. This limit will be the default for newly hosted sessions.

Moderators and server admins can override this for individual sessions.

## Layer Censoring Fixes

A rarely used feature probably, so there's been a lot of wonk that has been straightened out.

The stripes on censored tiles are now wider, making them less flickery when zooming out. Reported by Ben directly.

View → Show Censored Layers is no longer remembered across restarts, because it should be a conscious decision to enable it per session.

Censored layers are now shown properly in the layer list when Show Censored Layers is enabled.

Censoring a layer group now actually has a visual effect.

## Optimizing the Multidab Optimization

A bit of a technical topic that requires some lead-up, but I think it's interesting to talk about anyway.

Brushes in Drawpile (and most other drawing programs) work by putting "dabs" on the canvas, which are some kind of oval, square or some other shape. When you draw a brush stroke, it consists of many of these dabs in a line or whatever other pattern. As you can probably imagine, there's a lot of these happening all the time.

Drawpile's paint engine uses persistent data structures. Effectively, this means that when you make a change to the canvas, it won't modify the canvas directly, it will instead create a new version of it and then applies the changes to that. The previous version remains unchanged. This is generally very fast, because different versions of the canvas can share everything that didn't change between them, and it makes a lot of other things faster and simpler. For example, undos can just jump back to a previous version, file saving doesn't have to worry about a canvas changing while it's being saved and rendering the canvas to the screen can just compare the previously rendered canvas with the current one to figure out what it needs to redraw.

However, these two things don't mix well. Drawing a single brush dab involves creating a new version of the canvas, finding the layer that it applies to, making a new version of that layer, making a new version of the area of pixels that get changed by the dab, only to then draw a (usually) tiny circle on it. While creating new versions of the canvas is fast, it ain't so fast if you're doing it thousands of times a second and change only a minuscule amount of pixels each time.

To make up for that, Drawpile uses an obvious optimization: it combines multiple dab drawing commands into a single step, dubbed "multidab." This way, it only has to make new versions and find the target layer once and then it can blast all the pixels onto that without additional overhead. This makes painting significantly faster, especially for MyPaint brushes that produce a lot of dabs.

However, this causes another problem. If too many dabs get combined into a single step, they will take too long to draw. To a human, this will feel like the application is chugging, since it's drawing things in too large bursts. This is especially annoying if you're currently trying to draw yourself, because Drawpile can't prioritize your own drawing while it's busy chewing through a long multidab operation.

Okay, so obviously the amount of dabs to combine into one step needs to be limited some way to prevent this from happening. Drawpile did this already to begin with, based on the area that the dabs cover in total and some rough tuning to something that seemed to work okay. However, the result was far from ideal.

So I actually sat down and did some measuring now, with every type of brush at every size and using every blend mode. I even made some graphs, but they aren't too exciting, they all just show quadradic curves of the form `y = ax²`, where `x` is the size of the brush dab, `y` is the time taken and `a` is some kind of constant factor based on the brush type and blend mode. Which is nice, because that constant factor can be measured and used to calculate a more accurate estimation of the cost of each dab.

That's what I did, and now the multidab optimization uses those costs to bundle multiple dabs together. Which should hopefully reduce the chances of chugging with certain brushes.

Some somewhat interesting discoveries along the way:

* The the most common blend modes are the fastest: Normal, Erase, Behind, Recolor, Alpha Darken (used in indirect/wash mode), Normal and Eraser (used by MyPaint brushes.)
* Blend modes that have to fiddle with different color spaces, like Color, Hue or Saturation, are by far the slowest.
* Round and square pixel dabs are the fastest, followed by MyPaint dabs, with the soft round dabs being the slowest. MyPaint brushes often produce more dabs than the rest though, so while the individual dabs may be faster, the resulting brush strokes often take longer to process.
* Hardness, opacity, aspect ratio and angle don't appear to notably affect speed.

## Minor Additions and Selected Bugfixes

While you could always trust and untrust users via the server's web API, it didn't actually tell you the current trusted status of users. This is now fixed and the web admin UI now lets you view and manage trusted users.

The join dialog will now remember the last join address so that you can get back into a session quickly after closing Drawpile without having to hunt for the invite link or password again.

Temporary server bans no longer tell the user that the ban is permanent instead. A ban is considered permanent if it's 99 years or more into the future. This was reported by Bluestrings [on Discord](https://drawpile.net/discord/){:target="_blank"}.

Server IP bans now properly convert between IPv4 and IPv6 as appropriate. Also reported by Bluestrings [on Discord](https://drawpile.net/discord/){:target="_blank"}.

Initial catchup will no longer stop before it's actually done catching up for persistent sessions after a server restart.

User cursors are no longer shown while the canvas is not visible. This happened during initial catchup, where user cursors would whizz around a nonexistent canvas in the background while the catchup loading bar was filling up.

Added some bulk permission commands so that moderators can fix up sessions that have ended up in an uncontrolled mess without making hundreds of clicks. They are documented [on the Running Public Sessions help page](https://docs.drawpile.net/help/server/sessionoperation#bulk-permission-commands){:target="_blank"}.

Recordings will no longer include stuff from before a reset in subsequently created recording files. Reported by Meiren [on Discord](https://drawpile.net/discord/){:target="_blank"}.
