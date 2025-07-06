---
layout: drawpile_post
title: "Dev Update: Week 26 and 27 of 2025"
date: 2025-07-06 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---

The last two weeks were spent on getting Drawpile ready for the beta release of version 2.3.0. There's still some more things to finish up, but it should be close to done.

## Web Upgrades

The web version of Drawpile now has a version selector, which lets you pick between the stable and beta (well, currently alpha) version. The invite link page has been updated so that it will include the version number in the link, locking in the beta if that's necessary to join the session.

There's also a language selection now, which lets you pick from languages where it seemed to me that the script worked correctly. Chinese, Japanese, Thai and Korean did not work, the characters just turn into a bunch of boxes there, I guess because Qt doesn't ship with the correct fonts. You can override this exclusion by adding a `showbrokenlangs=1` query parameter to the URL, if you want to see a lot of rectangles for some reason.

Lastly, there's now also a tablet tester on the start page that let you quickly test if your browser is detecting pen pressure without having to wait for the entire application to start up. This was contributed by shift-F5 [on GitHub](https://github.com/drawpile/Drawpile/pull/1501){:target="_blank"}.

## Redirects

The Drawpile client now supports getting redirected by the server. This works similarly to HTTP redirects, but with some more frills and control.

How it works is that the client connects to the server and informs it about its intent, which can be one of three things: host a session, join a specific session or join to pick a session from the list. The server can now tell the client to redirect after this step, handing it a URL to connect to. The client will then disconnect and reconnect to the target server. This is allowed up to three hops, afterwards the client just gives up.

Alternatively, the server can tell the client to redirect after they attempt to join a session. However, in that situation they will have already logged in, so they'll have to go do that again at the new server. This is a bit unfortunate, but the only situation where this really comes up is when joining a server without specifying a session in advance, which already has two ways around it: using the browse tab or joining a session via a direct link.

To avoid "rogue" redirects, the client will only continue a redirect if the target server indicates that it actually accepts them, which it can do with the `RIN` ("redirect in") flag. It also take a redirect data object from the source server and hands it to the target server. The intent of this is that the source server can put a signed token into this data and the target server can verify the signature, ensuring that it actually came from somewhere that they want to allow redirects from. A similar system is already used for external authentication.

Redirects can be transparent, in which case invite links will continue to point at the original server, or opaque, where invite links will use the new server's address. In both cases the client will be informed that they've been redirected during login though, in case they care for some reason.

This feature allows implementing a bunch of things that aren't possible currently, such as redirecting users from a TCP endpoint to a WebSocket one; redirecting connections to a server behind a proxy of some sort; redirecting users to different ports based on the hostname; spreading the session load across multiple physical servers and similar such cases.

Currently, this feature is only implemented in the client. The server will, at the time of writing, never create or accept redirects. That will come later – it's not like you'd really be able to make use of it currently, since hardly any clients are out there that support it.

## Minor Additions and Bugfixes

When you attempt to use a HTTP or HTTPS link to join or host a Drawpile session, it now gets fixed up to connect to the underlying host instead. This was reported by Charmandrigo.

On macOS, entering an invalid join URL no longer crashes the application after showing the same error twice. This was reported by Charmandrigo and tested by Axocrat.

You can now assign canvas shortcuts to change the brush opacity and hardness, similar to how it works for the brush size. This was suggested by justanotatest [on GitHub](https://github.com/drawpile/Drawpile/issues/1505){:target="_blank"}.

In the tablet preferences, you can now choose to specify a separate pressure curve for your eraser pen tip, in case that somehow responds differently to pressure. This was suggested by CosmosX007 [on Discord](https://drawpile.net/discord/){:target="_blank"}

On Windows, you can now disable the native file picker dialogs, in case they cause trouble for you. You can also do that on other platforms, but only via the `--no-native-dialogs` command-line flag, since it's likely to lead to you just not being able to open or save files due to sandboxing or similar. This was suggested by CrustStuff [on Discord](https://drawpile.net/discord/){:target="_blank"}.

In small-screen mode, you can now swap the sides of the on-canvas tabs, docks and side toolbar via View → Left-Handed Mode. This was suggested by yoossy [on Discord](https://drawpile.net/discord/){:target="_blank"}.
