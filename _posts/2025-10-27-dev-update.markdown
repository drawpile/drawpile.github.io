---
layout: drawpile_post
title: "Dev Update: Week 42 and 43 of 2025"
date: 2025-10-27 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---

In the last two weeks, some new user interface features have been introduced and Drawpile 2.3.0-beta.4 has been released. Unless any major issues are found, this will get released soon, since the latest Android and macOS versions require it.

## Hardware Renderer Performance Fix

A new feature for the hardware renderer had been added to make zooming look better. That worked fine on most systems, but on some it introduced a lot of slowdown.

It has now been made a setting and disabled by default. This was reported by Bluestrings and Sinamer [on Discord](https://drawpile.net/discord/){:target="_blank"}.

## Selection Action Bar

When you make a selection, a bar will now appear on the canvas, by default in the bottom-left corner. On one hand, this is meant to let you tell that a selection is active so that it doesn't end up off-screen and there's no indication why you can't draw anything.

Another reason is to give you access to common selection actions, deselection in particular. That way you no longer need to switch to the selection tool to remove a selection when you don't have a keyboard available.

When you're transforming an image, transform actions are shown here instead, since you can't really manipulate a selection during that.

The bar can be relocated to a different spot on the canvas or disabled altogether. It was suggested by CosmosX007 and Geese.

<video controls>
  <source src="{{ "/assets/vid/help/selectionactionbar.mp4" | relative_url }}" type="video/mp4"/>
</video>

## On-Canvas Noticing

When the canvas is locked, the lock notices in the top-right corner will now provide buttons to let you get out of the lock if appropriate. For example, if you're an operator and the canvas is locked, there'll be a button to unlock it. Or when you're using the gradient tool that requires a selection to operate in, it will give you buttons to select everything or the current layer bounds.

There will also be notices when you're in layer or group view mode, with a button to get out of them. These are usually modes that you only stay in temporarily, so I think it makes sense to have a way to exit them again quickly readily available. If you don't like this, you can also disable them via the menu on the notice itself.

Frame view mode will only prompt you to exit it if you select a layer that isn't visible in the current frame, since this *is* a mode you stay in for a long time.

This was suggested by Geese and Phoneme.

<video controls>
  <source src="{{ "/assets/vid/help/lockstatus.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Automatic Frame Mode Switching

When you fiddle with the animation timeline to a sufficient degree, Drawpile will now automatically switch to frame view mode for you. This basically saves having to press the button at the top of the timeline every time, since anything you're doing on there really only makes sense in frame view mode.

The reason this didn't happen before is that we didn't want people to get stuck in frame view mode and not know how to get out of it. However, since it now shows the notices mentioned above when you select a layer outside of the animation, that shouldn't leave anyone stuck for too long.

## Lasso Select Stabilizer

You can now use the stabilizer and smoothing on lasso selects, just like you can on lasso fills. Note that to get smooth edges, you also need to turn on anti-aliasing.

<video controls>
  <source src="{{ "/assets/vid/2025-10-27_lassostabilizer.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Minor Additions and Bugfixes

Drawpile will no longer hang when switching tools while smudging. This was reported by and found with the help of D'mitry [on Discord](https://drawpile.net/discord/){:target="_blank"}.

You can now detach the chat in different ways: as a regular window, on top of Drawpile's window or on top of everything. This is available on desktop operating systems only and may not work on all configurations of Linux window managers and such. This was suggested by Blozzom and Bluestrings [on Discord](https://drawpile.net/discord/){:target="_blank"}.

Default layers are now properly restored when reconnecting and should actually do what they're supposed to. This was reported by Bluestrings.

There's now a new crop to selection action in the selection menu. This is really the same as the resize canvas action, it's just here so that people who are looking for cropping specifically can find it.

The transform tool will no longer remember the sampling mode across restarts, since it's too easy to mess up your art with it accidentally when you still have it set to Nearest or Binary and aren't zoomed in enough to notice that it's making everything look scraggly.

Setting the hue slider to 359 in the HSL color space no longer makes the color turn gray. This was reported by BornIncompetence [on Discord](https://drawpile.net/discord/){:target="_blank"}.
