---
layout: drawpile_post
title:  "Dev Update: Week 52 of 2023 and 1 of 2024"
date: 2024-01-08 00:00:00 +0100
category: "devblog"
tag: "@askmeaboutloom"
---

Happy new year! The last two weeks have mostly been further development and testing of the browser version of Drawpile. Translation activity also seems to have slowed down by now, so the full release version of 2.2.0 will probably be coming next week.

## Release of 2.2.0

The final version of Drawpile 2.2.0 was waiting for the activity in translation to ebb of, which it has done by now. So the final version of it will probably be built soon.

I'm going to submit that version to Microsoft to try and prevent those annoying SmartScreen messages and other false alarms from appearing when attempting to install it. Not sure how long that takes them or if it has any useful effect, but it's worth a try.

The rollout will probably be staggered because of this. If you were using the 2.2.0 beta, you'll be prompted to upgrade right away, since there's no point sticking with the beta. If you're still on Drawpile 2.1, you won't be prompted to install it just yet until Microsoft has done their thing. You can of course always manually install the new version if you want.

There's also still documentation and other ancillary stuff that needs to be dealt with, which has kind of taken a back seat due to the excitement of the browser version development, so having a bit of extra time to update that won't hurt.

## More Drawpile Web

The browser version of Drawpile has been coming along nicely, with several test sessions running successfully with it and a good number of bugs being fixed along the way. It's also been confirmed to be working on just about any browser at this point, it apparently even works on the iPhone.

It still needs another while before it can be unleashed fully on the public servers, since there's still plenty of caveats and stuff that doesn't yet work completely, but I'll try to get it in a state where it can be made available for some closed testing and for server owners to make use of it.

The way this will probably work is that the client (which is a web page) will be hosted somewhere on drawpile.net. Server owners only need to update their drawpile-srv to get WebSocket support, add the `--websocket-port` argument to its startup and set up a reverse proxy for it, which for most people just means adding a few lines to their nginx config.

While it's of course also possible for server owners to host the client themselves, changes to it are very frequent in the development phase, so it would be really annoying for them to have to deal with having to update it almost every day. And, if they don't keep it updated properly, it'd be really annoying for me to get bug reports for stuff that has already been fixed. It's also nicer for users when the client is in one place, since then the browser will actually remember their settings, rather than having to configure it all over again for every server they want to connect to.

## Minor Additions and Selected Bugfixes

On Android, opening PSD files and importing Drawpile 2.1 animations now works properly. Previously PSD and ORA files used to be grayed out for reasons I can't fathom. Reported by ariqhadiyan [on GitHub](https://github.com/drawpile/Drawpile/issues/1171){:target="_blank"}.

The server will no longer put users into a superposition of being flagged as a moderator, but not actually having moderator permissions, which had some really confusing behavior. Reported by Bluestrings directly.

The delay for changing layer opacity, layer blend modes, onion skins and timeline FPS is now consistenly 250 milliseconds, rather than them all having different delays of half a second or longer. Reported by robotto [on Discord](https://drawpile.net/discord/){:target="_blank"}.
