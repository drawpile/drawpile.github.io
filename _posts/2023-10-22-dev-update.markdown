---
layout: drawpile_post
title:  "Dev Update: Week 42 of 2023"
date: 2023-10-22 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---

More server-side improvements this week that should help running perpetually persistent sessions easier. But there's also been some improvements client-side and a whole pile of bugfixes.

As always, anything you see here is available right now [in the development release](https://github.com/drawpile/Drawpile/releases/tag/continuous){:target="_blank"} right now.

## Notification Cleanup

Drawpile's notifications were kind of a mess. Some made sounds, some caused popups in the corner and some made the entry in the taskbar change color (or similar, depending on your system.)

This has been cleaned up, so they now all work the same. Under Edit → Preferences → Notifications, you can decide which ones make noise, which ones cause popups and which ones change the taskbar color. There's new notification categories for private messages and getting disconnected unexpectedly, since those are pretty important events.

When you connect to a session, you no longer get inundated with a cacophony of notifications during catchup, instead you only get one once you're caught up. You also no longer get useless popups like "Connecting…" while you're joining a session, since you don't need to be notified of something you're actively doing.

Finally, you can enable Drawpile notifying you of mentions of your name as well as any trigger words you choose as if they were a private message, allowing you to turn off the general chat noises, but still get pinged for stuff regarding you.

Various aspects of this were suggested and reported by MagicaJaphet [in a GitHub issue](https://github.com/drawpile/Drawpile/issues/1033){:target="_blank"}, leandro2222 [in another](https://github.com/drawpile/Drawpile/issues/1128){:target="_blank"}, Blozzom and Bluestrings [on Discord](https://discord.gg/M3yyMpC){:target="_blank"}.

![Notification settings in Drawpile]({{ "/assets/img/2023-10-22_notifications.webp" | relative_url }})

## Sound Effect Replacement

Another thing with the notifications: the sound effects were *terrifying*. I've gotten startled plenty of times by a sudden door slam while concentrating on a drawing.

So the sound effects have been replaced with ones [from KDE's Ocean Sound Theme](https://github.com/KDE/ocean-sound-theme){:target="_blank"}, which are much less jarring.

If you don't like these sounds, you can use your own instead. See [here on how to costumize sounds]({% link help/tech/customassets.markdown %}){:target="_blank"}. If you want to use the old sound effects, those are [over here](https://github.com/drawpile/Drawpile/tree/stable-2.1/desktop/sounds){:target="_blank"}.

## Export Image Option

You can now use File → Export Image… to save an image without changing it to be your current file. That is, it won't try to use this file when you use File → Save the next time. It also won't show you the warning dialog about saving as ORA instead.

So you probably want to use this option when you want to save out PNG, JPG or PSD files. You can still use File → Save As… like before, nothing changed about that, the new option just needs fewer extra steps.

## Idle Timeout Info and Override

If the server has an idle timeout for sessions, you can now see this at the bottom of the Session → Settings… dialog. This tells you how long it takes for the server to shut down the session if nothing is happening in it.

Moderators can also disable this timeout for select sessions if the server owner allows it. This way, you can run both perpetual and short-lived sessions on the same server.

<div class="notification">
    <span class="fa fa-circle-info"></span> This is only available if the server is updated. At the time of writing, most servers aren't yet.
</div>

## Session Ban Export

It is now possible to export and import bans from a session if the server allows it, using the buttons under Session → Settings… → Bans. This way, you can restore your ban list after stopping and re-hosting a session. Importing bans won't overwrite the existing list, it will only add new ones.

The bans are encrypted with a key that only the server knows. That means you can only import the bans into the same server they were exported from. Server owners need to generate that key using `drawpile-srv --generate-crypt-key` and then pass that key using the `--crypt-key` parameter.

Moderators can export bans without encryption, since they can see all of the extra information anyway. This can be imported into any server, so if you need to port your ban list from one server to another, a mod may be able to help you.

This was suggested by tincancrab [in a GitHub issue](https://github.com/drawpile/Drawpile/issues/844).

<div class="notification">
    <span class="fa fa-circle-info"></span> This is only available if the server is updated. At the time of writing, most servers aren't yet.
</div>

![Drawpile session bans dialog]({{ "/assets/img/2023-10-22_bans.webp" | relative_url }})

## Session Roles Tab

There's a new tab under Session → Settings… called "Roles". It shows operators all registered users known to the session along with their operator and trusted status, even when they're not online.

Using the checkboxes at the bottom-right, you can op/deop and trust/untrust users. So if someone left before you could give or take their permissions, you can do that here now.

With the import and export buttons at the bottom, you can save and restore this list. Unlike the ban exports above, this doesn't contain any sensitive information, so there's no extra server configuration necessary. As with bans above, importing roles doesn't overwrite existing stuff, it only adds to it.

This was also suggested by tincancrab [in the same GitHub issue](https://github.com/drawpile/Drawpile/issues/844).

<div class="notification">
    <span class="fa fa-circle-info"></span> This is only available if the server is updated. At the time of writing, most servers aren't yet.
</div>

![Drawpile session roles dialog]({{ "/assets/img/2023-10-22_roles.webp" | relative_url }})

## Minor Additions and Selected Bugfixes

Some stuff was fixed about PSD saving, hopefully increasing compatibility with other software. GIMP for one no longer hates the PSD files Drawpile produces.

Playback of sound effects now uses a different mechanism, which should hopefully solve the chugging, dropouts and wrong audio device issues that some systems had. Reported by Blozzom and Snover.

The animation flipbook window will no longer throw itself off-screen on Windows if your monitor configuration changed since last using it. This was reported by Ausjamcian directly.

Closed some loopholes through which it was possible to ban yourself from a session.

Your own laser pointer no longer gets delayed by the network smoothing. Reported by matt in a session.

While using the laser pointer, your own user marker will show up again on the canvas, like it did in Drawpile 2.1.

Your avatar will now be restored when you rejoin a session using the "reconnect" button that shows up after an unexpected disconnect, rather than leaving it blank.

ORA files saved from Drawpile will now properly retain their alpha preserve (also known as "inherit alpha" or sometimes "clipping") when opening them in Krita 5.2.1 and newer. They've accepted the solution proposed [in this previous post about the topic]({% post_url 2023-08-24-ora-alpha-preserve %}){:target="_blank"}.
