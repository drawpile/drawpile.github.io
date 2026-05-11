---
layout: drawpile_post
title: "Dev Update: Week 18 and 19 of 2026"
date: 2026-05-11 00:00:00 +0100
category: "devblog"
tag: "@askmeaboutloom"
---

The last two weeks have been mostly spent fixing bugs for the Drawpile 2.3.1-beta.1 release. I'll try to get that released this week, but there's still announcements to write up and such.

Drawpile's git repositories have also been mirrored to Codeberg now at <https://codeberg.org/Drawpile>. You can create issues and pull requests there if you wish, but it's just another place for it, rather than putting everything into only GitHub that has been going down a lot in recent times. I'll probably also look into having the Drawpile organization join the Codeberg e.V., since they are also an organization "for the public good" in Germany.

## Autoresume

On Android, Drawpile will now automatically resume the last autorecovery file. This is because Android likes to silently terminate applications while they're in the background, giving you no way to decide whether you want to save or discard the current file. This resumption only happens if there's only one candidate and resumption is only attempted once to avoid getting into a crash loop where the file being resumed runs your device out of memory or something.

If you don't want a file to get resumed, close Drawpile cleanly via File → Quit or by pressing the back button. Or disable autorecovery I guess, then there won't be anything to resume either.

## Initial Layer Selection Correction

If you don't set a default layer in a session, Drawpile will now pick the bottom-most visible non-group layer. This is a much more predictable behavior than what it did previously, which was to select the newest layer. This would often enough land you on someone else's shading layer or something.

Of course an even more predictable behavior is to explicitly set a default layer in your session instead, which works as before. Well, except now you can also now properly *unset* the default layer again. Previously it would just balk about an invalid layer id.

## Sessionlessness

Server owners can now configure a time limit for how long users are allowed to loiter outside of sessions using the `sessionLessClientLingerTime` server setting. The most common case for this is before they join or host a session, but it can also happen after their session ends and they haven't disconnected yet because their network is slow or something. By default, this setting is disabled, as it was before.

The web admin UI has been [updated to version 0.14.0](https://github.com/drawpile/dpwebadmin/releases/tag/0.14.0){:target="_blank"} in this regard. It also now shows since when a user doesn't have a session in the users page and notes that any settings that relate to time spans are in seconds unless another unit is specified.

Relatedly, the bug where sometimes users would not get notified that their session got terminated and seemingly remained connected should be fixed now.

## Minor Additions and Bugfixes

Properly preview lines, curves etc. when using a brush with smudging. This was reported by retarj\_o\_burro [on Discord](https://drawpile.net/discord/){:target="_blank"}.

When reconnecting to a session, the previous save file name is remembered now. This is especially relevant on Android, where the OS doesn't let you overwrite existing files. This was reported by tiar.

Provide a better default file name instead of just "Untitled". It will have the current date and session title if you were connected to one. This was suggested by tiar.

The automatic switch to frame view mode when you interact with the timeline now works even if the timeline is not in a tabbed dock. Previously the absence of a tab would cause the timeline to incorrectly be recognized as hidden.

Fixed an issue on some Android devices where you would get disconnected from the session on the first attempt. This seems to have been some bug where Qt's WebSocket handling would stumble over itself if handling a single message took long enough for it to receive more data asynchronously or something. Just queuing up the handling seems to have fixed it, the same kind of thing is done in the web browser where the asynchronousity of WebSockets could cause a different kind of overlapping mayhem. This was reported by Bluestrings.

The strokes preview in the brushes dock now limits the size of the brush to avoid them from turning into single-colored rectangles, which aren't useful for spotting the brush you're looking for. The preview in the tool dock still works as before, since it doesn't have the concern of wanting to find a brush by sight. This was suggested by tiar.

The text in the brushes dock is also now the proper size on Android. Previously it ended up with a much larger size than the rest of the application for some reason. This was reported by tiar.

Fixed some cases where you could end up with the Session → Host action and the Host page in the start dialog to stay disabled even though you weren't connected to a session. This was reported by tiar.

Autorecovery and dppr files now sort of work in the browser version of Drawpile. Still, it is disabled by default, since the files can't actually be stored on disk in the browser and are likely to fill up memory instead.
