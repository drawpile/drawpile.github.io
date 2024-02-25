---
layout: drawpile_post
title: "Dev Update: Week 8 of 2024"
date: 2024-02-25 00:00:00 +0100
category: "devblog"
tag: "@askmeaboutloom"
---

Last week has documenting, bugfixing and twiddling with the servers. There'll probably be another update for pub.drawpile.net next week so that we can allow joining via web browser on it.

For this server stuff, [Drawpile 2.2.2-beta.1 has been released](https://github.com/drawpile/Drawpile/releases/tag/2.2.2-beta.1){:target="_blank"}. It doesn't really have much interesting stuff on the client-side, so it doesn't include new translations and is not announced on the Drawpile website. It's really just so that the community servers can target a specific version.

## Documentation

Several things have been documented.

* There's now an article on [sharing brushes](https://docs.drawpile.net/help/draw/brushsharing){:target="_blank"}.
* The [dedicated server help page](https://docs.drawpile.net/help/server/dedicatedserver){:target="_blank"} has been updated.
* Information about server configuration is now [on its own page](https://docs.drawpile.net/help/server/serverconfig){:target="_blank"}.
* The [WebSocket server setup has a page now too](https://docs.drawpile.net/help/server/websocket){:target="_blank"}, which talks about how to configure a Drawpile server to allow joining via web browser.

## Dual Color Button

Similar to Krita, GIMP and other programs, Drawpile now has a button that shows the current foreground and background color. It's part of the edit toolbar and has four places to click:

* Top-left opens a dialog so you can pick the foreground color.
* Bottom-right is the same thing for the background color.
* Top-right swaps the foreground and background color.
* Bottom-left resets the colors to black and white.

You can assign keyboard shortcuts to all of these actions. Their names can be found by either hovering over them or under Tools > Shortcuts. The default shortcut to swap the foreground and background color is the <kbd>X</kbd> key.

The background color isn't currently used for anything, but it may come to be used for something later, similar to other software. Currently, you can still use it to buffer a color there.

![Invite link page with web browser link]({{ "/assets/img/2024-02-25_dualcolorbutton.webp" | relative_url }})

## Merged Without Background Fill Source

The flood fill tool now has a fill source option "Merged Without Background". It's similar to "Merged Image", except it always uses a transparent canvas background color.

This means that if you're on a canvas with a background color that isn't pure white, you don't have to account for it in the tolerance.

## Certificate Handling

"Real" certificates are now always presented as secure in the client, whereas self-signed ones continue to be considered untrusted unless explicitly dealt with.

Accordingly, in the network settings, "trusted hosts" has been renamed to "certificate pinning", because that's really what it is. You can use it to pin a self-signed certificate to a known good one, since it should never change. Regular certificates should not be pinned, since they change regularly when they get renewed.

## Password-Dependent Web Allowance

The server now has a setting that makes joining a session through the web browser dependent on if a session has a password. That is, sessions with a password automatically allow joining via web browser, sessions without a password don't.

This will probably be the mode used on pub.drawpile.net and possibly also other community servers. It will prevent sessions open to the public from being easily griefed by anyone driving by with a web browser.

The session setting can be overridden by anyone who has permission to do so. Server owners can decide who has this permission and can also toggle it via the admin interface.

## Minor Additions and Selected Bugfixes

Undo is now disabled while you're drawing a brush stroke, preventing weird results where the latter part of the stroke is left without an undo point. Reported by Sinamer [on Discord](https://drawpile.net/discord/){:target="_blank"}.

On macOS, floating docks now stay on top of the main window again. Reported by 6ix [on Discord](https://drawpile.net/discord/){:target="_blank"}.

The bezier curve tool now properly resets the angle of the preview point when removing a point. Previously it would keep the angle and then only reset it once you clicked.

Session listings now properly update the active drawing users and web browser allowance for sessions.
