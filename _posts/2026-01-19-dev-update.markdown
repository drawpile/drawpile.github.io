---
layout: drawpile_post
title: "Dev Update: Week 2 and 3 of 2026"
date: 2026-01-19 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---

The last two weeks have mostly been more work on autosaving and the project file format. The stuff described here is available for testing [in the alpha release](https://github.com/drawpile/Drawpile/releases/tag/continuous){:target="_blank"}.

## Project Files

You can now save to DPPR "project files". These files basically combine the features of DPCS files, which store snapshots of the canvas, with DPREC files, which store demo recordings. That is, they store the commands that are sent and received across the network, not video recordings. These are also the same files that autosaving uses.

When you save to a DPPR file and have autosaving enabled, it will save both a current snapshot and the active autosave recording to the file. If autosave is not active, it just saves a snapshot to it. If you try to save to a DPPR file that already contains a recording, Drawpile will ask whether you want to append to it or replace it.

Currently, opening the file just loads the latest state. But having this combined data allows for a bunch of other stuff that's being worked on, such as getting statistics on how long you spent actively drawing the picture, generating a timelapse from it or restoring the canvas at any past state.

Drawpile doesn't yet try to deduplicate the recordings in any way, so the files end up larger than they need to be. For example, if you open a DPPR file and then save to it, it will unnecessarily store a "starting snapshot" from the beginning of the current session, even though that's unnecessary when it could just continue from the previous session. The same goes for reconnecting to online sessions, it will just save another session instead of continuing a prior one. That's something I'll probably try to solve once playback and timelapses are implemented though, since then it'll be easier to test if removing those snapshots works properly and what extra information may be needed to connect them up properly.

In that regard, under Tools → Developer Tools → Project Information, there's now a dialog for inspecting the structure of DPPR files. It shows mostly techy information, a proper user-facing project dialog with options to look at statistic, make timelapses and whatever else might follow is in the works.

## Minor Additions and Bugfixes

The autosave recovery page in the start dialog now shows your own work time next to the files, to let you tell which ones are relevant if there's multiple similar ones.

Drawpile now asks you whether you want to overwrite a file *after* potentially changing the extension. Previously, when you e.g. saved a PNG or PSD file, it asked you if you want to overwrite it first and then afterwards asked you whether you want to save as ORA or DPCS instead, which would then overwrite that file unquestioned if it already existed. Now it does it the other way round.

On Android, there's now a workaround for the stylus on Xiaomi devices misreporting historical positions and causing jagged curves because of it. Basically, instead of *actually* reporting the positions the pen moved along between input frames, it just connects the "real" positions with a straight line and no pressure interpolation at all. The workaround just ignores those intermediate positions and lets Drawpile's jagged curve compensation pick up the slack. This can be toggled in the tablet preferences, is enabled by default if the device is detected to be a Xiaomi one and is also going to be in the next version of Krita.

Also on Xiaomi devices, there's a workaround to translate page up and down keys to right and middle clicks. This is because their stylus inexplicably inputs those keyboard keys when you press the buttons on the side. Same deal with the workaround above.

And again on Xiaomi devices, the pressure curve is now steeper by default, capping at 70% to reach maximum output pressure. This is because I found it to be physically virtually impossible to press hard enough to reach 100% input pressure otherwise. This pressure curve, along with a preset for Apple styluses that caps out at 50% and an "anti-strain" option, is available in the global pressure curve preference now.
