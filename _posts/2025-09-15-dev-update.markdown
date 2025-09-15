---
layout: drawpile_post
title: "Dev Update: Week 36 and 37 of 2025"
date: 2025-09-15 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---

The last two weeks were very busy, but there have been some macOS-related things and a new feature: fast reconnects.

## Fast Reconnects

Drawpile will now remember the state of the canvas history and permissions when you get disconnected. When you reconnect to the session and the canvas hasn't been reset or compressed in the meantime, the state will be restored and catchup will skip ahead to that point. This makes reconnects significantly faster and uses less bandwidth on both sides.

Since this can only work in the same process, Drawpile will now ask whether you want to save or discard the current canvas. You can also opt to open a new window on desktop systems, which will work as before. It may also be possible to e.g. serialize this information to disk and give you a fast reconnect across different processes, but I kind of doubt that this is useful in the most common case of the Android or browser version disconnecting because it got sent to sleep.

If you want to help find issues with this, consider enabling logging via Edit → Preferences, in the Files tab and checking "Write debugging log to file". You can later view the log file via Help → Log File and search for a message that starts with "Unexpected history position". Ideally, there should be none of those messages.

This feature requires the server to be updated. At the time of writing, most aren't yet, so you can't make use of this feature there.

## Mac Stuff

On macOS, there's now a new setting under Edit → Preferences, in the User Interface tab to "Quit when last window is closed". By default, Drawpile will keep running in the background when you close the last window like most macOS applications do, but if you find that as annoying as I do, you can turn that off via this option now.

The touchpad on Macbooks should now no longer simultaneously emit clicks and touch presses when operating it with one finger. Previously, this could cause the color picker to get summoned when moving the cursor around or panning the canvas. This was reported by Scruff.

## Minor Additions and Bugfixes

Session permission and limit settings are now properly disabled when you're not an operator. In compatibility mode, settings and permissions that don't exist in Drawpile 2.2 aren't shown anymore.

Changing key frame visibilities now works properly in compatibility mode.
