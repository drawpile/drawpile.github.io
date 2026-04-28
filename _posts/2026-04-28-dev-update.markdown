---
layout: drawpile_post
title: "Dev Update: Week 16 and 17 of 2026"
date: 2026-04-28 00:00:00 +0100
category: "devblog"
tag: "@askmeaboutloom"
---

The last week was mostly spent [at the Libre Graphics Meeting](https://libregraphicsmeeting.org/){:target="_blank"}. The week before, some smaller things were added before translations were opened, you can help translate Drawpile [on Weblate](https://hosted.weblate.org/engage/drawpile/){:target="_blank"}. I also did some thinking on how filters could work in Drawpile, since it is a topic that came up in multiple places recently.

## Stabilizer Velocity Adjustment

You can now adjust the time-based stabilizer according to the speed of your stroke. By default, it is set to reduce the stabilization amount when you move the cursor more quickly.

The effect of this is that the stabilizer won't lag behind your cursor as much, even at high stabilization levels. It will instead follow a faster-moving cursor at a faster rate, which feels much better and should reduce the amount of fiddling you have to do with turning the stabilizer up and down.

You can disable and adjust the velocity adjustment in the stabilizer menu and the dialog that you can conjure from there or via Edit → Input Settings. Like the "finish strokes" option, the velocity setting is a preference, not attached to individual brushes like the stabilizer amount is. These settings really adjust the "feel" of the stabilizer and I doubt you'd want that to be different for every brush. It should always feel the way you like it, just apply at different strengths.

The default settings probably need some further adjustment. They feel pretty good I think, but only the lowest 10% or so of the velocity curve ever gets hit because you just can't move your cursor any faster, so editing seems nonsensical until you realize that most of what you're looking at doesn't matter. There'll also probably be more input settings added to that dialog in the future, a lot of stuff from the tablet preferences would be nice to have in a dialog that doesn't cover up the canvas and block inputs to it so that you can actually try out the changes on the fly without having to constantly open and close the dialog.

<video controls>
  <source src="{{ "/assets/vid/2026-04-28_stabilizervelocity.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Thoughts on Filters

Incidentally, there were several discussions in a few different places about filters in Drawpile. For example, HSV/HSL/HCY adjustment, blur, gradient maps, grayscaling etc. Since it came up so much, it did stick in my mind for a bit and I've done some thinking on them.

There are a few different ways One kind is the filter you apply destructively, it will basically cut pixels from a layer, edit them and then paste the changed pixels back. Then there is a few different ways to do non-destructive filtering in different programs: filter layers, filter masks, adjustment layers, correction layers and layer styles. But really, the overarching thing is a filter layer. Filter masks are just filter layers clipped to the layer below. Adjustment layers are just a subset of filter layers that only need to look at pixels individually, similar to a blend mode with extra parameters. Correction layers are the same thing, just translated badly. Layer styles are… kind of a grab-bag of assorted stuff, but some of them are basically filter masks.

In Drawpile, the obvious problem with all of these is that they affect the entire canvas by default. For destructive filters, this is kind of easily fixable: require a selection to apply them. The gradient and transform tools already do this successfully. This could even be implemented without any changes to the protocol, just by literally cutting and pasting the image, with the downside of this being kind of wasteful on the amount of data it requires to transmit and no separate permissions being possible.

The more interesting case would be non-destructive filter layers. Thinking about them a bit, you can kind of do the same technique with them: instead of applying them across the entire image, they can use the layer's contents as a mask. That way, you can specify which parts of the canvas they apply according to which pixels are filled. Since the color channels are otherwise unused, this could even allow for per-pixel parameterized filters. As a contrived and probably not very useful example, a HSV filter could use the red, green and blue channels of each pixel as inputs for the hue, saturation and value adjustment.

The other problem with these layers is performance. You can see this in Krita: something like a blur layer is *extremely* slow. They are so slow that they have to get updated asynchronously, with a progress bar on the layer showing you when it's going to be done. This is kind of inevitable: regular layer compositing just happens to each pixel individually and can be parallelized, but something like a blur has to look at surrounding pixels to do its job, which obliterates performance.

However, like I said above, some filter layers only affect individual pixels. A blur filter is really the worst-case example because it needs to span across the entire image, but a HSV adjustment or gradient map can be applied to every pixel individually in parallel, like a blend mode. And Drawpile even already has blend modes that do stuff like this, like Hue, Saturation or Color, so we know the performance is acceptable. And we don't even need to reinvent a new term here because other programs already given this subset of filter layers a name: these are adjustment layers!

So this may be a way to get these kinds of non-destructive filters into Drawpile, with stuff like blur and more complicated filters left out for now. It definitely would require a protocol change and so won't happen in 2.3.1, but the idea seems sound to me.

## Minor Additions and Bugfixes

The brush editor now sorts its entries into logical categories instead of having them all in a big list. This was suggested by Blozzom [on Discord](https://drawpile.net/discord/){:target="_blank"}.

Brush preset data and thumbnails are now loaded on demand, which makes startup, switching tags and other operations that reload brushes much faster.

Searching for brushes no longer changes which brush you have selected if the current brush gets filtered out.

The invite dialog now tells you whether joining via web browser is restricted or not available. This was suggested by Bluestrings [on Discord](https://drawpile.net/discord/){:target="_blank"}.

You can now skip around in the playback dialog again after creating an index file. Previously it failed to load the index because it always thought the canvas size was invalid. This was reported by Saova [on Discord](https://drawpile.net/discord/){:target="_blank"}.
