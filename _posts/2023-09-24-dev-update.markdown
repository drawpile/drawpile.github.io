---
layout: drawpile_post
title:  "Dev Update: Week 38 of 2023"
date: 2023-09-24 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---

This week has been work on the server-side of things. Among other things, this brings back the "host on this computer" option.

As always, this stuff is available [in the continuous development release](https://github.com/drawpile/Drawpile/releases/tag/continuous) right now.

## Dedicated Server

The dedicated server drawpile-srv is now updated to use the Drawpile 2.2 network protocol internally. Previously, it was still on the 2.1 code.

This doesn't actually change much on the outside, since the parts of the protocol that the server uses didn't change between 2.1 and 2.2, but it means that a lot of old code is now deleted and no longer clogs up the place.

The only difference I can think of is if you're running your own dedicated server and make use of session templates in dptxt format. Those aren't compatible and have to be updated to the 2.2 protocol. There'll probably be some kind of command-line tool for this later.

## Builtin Server

Since the server side is on the same code as the client now, you can "host on this computer" again.

This should work exactly like it used to. That is, the server runs inside of Drawpile itself. When you leave it or close the application, the session will end. Unlike with the dedicated server, there's no periodic session resets to compress the history. Instead, when a new user joins, the session does a soft reset, which cuts off undos and redos, and sends the current state of the canvas to the new user.

The builtin server is not available on Android. It could theoretically run, but Android likes to suspend applications and kill network connections to save battery even when Drawpile tells it not to, so disabling it is the less painful path.

<a name="builtinserverscreenshot"></a>![Host on this computer option in Drawpile]({{ "/assets/img/2023-09-24_builtinserver.webp" | relative_url }})

## Ffmpeg Path Pickage

When playing back recordings, you can record them to videos with ffmpeg. That works fine on Linux and macOS because they are sensible operating systems, you just install ffmpeg and Drawpile can just use it. Windows doesn't work like that.

So now you can tell Drawpile where to find the ffmpeg executable. If you don't, Drawpile will tell you where you can download it for Windows. On macOS and Linux, it will tell you to install it through Homebrew and your package manager respectively.

This is kind of an annoying hoop to jump through though, so Drawpile should probably just come with a copy of ffmpeg to begin with, rather than making you download it manually. But that's Windows development, so it'll have to wait until I'm in the mood for flagellation. Oh yeah, and on Android ffmpeg doesn't run, so video export isn't available there.

![Ffmpeg path in the Drawpile video export dialog]({{ "/assets/img/2023-09-24_videoexport.webp" | relative_url }})

## Minor Additions and Selected Bugfixes

As you can see [in the screenshot above](#builtinserverscreenshot), the *ID Alias* and *List at* options on the host page are now banished underneath an *Enable advanced options* checkbox, since they keep causing confusion. Putting them there should hopefully make it clear that you don't need to fill them out and only mess with them if you know what they do.

In the MediBang-esque layout, the brushes are now in the correct place. I'd interpreted a screenshot incorrectly, the correction came from xxxx.

ORA files now save layers with Divide, Subtract and Erase blend modes in a way that's compatible with Krita.
