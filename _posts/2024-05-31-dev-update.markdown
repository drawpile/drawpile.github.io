---
layout: drawpile_post
title: "Dev Update: Week 22 of 2024"
date: 2024-05-31 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---

Last week's development time has been mostly spent on implementing transforms on multiple layers at once, plus some ancillary things.

## Multi-Layer Transform

You can now (finally) transform selections across multiple layers and groups.

When you start a transform, checkboxes will appear in the layer list to let you pick which layers to transform. By default the current layer will be checked, if that's a group, it'll check everything inside of it. If a layer is locked or censored, it will not be checkable and will instead show a forbidden icon.

Only up to 16 layers can be previewed in the accurate preview mode, beyond that, only fast mode is available. Which you probably want to use when you're transforming many layers anyway, since previewing them all accurately is kinda slow.

You can uncheck all layers to only transform the selection mask itself. This is also available directly under Selection → Transform Selection Mask, which will start a transform with all layers unchecked. This was suggested by SadColor [on Discord](https://drawpile.net/discord/){:target="_blank"}.

Here's a video showing how it works.

<video controls>
  <source src="{{ "/assets/vid/2024-05-31_multitransform.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Intuited Key Frame Structure

Creating layers on a key frame will now use the same layer structure to the closest frame. So, for example, if you assign a layer group to a key frame that contains a lines and a colors layer, then creating another key frame will create that same structure again, rather than just a flat layer.

If you only using layers for your key frames, nothing changes for you. This is only relevant if you assign layer groups to your frames.

This was suggested by Ausjamcian to me directly.

## Minor Additions and Bugfixes

Tools no longer get locked by stuff that doesn't affect them. For example, the inspector or pan tools no longer get locked when the canvas is locked, the annotation or selection tools no longer get locked if you have a locked or group layer selected.

The fill source layer is now indicated in the layer list with an appropriate icon.

When using Qt6 (e.g. Flatpak on Linux), the image loader memory limit is now disabled so that you can open large images with it. In Qt5, the memory limit "feature" doesn't exist in the first place. This was reported by LiterallyMe [on Discord](https://drawpile.net/discord/){:target="_blank"}.
