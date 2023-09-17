---
layout: drawpile_help
title:  "Alpha Preserve, Clipping Groups, Masks, Alpha Lock"
date: 2023-09-17 00:00:00 +0200
category: "help"
tag: help draw
---

Drawpile supports alpha preserve on layers. This is also known by various other names, like "clipping groups" or "inherit alpha". What it means is that you have a layer that doesn't add new pixels to the canvas, it only modifies something below it. It's frequently used for shading and lighting.

In Drawpile, all blend modes except Normal and Erase preserve alpha. That means you don't need to do anything special to enable it, just stick your layers into a group . So, for example, if you want to do shading, you'd arrange your layers like this:

* 📁 **Group** (Normal)
  * 📄 **Lines** (Normal)
  * 📄 **Lighting** (Screen)
  * 📄 **Shading** (Multiply)
  * 📄 **Colors** (Normal)

The **Lighting** and **Shading** layers will preserve the alpha of the **Colors** layer, letting you light and shade without worrying about spilling over the edges.

The group is *required*! Without it, your layers will blend with the canvas background, meaning you won't get any useful alpha preservation.

If you want a Normal layer with alpha preseve, use the Recolor blend mode.

If you *don't* want stuff inside a group to preserve alpha, set the group's blend mode to Pass-Through.

## Masks

The above kinds of arrangements should be enough in most cases. If you really *do* need a mask, you can use an Erase layer in an arrangement like this:

* 📁 **Group** (Normal)
  * 📄 **Mask** (Erase)
  * 📄 **Other Stuff** (Normal)

Now when you draw on the **Mask** layer, it will mask off those parts on the layers below, giving you the same effect as a transparency mask.

## Alpha Lock

Some programs let you "alpha lock" a layer, meaning when you draw on it, the opacity of the pixels on it won't change. In Drawpile, that's something you set on your brush, not on the layer.

On classic brushes, change the blend mode to "Recolor". On MyPaint brushes, toggle the lock button.

The shortcut for this is called "Toggle Recolor Mode", by default it's <kbd>Shift+E</kbd>.

![Recolor mode on brushes]({{ "/assets/img/help/recolor.webp" | relative_url }})

## Alpha Lock Alternative

If Recolor mode on your brush is not enough, you can stick the layer into a group and put a layer with the Recolor blend mode on top:

* 📁 **Group** (Normal)
  * 📄 **Changes** (Recolor)
  * 📄 **Base** (Normal)

Now you can draw on the **Changes** layer and it will preserve alpha of the **Base** layer, effectively acting like alpha lock.
