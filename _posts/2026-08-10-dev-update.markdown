---
layout: drawpile_post
title: "Dev Update: Week 30 to 32 of 2026"
date: 2026-08-10 00:00:00 +0100
category: "devblog"
tag: "@askmeaboutloom"
---

Things are finally a bit less busy now, so things are picking up again. Project playback is implemented, more is coming.

After the stuff that's still to do mentioned here is done, there'll probably be a release of the next beta. There isn't much left to do afterwards I think, although having some way to combine multiple project files is probably important enough that it should be available in 2.3.1.

## Project Playback

Playback of dppr files works now. It is accessible via File → Open Player.

You can play and pause, change the playback speed, skip backward and forward through sessions, skip forward by one "stroke" and skip to any point along the way. There's no separate "indexing" process needed to jump around in the recording like it used to be, the player automatically makes snapshots to jump to along the way. Depending on the speed of your device and the canvas you're interacting with, skipping to arbitrary points may not be instantaneous, but the way it's set up seems like like a fine enough trade-off between space and speed.

Playing back dprec and dptxt files also use the same system now, the files get translated automatically. The old playback dialog, its index files and related stuff have been removed, which allowed getting rid of a lot of playback-specific code. The new code should be easier to maintain, since it's the same functionality as is used for autorecovery and timelapses.

There's still some stuff missing that will probably get implemented soon: synchronizing the local view (layer visibilities and such), warning you when you made a change to the canvas that will be overwritten if you continue playback and not leaving you without autorecovery after closing the player window. Other stuff previously talked about, like choosing crop areas and similar, will probably not be in 2.3.1 yet, since it's a bit of a larger topic to integrate that.

<video controls>
  <source src="{{ "/assets/vid/2026-08-10_projectplayback.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Android Updates

This week will probably be spent on updating the Android application to Android 15. Drawpile doesn't really need this, but Google pointlessly forces all applications to target the latest version. This should *not* cause any incompatibilities with older devices, it just makes it compatible with *newer* devices that will otherwise refuse to run the application under the pretense of "security".

The problem with this Android version is that it enforces "edge to edge". What this means is that the operating system no longer takes care of showing the application inside of a usable screen area, it will instead put parts of it behind system bars or underneath the camera inset. The solution for that in Drawpile (and Krita) will probably just be to manually add those borders back.

So in the end, nothing is gained, it's just a vendor-enforced waste of time.

## Minor Additions and Bugfixes

Invite links with spaces, hashes and ampersands in the password should now encode better. Previously, they could end up in a state where automatic link recognizers would not notice them or similar. This was reported by Bluestrings.

You can now toggle the tablet workaround that ignores zero-pressure inputs. This is still turned on by default, but some devices report zero pressure even though the stylus is down "legitimately".

The "smudge transparency" value in plain brush previews is now disabled. It could cause some brushes to not display at all, now they show up, although not in a way where the effect is immediately clear. This was reported by Blozzom [on Discord](https://drawpile.net/discord/){:target="_blank"}.
