---
layout: drawpile_post
title: "Dev Update: Week 25 of 2024"
date: 2024-06-22 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---

This week has been some major reworking of the fill tool and some minor additions to selections and transforms.

If you want to try this stuff out, it's available right now [in the continuous development release](https://github.com/drawpile/Drawpile/releases/tag/continuous){:target="_blank"}.

## More Filling

The fill tool has received some upgrades. These also apply to the magic wand, where appropriate.

When you make a selection, it now acts as the fill tool boundary, removing the regular size limit. So if you have a weird shape where the rectangular area is inconvenient, you can just make a lasso fill around it instead. The selection also acts as a mask for the fill.

The fill tool now lets you pick any blend mode, rather than just a handful, and an opacity for the fill. These can be changed after making the fill but before applying it.

You can also change layers after making a fill now. So, for example, you can fill on your line layer, then switch to the color layer and then apply it. The option to set a fill source layer is still there, if you prefer doing it that way instead the annoying layer drop-down is gone now and has been replaced with a separate button.

And you can also change the color before applying a fill. The other options, like expand, feather, close gaps etc. can't be updated in-place - at least not yet. It would be nice to be able to do so, but changing those may be kind of slow, so that's a bit more complicated to implement.

There's also a mode in the fill tool to fill the entire selection now. It's similar to the fill shortcuts in the Edit menu, but with more controls.

## More Selecting and Transforming

You can toggle the selection view mode to be a solid mask instead under View → Show Selection Mask. This lets you see the opacity of your selection, whereas the usual marching ants outline doesn't represent that properly.

Transforms now let you pick the blend mode and opacity. This can be used e.g. to paste a texture and apply it with Recolor. These parameters also apply when you stamp a transform.

## Minor Additions and Bugfixes

Some incorrect math in the Behind blend mode has been fixed, it made some things too transparent. This shouldn't make too much of a visual difference in most cases, but may cause slight desync. This was reported by Blozzom [on Discord](https://drawpile.net/discord/){:target="_blank"}.

Right-clicking to cancel the fill tool now works even if you have right-click bound to a canvas shortcut. This was reported by SadColor [on Discord](https://drawpile.net/discord/){:target="_blank"}.

Layer picking now works properly in frame view mode. Previously it picked the bottom-most layer you clicked on, rather than the top-most.
