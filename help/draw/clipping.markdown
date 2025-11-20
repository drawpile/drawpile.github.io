---
layout: drawpile_help
title:  "Alpha Preserve, Clipping Groups, Masks, Alpha Lock"
description: "How alpha perservation, clipping, masks and locking work Drawpile."
date: 2023-09-17 00:00:00 +0200
category: "help"
tag: help draw
---

Various drawing programs have different ways of handling clipping, alpha inheritance, alpha preserving and alpha locking. Drawpile tries to support all of them.

## Layer Clipping

Drawpile calls this "clip to layer below", other programs sometimes call it "clipping" or "clipping groups". This works like it does in e.g. SAI, CSP, Procreate or Photoshop.

You can activate it using the top-left button in the layers dock. It will make it so that the layer with clipping enabled only affects the opaque parts of the layer or group below it. If you enable clipping on multiple layers in sequence, they all clip to the layer below the set.

Like in other programs, enabling clipping on the bottom-most layer in a group does nothing and you can't clip to a group set to pass-through.

<video controls>
  <source src="{{ "/assets/vid/help/clipping.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Inherit Alpha

This works like the same feature in Krita and similar to "clip to backdrop" in GIMP.

You can activate it using the second button at the top-left of the layers dock. It will make the layer clip to everything below it within the same layer group. That makes it slightly more flexible than clipping to a single layer, but in simpler cases, you end up having to create more layer groups around the stuff you want to clip.

Enabling this outside of a layer group usually doesn't make sense, since your background will usually be fully opaque anyway. Setting a layer group to pass-through makes it exempt from this.

<video controls>
  <source src="{{ "/assets/vid/help/inheritalpha.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Automatic Alpha Preserve

Most blend modes only really make sense when you clip them to something. For example, Multiply only really multiplies and Saturation only changes the saturation of the opaque part of what they are applied to. So by default, Drawpile automatically enables "inherit alpha" on layers and "alpha preserve" on your tool for those blend modes. It also gives you an extra "Recolor" blend mode, which is just Normal with alpha preserve enabled.

If you don't want this, you can turn it off through the top menu under Layer → Automatically inherit alpha. It's also linked in other places, like the user interface preferences or the hamburger menu in most tools.

<video controls>
  <source src="{{ "/assets/vid/help/autoalphatoggle.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Layer Alpha Lock and Tool Alpha Preserve

There's two ways to only draw on top of the opaque parts of a layer: alpha locking the layer or enabling alpha preserve on your tool. They both do the same thing, this is again just something where other programs do it in different ways and Drawpile gives you all of them.

To alpha lock your layer, click the third button at the top-left of the layer list. You can only do this to regular layers, not layer groups. This will only apply to yourself, it doesn't interfere with other people drawing on the layer.

To preserve alpha on your tool, toggle the button next to the blend mode in the tool settings. All tools that support this - such as brushes, flood fill tool, gradient tool etc. - should have a button like this. The default shortcut for this is <kbd>Shift</kbd> + <kbd>E</kbd>.

<video controls>
  <source src="{{ "/assets/vid/help/alphalock.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Masking

Drawpile doesn't have layer masks as such, but you can use Erase layers instead. Put the layer you want to mask into a layer group and put another layer on top, then set the blend mode of the top layer to Erase.

<video controls>
  <source src="{{ "/assets/vid/help/maskerase.mp4" | relative_url }}" type="video/mp4"/>
</video>
