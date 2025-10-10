---
layout: drawpile_post
title: "Dev Update: Week 38 and 39 of 2025"
date: 2025-09-29 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---

The last two weeks have seen more work on fast reconnects, server improvements, a bit of chat work and an addition to the animation system.

## Faster Reconnects

Continuing from last week, a few issues with fast reconnects have been fixed. Thanks to Bluestrings, th3beastt666 and probably others (didn't write down names properly, sorry) for reporting.

When reconnecting to a session, it now doesn't ask you for your credentials again. This was suggested by Meru.

It also now properly reconnects when you join via a WebSocket URL or an invite code. Those could get mangled before.

## Server Management

Several improvements have been made for server owners to better manage large sessions.

Archive and size limit settings are now applied immediately, rather than only when a session or server is started. These are not settings that get changed much, which is probably why no one noticed that they didn't apply properly, but still nice to have.

Server owners can now toggle whether a session is archived individually. By default, sessions adhere to the server setting, but you can override this in either direction to e.g. archive a specific session for a project or disable archiving on very large, long-running sessions.

They can also now override the size limit for a single session, if for example you have a large session that needs a higher limit to avoid constant resets.

And it's now possible to set a minimum autoreset threshold, to avoid sessions setting it to a too low value and inundating the server with resets that eat up bandwidth.

Lastly, the web admin UI now no longer interprets numbers input in size fields without a unit as being in bytes, because that's a spectacularly unhelpful unit that's always way too small. It now instead defaults to MB, like it should.

Also, systemd socket activation has been removed. It was used to make the Drawpile server spring to life when someone connected to it and once everyone left it would shut down again. It's a pretty obscure feature that was enabled by default and I think only ever got used accidentally. Apparently hasn't actually worked properly for quite a while, which probably means no one really cares for it (including me), so now it's gone altogether instead of tracking down why it wasn't working.

Most of these were reported and requested by Bluestrings and Liz.

## Binary Transform

There's now a new interpolation option for transforms called "binary". It is an attempt to provide better scaling for artwork with hard edges than nearest-neighbor, which is very chunky, or bilinear, which makes everything blurry.

The algorithm is effectively bilinear scaling with a threshold to decide whether a pixel is opaque or not. For colors, only existing colors are used, it doesn't "invent" new colors like bilinear does, preserving hard edges. This is basically just an algorithm I made up and it seems to work okay, maybe someone more math-inclined could improve it.

For compatibility and to be able to expand it, this mode cuts and pastes the image when using it. This was suggested by TGS.

## Chattiness

The chat now has a "send" button next to the input line. This is mostly useful for devices without a physical keyboard, where it can be annoying or non-obvious how to hit the enter key.

It also now starts out collapsed and only expands itself when you connect to a session, since it's really pretty pointless to have the chat there while you're offline. It also now properly remembers the size it had before you collapsed it, rather than always resetting to the default after being hidden.

## Animation Works

There's some work going on to implement cameras into Drawpile's animation system. This isn't done yet, but the concept is there and could maybe use some feedback.

Cameras are supposed to show up in the timeline, above the tracks. You can only have one camera active at a time, so it would just be a drop-down to select them. If you have no camera selected, the drop-down lives in the formerly useless corner at the top-left of the timeline.

A camera has a starting rectangle that defines where it's looking at to begin with. This rectangle is supposed to be shown on the canvas, along with buttons to play the animation and to hide the camera from the canvas. It's also supposed to let you define a framerate and frame range that is different from the global timeline. This is basically what people tend to do when animating already: draw a rectangle around where their animation is, write a framerate and/or frame range on it if it's different from the global one and tell you to select that area then hit Ctrl+F to view the animation.

Cameras are also supposed to have key frames, which you can assign various different properties to. Most obviously, camera motions: changing the position, rotation and scale of the camera across the timeline. Each key frame property is supposed to have a curve you can set to smoothly interpolate betwen it and the previous key frame (or the initial position of the camera, if there's no prior keyframe.)

There's also supposed to be a tint color and opacity to let you e.g. fade to black or white, as well as some properties for camera shake, since that's pretty easy to implement and saves a bunch of tedious manual shifting of the view.

Oh, and I also added the ability to let you set the framerate to a fractional value, since there's not really a reason for it to be an integer. That was suggested by Meru.

This stuff is technically a compatibility break, but since Drawpile 2.3 is still in its beta phase and most people don't animate with it, I don't think it's worth the effort of changing the protocol version. A warning that if your operator is using an outdated version you may run into trouble should suffice.

Again, feedback on this is appreciated, as would be comparisons with other programs. My ideas are informed by doing scripted camera movements, so I don't actually have a comparison with how other software does it.

![Camera concept]({{ "assets/img/2025-09-28_camera.webp" | relative_url }})

## Minor Additions and Bugfixes

You can now increase and decrease key frame exposure on all visible tracks. The default shortcut for this is Ctrl+Shift+Alt+Plus/Minus.

Redos no longer resurrect drawing commands that were cut off by undoing them and then drawing something else afterwards in some pathological cases. This was reported by Sinamer.

The client now properly checks whether a reset fits into the session size limit. This could previously lead to the server kicking them for misbehavior, now they stay connected and just get an error message.

Layers with IDs beyond 255 can noow be reordered properly. This was reported by Bluesflying.
