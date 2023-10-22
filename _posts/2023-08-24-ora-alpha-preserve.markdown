---
layout: drawpile_post
title:  "Layer Alpha Preserve in ORA Files"
date: 2023-08-24 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---

**Update:** The change proposed in this article has been accepted by Krita and should be in version 5.2.1. Drawpile will have it in version 2.2.0, starting from beta 9.

This is a technical article not directly concerning Drawpile itself, but the interoperability with other drawing programs like Krita through the OpenRaster (ORA) format. Drawpile uses this as its "native" format, but originally it came out of efforts from Krita for an interoperable image format and it's supported by various applications.

**tl;dr:** ORA files don't support alpha preserve on layers. This doesn't matter for Drawpile, because its alpha preserve behavior is baked into the blend mode, but in Krita, the alpha preserve state of a layer just doesn't get saved and so also doesn't get loaded, which is annoying. I wanna contribute a fix to Krita.

## The Problem

I drew this great picture in Drawpile. It's got a group with the lines on a Normal layer at the top, the flat colors on a Normal layer at the bottom and some shading with a Multiply layer in between.

![Picture in Drawpile with alpha preserve]({{ "/assets/img/2023-08-24_ora1.png" | relative_url }})

Now I wanna do some post-processing on this masterpiece in Krita, so I save it to an ORA file. Then I open it in Krita and…

![Picture in Krita without alpha preserve]({{ "/assets/img/2023-08-24_ora2.png" | relative_url }})

…it's messed up because the Multiply layer lost its alpha preserve (or "inherit alpha", in Krita terms.) Well okay, so I turn that on, using the `α` toggle on the layer.

![Picture in Krita with alpha preserve]({{ "/assets/img/2023-08-24_ora3.png" | relative_url }})

Then I save it again. But then when I reopen it…

![Picture in Krita without alpha preserve]({{ "/assets/img/2023-08-24_ora2.png" | relative_url }})

…it's messed up *again*, because Krita doesn't store any alpha preserve information in the ORA file.

## The Explanation

The information about alpha preserve just doesn't exist in the ORA file format. The Multiply layer looks like this inside the file, only listing the blend mode:

```xml
<layer
    name="Shading (Multiply)"
    composite-op="svg:multiply"
    x="0" y="0" opacity="0.5"
    visibility="visible"
    src="data/layer2.png"
/>
```

In Drawpile this happens to work because all blend modes except Normal and Erase preserve alpha. It behaves this way because no real life use has ever been found for multiplying a transparent pixel. In Krita, which blends properly like Porter and Duff had originally divined, it just forgets the alpha preserve state when you save a document to an ORA file.

The singular exception is the "Normal" blend mode. Without alpha preserve, its blend mode gets saved as `svg:src-over`. With alpha preserve, it becomes `svg:src-atop`, which Drawpile interprets as the "Recolor" blend mode.

Okay, so the obvious solution is to save the alpha preserve state of layers. But how?

## The Preferred Solution: Alpha Preserve Attribute

We add some kind of alpha preserve attribute to the `<layer>` element, such as `alpha-preserve="true"`. So the Multiply layer from the example would look like this:

```diff
 <layer
+    alpha-preserve="true"
     name="Shading (Multiply)"
     composite-op="svg:multiply"
     x="0" y="0" opacity="0.5"
     visibility="visible"
     src="data/layer2.png"
 />
```

If desired, we could namespace this thing and call it `krita:alpha-preserve` or `drawpile:alpha-preserve` or whatever the heck else. Although I don't think it would break anything, since if Drawpile and Krita implement it that way, it would probably be de-facto the standard.

**Advantages:** Obvious. Backward-compatible because other programs will just ignore it and behave as they do currently.

**Disadvantages:** Normal with alpha preserve gets two possible representations.

## The Worse Solution: Alpha Preserve Blend Modes

Analogously to the way the Normal blend modes work, we just add a pile of blend modes that imply alpha preserve. For example, instead of `svg:multiply`, it would be `krita:multiply-alpha-preserve` or whatever. In the example:

```diff
 <layer
     name="Shading (Multiply)"
-    composite-op="svg:multiply"
+    composite-op="krita:multiply-alpha-preserve"
     x="0" y="0" opacity="0.5"
     visibility="visible"
     src="data/layer2.png"
 />
```

**Advantages:** Analogous to the way the Normal blend mode already works.

**Disadvantages:** Breaks backward compatibility with everyone and everything, including earlier versions of Drawpile and Krita.

## Epilog

I guess there may also be the question of "what about other programs?" Well, there's GIMP, which doesn't support alpha preserve, and MyPaint, whose alpha preserve mechanism of stacking nested groups with composite modes disguised as blend modes is incompatible with Krita, Drawpile and any mortal thinking patterns. So I don't think either of them matters in the equation.

I'll be sending this to the Krita developers to look at. If you are one, hi, there's a merge request open to implement this.

The change to Drawpile is analogous, it'll start saving the alpha preserve state in a way that Krita is able to understand.
