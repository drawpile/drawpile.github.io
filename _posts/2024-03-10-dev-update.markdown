---
layout: drawpile_post
title: "Dev Update: Week 10 of 2024"
date: 2024-03-10 00:00:00 +0100
category: "devblog"
tag: "@askmeaboutloom"
---

This week has been spent on two things: starting work on a a more performant canvas view and handling sessions that run out of space properly.

## OpenGL Canvas View

Currently, the canvas in Drawpile uses Qt's graphics scene for rendering. This generally makes sense, it's exactly the kind of thing it's meant for: drawing a bunch of objects like the canvas, annotations, laser trails etc. in the proper zoom and rotation and whatnot.

The main problem with it is that it's kinda slow. Except in the browser, where it's *ridiculously* slow. Moving the canvas around feels very choppy. It's also got some weird bugs, such as pixel jitter at certain zoom and rotation levels. Which you can turn off, but on some systems, it has a massive performance impact and makes the whole thing unusably slow.

So I'm working on replacing the implementation with something written directly in OpenGL instead. OpenGL is basically a way to talk to the graphics processor directly. Qt uses OpenGL under the hood anyway, so this doesn't add any new hardware needs, it just skips the middle man.

This is a pretty big task, since the canvas view is (literally) central to Drawpile and has quite a lot of things that need to be rewritten. It also has the chance for bugs to crop up, so on desktop and mobile it will probably be available in parallel with the old implementation for a while until it's thoroughly tested and proven stable.

The performance gains are definitely worth it though. In the video below, you can see a comparison of panning the canvas in the browser. The "old" version using the Qt graphics scene feels choppy and chugs hard, while the "new" version using OpenGL is totally smooth.

<video controls loop>
  <source src="{{ "/assets/vid/2024-03-10_glcanvas.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Proper Size Limit Handling

Sessions that get too large (in the sense of using too much disk/memory space, not canvas size) now get handled more gracefully.

For one, sessions now get an extra MB of emergency space. This is used to continue to store the most important kinds of commands: joins, leaves and becoming operator. Those are the stuff that's required to get a session out of this kind of situation, meaning they will no longer get stuck in a state where you can't reset them anymore. This extra MB of space is enough to join and leave the session many hundreds of thousands of times, so you won't accidentally end up filling it.

Then the server no longer spams the "out of space" message into the chat a bajillion times. Instead, it sends at most one message every 10 seconds. Those messages are alerts now, so if you had your chat closed, it'll pop up to notify you of the issue. The message can also be translated now and actually explains what you need to do to rectify the situation, namely use Session → Reset to shrink the size back down.

Finally, when a session runs out of space, the client now locks the canvas and shows a message in the corner telling you that the session is out of space. Before, it would just let you continue drawing even though none of that actually arrived on the other side, which was pretty confusing.

Reported by Charmandrigo [on GitHub](https://github.com/drawpile/Drawpile/issues/1097){:target="_blank"}.

![Out of space alert and lock message]({{ "/assets/img/2024-03-10_outofspace.webp" | relative_url }})
