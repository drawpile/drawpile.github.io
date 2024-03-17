---
layout: drawpile_post
title: "Dev Update: Week 11 of 2024"
date: 2024-03-17 00:00:00 +0100
category: "devblog"
tag: "@askmeaboutloom"
---

This week has mostly been working on the faster OpenGL canvas view, but there's also some new features and fixes.

## OpenGL Canvas View

Work is still ongoing on this from last week. More stuff is implemented into it, but it's still not ready for use.

It's also now possible to switch between the old QGraphicsView-based renderer and the new OpenGL-based one. The new canvas view will be integrated into Drawpile as an experimental feature so that folks can test it, then once it's stable enough, it'll become the default.

## Fill Source Buttons

The fill tool's source is no longer just a single dropdown that gets unwieldy when there's a lot of layers, instead it's a set of three buttons and the dropdown is only used for picking which layer you want to use. Which you can also do instead by just right-clicking on a layer and setting it as the fill source, which is more convenient on canvases with a lot of layers.

This was suggested by Blozzom [on Discord](https://drawpile.net/discord/){:target="_blank"}.

![Fill source buttons]({{ "/assets/img/2024-03-17_fillbuttons.webp" | relative_url }})

## Annotation Aliasing

Annotation rendering can now be switched between Vector, Smooth and Pixel. Vector is the old way, where annotations are vector objects. Smooth shows the annotation the way it would look like if you merged it into the canvas (or at least something pretty close to that.) Pixel uses aliased text, which also looks (mostly) the same when you merge it. This was brought up by cvrsoiioo4 [on Discord](https://drawpile.net/discord/){:target="_blank"}.

This is a feature that will come in Drawpile 2.3.0, since it would cause desync with 2.2.x.

<video controls>
  <source src="{{ "/assets/vid/2024-03-17_annotationrender.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Lightness/Darkness to Alpha

There's new options under Edit that let you turn lightness or darkness of what you selected to transparency. I am told this is useful for certain shading techniques, where you "mask" off stuff using grayscale and then use Recolor over it. This was suggested by Ben directly.

Also a feature that will come in Drawpile 2.3.0.

![Selection lightness to alpha]({{ "/assets/img/2024-03-17_lightnesstoalpha.webp" | relative_url }})

![Selection darkness to alpha]({{ "/assets/img/2024-03-17_darknesstoalpha.webp" | relative_url }})

## Lightness/Darkness Mask Blend Modes

This is something that falls out of the feature above: blend modes that erase according to lightness or darkness of a layer. This is similar what other programs use for their transparency masks, so this may be useful if you're copying one of those over into Drawpile.

Obviously you wouldn't use this to erase the canvas background in most cases like in the screenshots below, you'd stick it into a layer group instead.

Again, feature for Drawpile 2.3.0.

![Erase lightness and darkness]({{ "/assets/img/2024-03-17_eraselightdarkness.webp" | relative_url }})

## Telefragging

Registered users will now kick their old self when they rejoin a session that they're already in - or, more likely, that the server *thinks* they're already in, but actually their internet has flaked out and they had to reconnect. So now they will be able to do that immediately, rather than being told that their name is already in use and having to wait until their ghost gets timed out or kicked manually.

This only applies to users with an account. If you join without an account, you don't get this feature, to prevent someone else from using your name to kick you out of the session. It's also not possible for someone to register your name behind your back and kick you out that way.

This was suggested by Crow directly.

## Minor Additions and Bugfixes

The transparency checkerboard is now a bit easier on the eyes. Suggested by Crow directly.

Vertical alignment for annotations is now saved and loaded to and from ORA files properly. Before, they would always end up using top alignment.
