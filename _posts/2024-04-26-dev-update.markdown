---
layout: drawpile_post
title: "Dev Update: Weeks 16 and 17 of 2024"
date: 2024-04-26 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---

The last two weeks have been some designing, some fixing and the start of reworking Drawpile's selections. The design issues in particular could use some feedback.

## Browse Split

The session browser in Drawpile is pretty difficult to use in its current state, mostly due to it being a really wide table with overly dense information. On phones, it's outright unusable, due to the columns getting scrunched into oblivion.

You can read more about an idea for redesigning it here: <https://github.com/drawpile/Drawpile/issues/1226#issuecomment-2071835505>

Feedback on this is desired, either on the GitHub issue itself, [on Discord](https://drawpile.net/discord/){:target="_blank"} or [on IRC](https://drawpile.net/irc/){:target="_blank"}.

[![Idea for a split browse dialog]({{ "/assets/img/2024-04-26_browseredesign.webp" | relative_url }})](https://github.com/drawpile/Drawpile/issues/1226#issuecomment-2071835505){:target="_blank"}

## Host and Session Settings Coalescence

The host dialog and session settings are another are in need of rethinking. They often confuse new users and need way to many clicks to do everything.

There's ideas for how to redesign them over here: <https://github.com/drawpile/Drawpile/issues/1220#issuecomment-2068984250>

Again, feedback is greatly desired, be it on the GitHub issue, [on Discord](https://drawpile.net/discord/){:target="_blank"} or [on IRC](https://drawpile.net/irc/){:target="_blank"}.

[![Idea for redesigned host and session settings]({{ "/assets/img/2024-04-26_hostredesign.webp" | relative_url }})](https://github.com/drawpile/Drawpile/issues/1220#issuecomment-2068984250){:target="_blank"}

## Selections Rework

Drawpile's selections are unduly limited in many ways. They intermix selections and transformations in a confusing way, it's too easy to accidentally deselect them and, since they go away when you switch between tools, they preclude the addition of many useful features. The code for them is also pretty troublesome, since it jumbles together selections, transformed canvas areas, pasted images, and even *partial* selections, like when you're in the process of doing a lasso selection but haven't let go of the button yet, into a single "selection" entity that has to somehow consolidate all of these different combinations.

Work on fixing this has begun now, although it'll probably take another bit until it's finished, since a lot of the existing code needs to be tossed out entirely. The way it's going to work is that selections are going to be stored in the canvas state in a similar format to layers. This allows them to persist as you switch tools and lets the paint engine interact with them properly, such as by participating in undo and redo or potentially letting you use brushes to draw selections.

I *think* it's possible to bring this in version 2.2.2. While adding new commands for selections technically breaks protocol, they don't have any visual effect, so they don't actually cause any desync. Which in turn means that anything involving visible changes needs to wait until 2.3.0, such as keeping brush strokes inside of the selection.

Here's showing off the persistent selections, with parts being added, removed and interesected. You can also see how it integrates with undo. They're currently displayed in blue just because figuring out the outlines hasn't been implemented yet.

<video controls>
  <source src="{{ "/assets/vid/2024-04-26_selectionops.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Roomcode Removal

The roomcodes feature has been removed. It's been turned off on pub.drawpile.net for months now, so it's unlikely that anyone is actually using it anymore at all. All the feature did was confuse people into thinking that their "private listings" somehow made their session private, which it sure didn't.

You can read more about this [in this article](/devblog/2024/04/17/roomcode-removal.html){:target="_blank"}, it describes the history of the feature and its demise in more detail.

## Process Separation

On Windows and Linux, Drawpile will now spawn new windows in a separate process. This has performance advantages, since the windows don't need to share the same event bus, and also improves stability, since one window crashing won't take others with it. If you need to turn this off for some reason, you can set the `DRAWPILE_SINGLE_PROCESS` environment variable to `1`.

This is not done on macOS because that goes against how applications with multiple windows are supposed to work there… I think. Drawpile goes to some lengths to give a global menu on macOS that applies across multiple windows anyway, separating the processes would cause that to stop working.

It's not done on Android and the browser either because they don't support spawning multiple processes.

## Silicon Apples

GitHub Actions added support for Apple Silicon on theri macOS runners, so Drawpile is available for that now. Check out [the macOS Disk Image for Apple Silicon in the continuous release](https://github.com/drawpile/Drawpile/releases/tag/continuous){:target="_blank"}. If it doesn't work, let me know! I have no way of trying it out myself.

There was also an upgrade to XCode that came with this, which broke support for Qt5. That means the macOS builds are now on Qt6. That means the minimum supported macOS version is now 11, up from… whatever it was before. That is itself over 10 years old now at this point, so hopefully it doesn't matter much in practice. Presumably anyone that wants to use a device for longer than a few years doesn't own a Mac in the first place.

## Minor Additions and Bugfixes

The web browser version is now available in "standalone" form at <https://web.drawpile.net/?standalone=true>. It will let you draw "offline", although it's not really recommended that you do this since your work does not get saved automatically. This was suggested by Bluestrings.

When using the mouse, smoothing and jagged line compensation is turned off by default now, since they're really only designed for tablets and cause interference if you're trying to use the mouse for e.g. precise pixel art. It can be toggled in the preferences though, in case you use your mouse in a broader, pen-like fashion, where you might actually want smoothing and jag compensation on it. This was suggested by nililfin.

Censor tiles now have a lower contrast, making them less eye-searing to look at.
