---
layout: drawpile_post
title: "Dev Update: Week 40 and 41 of 2025"
date: 2025-10-13 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---

The last two weeks have seen much bugfixing, user interface improvements, animation conveniences and a major change in how Drawpile connects to servers.

Translations for the next release are also now [open on Weblate](https://hosted.weblate.org/engage/drawpile/){:target="_blank"}. Since the latest Android and macOS releases have broken some stuff and are forcing an update, this might just be the last beta release before the final.

## User Interfacing

Sliders in Drawpile no longer block keyboard shortcuts that don't have an effect on them. That is, typing in numbers or hitting return will still affect the slider if you have it in focus, but pressing other buttons will actually invoke the shortcut, rather than just sit there and do nothing. Also, hitting escape when you're not editing the slider will unfocus it so that you can the number shortcuts again as well. This was reported by incoheart [on GitHub](https://github.com/drawpile/Drawpile/issues/1390){:target="_blank"}.

The sliders also no longer enter edit mode when you press and hold on them. This was a really obscure feature that I think people only ever activated accidentally. Since the sliders no longer have to wait and guess whether you are trying to move it slightly or long-press them, they will also now react faster. Editing sliders has been moved to double-click instead, which before did nothing. Right-clicking them also edits them, like it did before. This was suggested by Blozzom [on Discord](https://drawpile.net/discord/){:target="_blank"}. This has also been contributed to Krita (which is where the sliders come from), so the next version of that will have these improvements as well.

There's also now a feature to summon context menus by long-pressing on appropriate elements. This can be toggled in the user interface preferences, on Android and the browser it's on by default, everywhere else it's off. If you have a pen without a right-click function, you may want to enable it. This doesn't work *too* ideally yet, since long-pressing on an element with kinetic scrolling enabled adds a really long delay and Android will still prompt you to "select all" or show a text cursor or similar, but that will probably be fixed eventually. This came out of Krita bug reports [by tiar](https://bugs.kde.org/show_bug.cgi?id=506042){:target="_blank"} and [Nanofu](https://bugs.kde.org/show_bug.cgi?id=510229){:target="_blank"} and has been contributed back there, it was just faster to implement it in Drawpile first, since it doesn't take as long to build and start up.

## Timeline Loosening

There's been several smaller adjustments to the timeline to hopefully make things more obvious and require less clicks to accomplish common tasks.

The timeline now no longer cuts off at the last frame, it instead extends automatically as you change the frame range. The flipbook button has been moved to the top-left corner and now says "Play". The frame count and FPS adjustments have been put into a single button at the top-right.

You can change the frame range by dragging the handles in the frame numbers row. Alternatively, you can double-click the row, click on the FPS button at the top-right or use the Animation menu at the top to get a dialog where you can adjust the frame rate, first frame and last frame by entering the numbers directly.

Framerates and the flipbook speed slider now support fractional values. This was suggested by Meru [on Discord](https://drawpile.net/discord/){:target="_blank"}.

You can now double-click on an unassigned frames to create a key frame there, rather than having to hunt for the button at the top. This was sort of suggested by Greendyno [on Discord](https://drawpile.net/discord/){:target="_blank"}.

Clicking on a blank key frame (i.e. one that is explicitly assigned to nothing, not an unassigned frame) will now select no layers to avoid accidentally drawing on the wrong one. This was sort of suggested by Pumpkin directly.

Empty documents now start out with a single, empty timeline track on them. This really just makes sense, just like starting with a single, empty layer does, since it's not like you can do much with a blank timeline other than create a track on it. This isn't a problem with regards to performance or space. An empty timeline track takes only around 64 bytes (0.00006 MB), about as much as a single pixel on a layer, and doesn't have any data to be processed.

Some of these aren't *totally* compatible with the previous 2.3.0 betas, but the incompatibilities are pretty minor, at most you lose the fraction on your framerate or have to set the frame range again. So not a big enough deal to block people on older versions from joining.

<video controls>
  <source src="{{ "/assets/vid/2025-10-13_timeline.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Connection Changes

Drawpile will now prefer connecting to servers via WebSockets, falling back to raw TCP if it can't make a connection, gets a non-OK response, doesn't get a proper initial login message from the server or takes too long to connect (currently the timeout is hard-coded to 5 seconds.) It will only do this for "real" domains, if you enter an IP address or connect to localhost, it will use TCP immediately.

The reason for this change is compatibility. Several networks block raw TCP connections or treat them badly, causing disconnects or strange errors. There's also a lot of tools, like tunnels or proxies, that don't work with raw TCP. It's also significantly easier to set up encrypted connections with them, since it just integrates with normal webservers like nginx or Caddy.

If necessary, the Join, Browse and Host pages of the start dialog now have a button at the bottom-right that lets you choose whether to connect via WebSockets or TCP. Adding a `w` query parameter to force a WebSocket connection no longer has much of an effect, but it will cause Drawpile to attempt a WebSocket connection to an IP address or localhost as well.

The network status widget at the bottom-right also now shows you with which socket type you are connected, where previously there wasn't really a way to figure this out. It shows "(ws)" for WebSockets and "(tcp)" for TCP sockets. The "connecting" and "connected to" prefixes have been removed to avoid the text taking up extra space in the bottom bar. Those weren't necessary anyway, if there's an ellipsis, you're connecting, if not then you're connected.

I thought about also adding a preference to toggle the automatic WebSocket behavior, but decided against it because it would be too confusing when server owners start using tunnels or proxies. Users would change the preference today and see no effect, then over time they would be unable to connect to more and more servers because they all start expecting clients to use WebSockets.

On the other hand, if you own a server and for some reason don't want users to connect via WebSockets from the desktop and mobile client, you can disallow connections that come in with an empty Origin header. Web browsers will always set this header, the desktop and mobile clients never do. Or, if you don't care to allow people to join via the browser client, just turn off WebSockets in drawpile-srv altogether and don't set up a reverse proxy in your web server.

![Socket selection]({{ "assets/img/2025-10-13_sockets.webp" | relative_url }})

## Forward Compatibility

Going forward, you'll be able to join sessions even if their protocol has minor incompatibilities. This isn't relevant now, but may be so in the future.

A "minor incompatibility" basically means that it's something that is added to the protocol, but doesn't break existing stuff. For example, a new blend mode is such a case. Obviously you won't be able to actually *see* these new things if you're using an outdated version of Drawpile, but most of the canvas will probably still look okay-ish, so letting you limp along is less frustrating than just not letting you join at all.

On the other hand, it means that your canvas will likely desynchronize. This is okay as long as it's only your problem on an old version of Drawpile. However, if you reset or compress the canvas, it would use that desynchronized state, meaning it would become everyone else's problem as well. The solution is pretty simple though: users on outdated versions simply can't perform canvas compressions or resets.

When you join a session on an outdated client, you will get a dialog warning you about it. The join message in chat will also warn others in the session that you're on an old version, your name will be in italics and the user list will show you as "outdated". That should hopefully give enough of a clue about any issues arising from older clients, like being unable to see the stuff others are doing.

## Minor Additions and Bugfixes

The zoom steps when using the mouse wheel or keyboard shortcuts have been adjusted slightly and the hardware renderer has been given mupmap support, resulting in higher-quality zoomed-out images. This was contributed by cromachina [on GitHub](https://github.com/drawpile/Drawpile/pull/1527){:target="_blank"}.

The drawpile-cmd command-line tool now actually writes to stdout when you pass `-` as the output file. It previously only claimed that it supported this in its help message, but didn't actually. This was reported by incoheart [on GitHub](https://github.com/drawpile/Drawpile/issues/1526){:target="_blank"}.


