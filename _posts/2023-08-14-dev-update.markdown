---
layout: drawpile_post
title:  "Dev Update: Weeks 31 - 32 of 2023"
date: 2023-08-14 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---
First post to this blog! I thought it would be nice to have a place to share updates on what stuff is being worked on and such, rather than that information getting buried somewhere in a changelog.

This post will talk about the stuff that's changed in the last two weeks, which is when [Drawpile 2.2 beta 6 was released](https://drawpile.net/news/release-2.2b6/). It wasn't *that* much that happened, owed to me getting a bit sick, a family member getting more sick and my computer frying itself earlier today. Luckily I got a backup. The temperature sensor says it's running at 1003°C, but since it's not actually on fire that's probably just a faulty reading.

## Better Animation Timeline Usability

At the top of the animation timeline, there's now a button for adding a layer for the current key frame, along with similar buttons next to it, which makes that commonly-used action less hidden than it was. This was suggested by FallenArts [on Discord](https://discord.gg/M3yyMpC). The timeline also now tells you what to do when there's no tracks yet, rather than leaving you staring at a blank grid helplessly until you figure out which knob you need to twiddle to get started.

<video controls>
  <source src="{{ "/assets/vid/2023-08-14_timelineusability.mp4" | relative_url }}" type="video/mp4"/>
</video>

## "Ratchet" Canvas Rotation

In addition to the regular rotation canvas shortcut of <kbd>Alt + Middle Click</kbd> or <kbd>Alt + Space + Left Click</kbd> by default, there's now also a "ratchet" rotation shortcut on <kbd>Alt + Shift + Middle Click</kbd> or <kbd>Alt + Shift + Space + Left Click</kbd>. This rotation mode snaps to 15° increments, much like it works in Krita. Like any other canvas shortcut, the key combination can be customized in the preferences.

The suggestion for this feature [came from Kvothen on GitHub](https://github.com/drawpile/Drawpile/issues/1118).

<video controls>
  <source src="{{ "/assets/vid/2023-08-14_ratchetrotation.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Muting Notifications

You can now mute all notifications for a window in the chat options. This will turn off sounds and those speech bubbles for chat messages, joins/leaves, canvas locks etc. You can unmute them the same way. This was suggested by Blozzom [on Discord](https://discord.gg/M3yyMpC).

Slightly related, when a chat notification is triggered, the window in which it happened will set itself as "alerted". What exactly this means depends on your operating system and such, but it's similar to what other applications do. In Windows, the icon in the task bar will turn orange, for example. Muting notifications also mutes this. It was suggested by Radio because he's in my DMs.

![Screenshot of the mute setting]({{ "/assets/img/2023-08-14_mute.png" | relative_url }})

## Selected Bugfixes

A previous bugfix intended to stop docks from rearranging when starting the program on Windows inadvertently caused floating (that is, non-docked) docks to show up blank on startup. That's fixed now, thanks to [SnazComic on GitHub](https://github.com/drawpile/Drawpile/issues/1125) for reporting it.

When you right-click on a brush preset, it will no longer show you the options for editing brush tags, since that was pretty unexpected and caused accidental obliteration of tags for some people. It now only shows brush options, as it should. Thanks to Blozzom for reporting this [on Discord](https://discord.gg/M3yyMpC).

The paint engine should now use significantly less memory, especially when drawing offline. Techy explanation: the rollback netcode used to keep intermediate states around in case it needed to roll back to them, but then didn't clean them up even after it became clear that everything was still in sync, it would only happen way later. Now those states are scrubbed as soon as it's clear that they'll never need to be rolled back to.

## Backend Jiggering

The public Drawpile servers will probably be moved to a beefier and cheaper server soon. There's been some work going on behind the scenes getting things in place, so we should hopefully start moving that stuff. Keep an eye out for announcements in Drawpile's startup dialog, on [drawpile.net](https://drawpile.net/) or [in the Discord server](https://discord.gg/M3yyMpC).
