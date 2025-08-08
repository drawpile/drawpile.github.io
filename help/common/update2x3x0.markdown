---
layout: drawpile_help
title:  "What's New in 2.3.0 (Beta)"
description: "An illustrated overview of new stuff in Drawpile 2.3.0."
date: 2025-08-07 00:00:00 +0200
category: "help"
tag: help common
---

<div class="notification">
<strong>Note:</strong> Drawpile version 2.3.0 is currently in beta. It should be stable and is ready for use, but features may still get added or changed. If you want to give feedback on it – especially if the new version breaks your workflow – <a href="https://drawpile.net/help/" target="_blank">please do so here!</a>
</div>

Drawpile 2.3.0 has lots of new features over versions 2.2.x. It is still [backward compatible](#compatibility) though, meaning you can use the new version and still draw with people using the previous one.

To install it, [take a look at the release announcement](https://drawpile.net/news/release-2.3.0-beta.2/){:target="_blank"} or [go straight to the downloads page to grab and install it](https://drawpile.net/download/#Beta).

Below is an illustrated guide showing off most of the new features in this version.

<ul id="markdown-toc">
  <li><a href="#compatibility" id="markdown-toc-compatibility">Compatibility</a>    <ul>
      <li><a href="#feature-tags" id="markdown-toc-feature-tags">Feature Tags</a></li>
    </ul>
  </li>
  <li><a href="#layer-clipping-23-only" id="markdown-toc-layer-clipping-23-only">Layer Clipping</a></li>
  <li><a href="#explicit-inheritpreserve-alpha-23-only" id="markdown-toc-explicit-inheritpreserve-alpha-23-only">Explicit Inherit/Preserve Alpha</a></li>
  <li><a href="#blend-mode-dependence-23-only" id="markdown-toc-blend-mode-dependence-23-only">Blend Mode Dependence</a></li>
  <li><a href="#layer-alpha-lock-22-compatible" id="markdown-toc-layer-alpha-lock-22-compatible">Layer Alpha Lock</a></li>
  <li><a href="#gradient-tool-22-compatible" id="markdown-toc-gradient-tool-22-compatible">Gradient Tool</a></li>
  <li><a href="#lasso-fill-tool-22-compatible" id="markdown-toc-lasso-fill-tool-22-compatible">Lasso Fill Tool</a></li>
  <li><a href="#drawing-toolbar-customization-22-compatible" id="markdown-toc-drawing-toolbar-customization-22-compatible">Drawing Toolbar Customization</a></li>
  <li><a href="#selections-masking-brush-strokes-23-only" id="markdown-toc-selections-masking-brush-strokes-23-only">Selections Masking Brush Strokes</a></li>
  <li><a href="#drawing-on-selections-22-compatible" id="markdown-toc-drawing-on-selections-22-compatible">Drawing on Selections</a></li>
  <li><a href="#more-and-fewer-layers-23-only" id="markdown-toc-more-and-fewer-layers-23-only">More (and Fewer) Layers</a></li>
  <li><a href="#bigger-and-smaller-brushes-23-only" id="markdown-toc-bigger-and-smaller-brushes-23-only">Bigger (and Smaller) Brushes</a></li>
  <li><a href="#larger-canvases-23-only" id="markdown-toc-larger-canvases-23-only">Larger Canvases</a></li>
  <li><a href="#layer-and-key-frame-color-markers-22-compatible" id="markdown-toc-layer-and-key-frame-color-markers-22-compatible">Layer and Key Frame Color Markers</a></li>
  <li><a href="#paint-modes-23-only" id="markdown-toc-paint-modes-23-only">Paint Modes</a></li>
  <li><a href="#mypaint-brush-blend-modes-23-only" id="markdown-toc-mypaint-brush-blend-modes-23-only">MyPaint Brush Blend Modes</a></li>
  <li><a href="#new-blend-modes-23-only" id="markdown-toc-new-blend-modes-23-only">New Blend Modes</a>    <ul>
      <li><a href="#pigment-blend-mode-23-only" id="markdown-toc-pigment-blend-mode-23-only">Pigment Blend Mode</a></li>
      <li><a href="#oklab-blend-mode-23-only" id="markdown-toc-oklab-blend-mode-23-only">OKLAB Blend Mode</a></li>
      <li><a href="#greater-density-and-marker-blend-modes-23-only" id="markdown-toc-greater-density-and-marker-blend-modes-23-only">Greater Density and Marker Blend Modes</a></li>
      <li><a href="#sai-blend-modes-23-only" id="markdown-toc-sai-blend-modes-23-only">SAI Blend Modes</a></li>
      <li><a href="#common-blend-modes-23-only" id="markdown-toc-common-blend-modes-23-only">Common Blend Modes</a></li>
    </ul>
  </li>
  <li><a href="#blend-mode-shortcuts-22-compatible" id="markdown-toc-blend-mode-shortcuts-22-compatible">Blend Mode Shortcuts</a></li>
  <li><a href="#pixel-perfect-22-compatible" id="markdown-toc-pixel-perfect-22-compatible">Pixel-Perfect</a></li>
  <li><a href="#synchronized-smudging-22-compatible" id="markdown-toc-synchronized-smudging-22-compatible">Synchronized Smudging</a></li>
  <li><a href="#smudge-with-transparency-23-only" id="markdown-toc-smudge-with-transparency-23-only">Smudge with Transparency</a></li>
  <li><a href="#jitter-brush-setting-22-compatible" id="markdown-toc-jitter-brush-setting-22-compatible">Jitter Brush Setting</a></li>
  <li><a href="#color-harmony-swatches-22-compatible" id="markdown-toc-color-harmony-swatches-22-compatible">Color Harmony Swatches</a></li>
  <li><a href="#annotation-rendering-23-only" id="markdown-toc-annotation-rendering-23-only">Annotation Rendering</a></li>
  <li><a href="#better-annotation-box-background-22-compatible" id="markdown-toc-better-annotation-box-background-22-compatible">Better Annotation Box Background</a></li>
  <li><a href="#ctrld-and-escape-to-deselect-22-compatible" id="markdown-toc-ctrld-and-escape-to-deselect-22-compatible">Ctrl+D and Escape to Deselect</a></li>
  <li><a href="#switch-tool-and-deselect-22-compatible" id="markdown-toc-switch-tool-and-deselect-22-compatible">Switch Tool and Deselect</a></li>
  <li><a href="#more-layer-locks-23-only" id="markdown-toc-more-layer-locks-23-only">More Layer Locks</a></li>
  <li><a href="#new-faster-file-format-22-compatible" id="markdown-toc-new-faster-file-format-22-compatible">New Faster File Format</a></li>
  <li><a href="#small-screen-mode-improvements-22-compatible" id="markdown-toc-small-screen-mode-improvements-22-compatible">Small-Screen Mode Improvements</a></li>
  <li><a href="#native-windows-on-arm-support-22-compatible" id="markdown-toc-native-windows-on-arm-support-22-compatible">Native Windows on ARM Support</a></li>
  <li><a href="#and-more-22-compatible" id="markdown-toc-and-more-22-compatible">And More</a></li>
</ul>

## Compatibility

Drawpile 2.3 is **backward-compatible** with Drawpile 2.2.

That means **2.3 can join sessions hosted with the older 2.2 versions** and you will be able to use several of the new features from the later version. Not everything will be available though, simply because the older version wouldn't understand it and would desynchronize. In the other direction, the older 2.2 version *can't* join sessions hosted with the new 2.3 version.

If you want to use both versions side by side, take a look [at this help page](/help/tech/sidebyside).

### Feature Tags

Features are tagged with <a href="#feature-tags"><span class="tag is-info has-text-weight-bold" title="Available in sessions hosted with Drawpile 2.2 and 2.3.">2.2-compatible</span></a> if they are available in sessions hosted with the old 2.2 version, <a href="#feature-tags"><span class="tag has-text-weight-bold" title="Only available in sessions hosted with Drawpile 2.3.">2.3-only</span></a> if they're only available in sessions hosted with the new 2.3 version.

## Layer Clipping <a href="#feature-tags"><span class="tag is-medium has-text-weight-bold" title="Only available in sessions hosted with Drawpile 2.3.">2.3-only</span></a>

You can now enable "clip to layer below" to make a layer or layer group preserve alpha with what's below it. This type of clipping is also now saved to and loaded from PSD files. It is also saved correctly in ORA files and will survive editing in Krita.

This doesn't really add any new functionality, since you could already do this kind of clipping by creating a layer group and setting the blend modes appropriately. It's just there for artists who are used to this flavor of alpha preservation and for compatibility with PSD files.

The old behavior or making alpha preserve dependent on blend mode is still there, but [you can turn that off if you don't like it](#blend-mode-dependence-23-only).

<video controls>
  <source src="{{ "/assets/vid/2025-03-30_clip.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Explicit Inherit/Preserve Alpha <a href="#feature-tags"><span class="tag is-medium has-text-weight-bold" title="Only available in sessions hosted with Drawpile 2.3.">2.3-only</span></a>

Similarly to the above, you can now explicitly toggle "inherit alpha" on layers and "preserve alpha" on tools. This is for artists used to Krita and will be saved to and loaded from ORA files appropriately.

The old behavior or making inherit and preserve alpha dependent on blend mode is still there, but [you can turn that off if you don't like it](#blend-mode-dependence-23-only).

<video controls>
  <source src="{{ "/assets/vid/2025-03-30_alphapreserve.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Blend Mode Dependence <a href="#feature-tags"><span class="tag is-medium has-text-weight-bold" title="Only available in sessions hosted with Drawpile 2.3.">2.3-only</span></a>

By default, Drawpile toggles "inherit alpha" on layers and "alpha preserve" on tools depending on the blend mode you choose. This is probably usually what you want, since not enabling it gives you a weird amalgamation of your chosen blend mode and Normal.

However, if that messes with your head coming from other programs, you can turn it off via **Edit** → **Preferences**, under **User Interface** via the option **Automatically inherit and preserve alpha based on blend mode**. The setting is also linked in the Layer menu at the top and in the menus of any dock that lets you pick a blend mode.

![Automatic alpha preserve setting]({{ "/assets/img/help/autopreserve.webp" | relative_url }})

## Layer Alpha Lock <a href="#feature-tags"><span class="tag is-medium is-info has-text-weight-bold" title="Available in sessions hosted with Drawpile 2.2 and 2.3.">2.2-compatible</span></a>

You can now alpha-lock a layer to make tools preserve alpha on them. This only affects you drawing on it, it doesn't mess with anyone else using the same layer.

This effectively the same as changing your tool's blend mode to preserve alpha. The feature is just there for artists that are used to other programs doing it this way.

<video controls>
  <source src="{{ "/assets/vid/help/alphalock.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Gradient Tool <a href="#feature-tags"><span class="tag is-medium is-info has-text-weight-bold" title="Available in sessions hosted with Drawpile 2.2 and 2.3.">2.2-compatible</span></a>

There is now a Gradient tool, letting you make linear and radial gradients. To avoid smattering gradients over other people's drawings on the same canvas, the tool requires a selection to operate in, giving you shortcut buttons for the common actions of selecting the entire canvas or the area of the current layer.

<video controls>
  <source src="{{ "/assets/vid/2025-05-18_gradient.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Lasso Fill Tool <a href="#feature-tags"><span class="tag is-medium is-info has-text-weight-bold" title="Available in sessions hosted with Drawpile 2.2 and 2.3.">2.2-compatible</span></a>

There’s now a new "lasso fill" tool. It works similar to performing a lasso selection and then filling it, except that it fills directly. It also lets you use the same stabilization options as for brushes, letting you make smoother shapes.

<video controls>
  <source src="{{ "/assets/vid/help/lassofill.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Drawing Toolbar Customization <a href="#feature-tags"><span class="tag is-medium is-info has-text-weight-bold" title="Available in sessions hosted with Drawpile 2.2 and 2.3.">2.2-compatible</span></a>

Since the drawing tools toolbar is getting kind of long at this point, you can now configure which tools you want to have on it and in what order they show up in. This is particularly useful if you have a smaller screen and the size is throwing one of your more frequently-used tools into the fold-out area.

The configuration option is under **Tools** → **Configure drawing toolbar**, under **View** → **Toolbars** and when right-clicking a toolbar.

You can always access any tool via the **Tools** menu at the top or via keyboard shortcuts, even after you hide them from the toolbar.

<video controls>
  <source src="{{ "/assets/vid/2025-06-22_toolconfig.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Selections Masking Brush Strokes <a href="#feature-tags"><span class="tag is-medium has-text-weight-bold" title="Only available in sessions hosted with Drawpile 2.3.">2.3-only</span></a>

Selections will now mask brush strokes, like they do in pretty much every other program, letting you "draw inside selections".

If you want the brush to disregard your selection, you can toggle **Selection** → **Mask Strokes/Lasso Fills by Selection**.

<video controls>
  <source src="{{ "/assets/vid/2025-05-04_selectionmask.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Drawing on Selections <a href="#feature-tags"><span class="tag is-medium is-info has-text-weight-bold" title="Available in sessions hosted with Drawpile 2.2 and 2.3.">2.2-compatible</span></a>

You can also now draw on the selection masks themselves, letting you create a mask by using your brush. To do so, toggle **Selection** → **Draw on Selection**.

It will also automatically turn itself off again when you switch layers.

<video controls>
  <source src="{{ "/assets/vid/help/drawonselection.mp4" | relative_url }}" type="video/mp4"/>
</video>

## More (and Fewer) Layers <a href="#feature-tags"><span class="tag is-medium has-text-weight-bold" title="Only available in sessions hosted with Drawpile 2.3.">2.3-only</span></a>

The layer limit has been raised from 255 per user to up to (theoretically) 32767 per user. By default, the limit is set to 1000.

There's a new session permission setting to adjust these for the different roles, available in the **Host** dialog or under **Session** → **Settings**, both at the bottom of the **Permissions** tab. For public sessions, it can make sense to set this limit to a very low number, rather than the typical old way of only letting people draw on pre-created layers.

![Layer and brush limit session settings]({{ "/assets/img/help/limitsettings.webp" | relative_url }})

## Bigger (and Smaller) Brushes <a href="#feature-tags"><span class="tag is-medium has-text-weight-bold" title="Only available in sessions hosted with Drawpile 2.3.">2.3-only</span></a>

The maximum brush size has been increased to 1000 pixels in diameter, up from 255. That lets them cover almost 16 times more area than before, the video below illustrates how much of a difference it makes.

Since huge brushes like this can be disruptive, there's a new session permission setting to limit it, right above [the one for layers](#more-and-fewer-layers-23-only). By default, the limit is 1000 for operators and 255 for everyone else. If you run a public session, you may want to reduce the size further for the sake of performance and to keep drawings small.

<video controls>
  <source src="{{ "/assets/vid/2025-04-13_brushsize.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Larger Canvases <a href="#feature-tags"><span class="tag is-medium has-text-weight-bold" title="Only available in sessions hosted with Drawpile 2.3.">2.3-only</span></a>

You can now have canvases that are up to 1 million pixels in either direction, rather than being limited to 32,767. The total size (width times height) is still 1,073,676,289 pixels (i.e. 32,767 squared), it's just that the sides are no longer capped individually.

If you're working at such sizes, you'll probably want to expand your canvas *downwards* or *rightwards*, since those are much faster than left and up. Also note that JPEG, WEBP and PSD images have a lower limit than these. Oh, and other programs will probably struggle opening images that are overly huge.

## Layer and Key Frame Color Markers <a href="#feature-tags"><span class="tag is-medium is-info has-text-weight-bold" title="Available in sessions hosted with Drawpile 2.2 and 2.3.">2.2-compatible</span></a>

Layers and key frames can now be marked with a color to help you spot what's what. You can set these in the layer and key frame properties, via the top menu or by right-clicking on them.

The color tag is actually stored in the title of the layer or key frame, starting with a `#`, then the hex code of the color and then a `!`. For example, the red Layer 8 in the picture below is actually called `#c23535!Layer 8`. That means if the available set of colors isn't enough for you, you can manually enter a custom color this way. It also means that when you edit an ORA or PSD file in another program and then go back to Drawpile, the color markers will survive.

![Layer and key frame color markers]({{ "/assets/img/2025-04-06_colormarkers.webp" | relative_url }})

## Paint Modes <a href="#feature-tags"><span class="tag is-medium has-text-weight-bold" title="Only available in sessions hosted with Drawpile 2.3.">2.3-only</span></a>

There is now four different paint mode options:

* **Direct Build-Up** will directly put the brush onto the canvas, letting opacity compound. This is also known as "Flow" in some programs.
* **Indirect Wash** will only build up opacity to the maximum opacity of the stroke. This works like Wash in Krita.
* **Indirect Soft** works like the indirect mode in Drawpile 2.2 (which was incorrectly named "Wash"), which will not build up any opacity within the same stroke at all. This is useful for soft shading, but can make odd-looking shapes when you cross lines with them.
* **Indirect Build-Up** is like indirect mode in Drawpile 2.1 and earlier, which just caps the opacity of the current stroke, as if you created a layer with the opacity you picked and then merged it.

<video controls>
  <source src="{{ "/assets/vid/2025-04-06_paintmodes.mp4" | relative_url }}" type="video/mp4"/>
</video>

## MyPaint Brush Blend Modes <a href="#feature-tags"><span class="tag is-medium has-text-weight-bold" title="Only available in sessions hosted with Drawpile 2.3.">2.3-only</span></a>

You can now use any blend mode with MyPaint brushes, like you can with the other engines.

Some more obscure features won't be available if you pick irregular modes, such as posterization or intermixing multiple modes. But since they don't really make sense when you're using those other modes, you probably won't miss them.

## New Blend Modes <a href="#feature-tags"><span class="tag is-medium has-text-weight-bold" title="Only available in sessions hosted with Drawpile 2.3.">2.3-only</span></a>

Several new blend modes have been added. Some of them are "just" more modes to do lighting and shading with, but several of them also give new ways of color mixing and controlling brush opacity.

### Pigment Blend Mode <a href="#feature-tags"><span class="tag is-medium has-text-weight-bold" title="Only available in sessions hosted with Drawpile 2.3.">2.3-only</span></a>

The **Pigment** blend mode allows for more "realistic" color blending. Instead of just averaging the red, green and blue channels, it performs spectral color mixing. Below you can see an example of how it blends blue and yellow into green, rather than them turning into gray.

Since this blend mode can be somewhat heavy on performance when used for brushes, there is a session permission for it. Only operators are allowed to use the mode by default. For layers, there is far less calculations, so there the mode is always available.

![Normal versus pigment color mixing]({{ "/assets/img/2025-04-13_pigment.webp" | relative_url }})

### OKLAB Blend Mode <a href="#feature-tags"><span class="tag is-medium has-text-weight-bold" title="Only available in sessions hosted with Drawpile 2.3.">2.3-only</span></a>

The **OKLAB** blend mode does color mixing in the [OKLAB color space](https://en.wikipedia.org/wiki/Oklab_color_space){:target="_blank"}. Instead of operating directly on the red, green and blue channels, it instead performs its calculations in a space that's more perceptually correct.

In the picture below, you can see an example of how Normal mode gives a bit of a dark halo around the spots of color, whereas OKLAB has them even throughout.

For brushes, this mode is behind the same permission setting as the Pigment mode, since it can be relatively slow. For layers, no special permission is needed.

![Normal versus OKLAB color mixing]({{ "/assets/img/2025-06-22_oklab.webp" | relative_url }})

### Greater Density and Marker Blend Modes <a href="#feature-tags"><span class="tag is-medium has-text-weight-bold" title="Only available in sessions hosted with Drawpile 2.3.">2.3-only</span></a>

These two modes work similarly to each other: they don't compound opacity with what's already on the layer.

**Greater Density** works like "Greater" in Krita and similar to "Compare Density" in CSP if it had proper color mixing. It will only put down something if your brush stroke has a higher opacity than what's already on the layer, otherwise it will not alter the picture.

**Marker** works like the marker tool in Paint Tool SAI and similar to "Alpha Darken" in Krita if, again, it had proper color mixing. It will only increase the opacity if your brush stroke has a higher opacity than what's already on the layer, but will always mix colors normally. Supposedly this is similar to how alcohol-based markers let you push color through the paper.

If you use a single color with these two modes, they work the same as each other. Try them out for linework!

<video controls>
  <source src="{{ "/assets/vid/2025-04-06_greatermarker.mp4" | relative_url }}" type="video/mp4"/>
</video>

### SAI Blend Modes <a href="#feature-tags"><span class="tag is-medium has-text-weight-bold" title="Only available in sessions hosted with Drawpile 2.3.">2.3-only</span></a>

Drawpile already had the mode "Luminosity/Shine (SAI)", which has now been renamed to **Shine (SAI)** to match with how Paint Tool SAI version 2 calls it (and because the name makes more sense.)

Additionally, there's now **Shade (SAI)**, **Shade/Shine (SAI)**, **Burn (SAI)**, **Dodge (SAI)**, **Burn/Dodge (SAI)**, **Hard Mix (SAI)** and **Difference (SAI)** modes. These modes tend to produce more vivid or even "blown-out" colors than other modes do.

These modes will correctly save to and write from PSD files, so you should be able to exchange them with Paint Tool SAI that way.

### Common Blend Modes <a href="#feature-tags"><span class="tag is-medium has-text-weight-bold" title="Only available in sessions hosted with Drawpile 2.3.">2.3-only</span></a>

Some less exciting new blend modes are **Vivid Light**, **Pin Light**, **Difference**, **Darker Color** and **Lighter Color**. These modes probably aren't spectacularly useful, but they're very common in other programs, so Drawpile has them too now.

## Blend Mode Shortcuts <a href="#feature-tags"><span class="tag is-medium is-info has-text-weight-bold" title="Available in sessions hosted with Drawpile 2.2 and 2.3.">2.2-compatible</span></a>

You can now assign shortcuts to switching your current tool to a specific blend mode. Probably particularly useful for common modes like Behind, Marker or Pigment.

![Blend mode shortcuts]({{ "/assets/img/help/blendmodeshortcuts.webp" | relative_url }})

## Pixel-Perfect <a href="#feature-tags"><span class="tag is-medium is-info has-text-weight-bold" title="Available in sessions hosted with Drawpile 2.2 and 2.3.">2.2-compatible</span></a>

There’s now a "pixel-perfect" setting for the Drawpile pixel brushes and MyPaint brushes. The setting is available either in the paint mode drop-down at the top-right of the brush settings dock or in the brush settings dialog.

This is mostly useful for single-pixel brushes to keep their thickness at actually a single pixel, without adding two pixel wide, L-shaped jags when doing curves. You can also enable it for larger brushes, but not sure if that has a notable effect.

For MyPaint brushes, enabling pixel-perfect will force the Hardness and Snap to Pixel settings to 100%, as well as the Pixel Feather setting to 0%, since those are what make a MyPaint brush a pixel brush.

<video controls>
  <source src="{{ "/assets/vid/2025-07-20_pixelperfect.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Synchronized Smudging <a href="#feature-tags"><span class="tag is-medium is-info has-text-weight-bold" title="Available in sessions hosted with Drawpile 2.2 and 2.3.">2.2-compatible</span></a>

You can now enable synchronized smudging on brushes that require smudging with their own strokes. Without it, some brushes will have discontinuity when you make fast strokes with them, since they try to smudge with something that isn't there yet.

Enabling this setting on a brush will make it significantly slower, since it has to wait for its own strokes to finish before continuing, but it'll probably still be faster than manually slowing your pen motion down.

<video controls>
  <source src="{{ "/assets/vid/2025-06-08_syncsmudge.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Smudge with Transparency <a href="#feature-tags"><span class="tag is-medium has-text-weight-bold" title="Only available in sessions hosted with Drawpile 2.3.">2.3-only</span></a>

The soft round, round pixel and square pixel brush engines now let you enable smudging with transparency. This makes them work like MyPaint brushes and smudging in pretty much any other program do, supporting "real" smudging that drags around the alpha channel as well.

The old way that doesn't touch the alpha channel is still available. You'll know the brush is falling back to it if the slider says "Blending" instead of "Smudging".

<video controls>
  <source src="{{ "/assets/vid/2025-06-08_smudgealpha.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Jitter Brush Setting <a href="#feature-tags"><span class="tag is-medium is-info has-text-weight-bold" title="Available in sessions hosted with Drawpile 2.2 and 2.3.">2.2-compatible</span></a>

The soft round, round pixel and square pixel brush engines now have a jitter setting. This will cause the brush dabs to randomly spread out around your cursor, useful for making charcoal, spray can or pencil brushes.

The MyPaint brush engine already had this setting and it continues to work like it did before.

<video controls>
  <source src="{{ "/assets/vid/help/classicjitter.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Color Harmony Swatches <a href="#feature-tags"><span class="tag is-medium is-info has-text-weight-bold" title="Available in sessions hosted with Drawpile 2.2 and 2.3.">2.2-compatible</span></a>

The color wheel now lets you enable color harmony swatches underneath it, similar to how it works in Krita.

By default, they show adjacent hues along with two sets of shades, one set having less saturated shadows and more saturated highlights and the other going vice-versa. Clicking on a color will select it so that you can make a palette, double-clicking will also make it the new baseline color. You can configure these swatches to your liking in the same menu that you use to enable them.

<video controls>
  <source src="{{ "/assets/vid/2025-06-22_harmonyswatches.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Annotation Rendering <a href="#feature-tags"><span class="tag is-medium has-text-weight-bold" title="Only available in sessions hosted with Drawpile 2.3.">2.3-only</span></a>

Annotation rendering can now be switched between Vector, Smooth and Pixel. Vector is the old way, where annotations are vector objects. Smooth shows the annotation the way it would look like if you merged it into the canvas. Pixel uses aliased text, which also looks the same when you merge it.

<video controls>
  <source src="{{ "/assets/vid/2024-03-17_annotationrender.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Better Annotation Box Background <a href="#feature-tags"><span class="tag is-medium is-info has-text-weight-bold" title="Available in sessions hosted with Drawpile 2.2 and 2.3.">2.2-compatible</span></a>

The annotation tool settings will now use either the canvas background or the color behind the canvas as the transparent background color for the text input field. Previously, it would always be white, which was pretty annoying when writing light text.

<video controls>
  <source src="{{ "/assets/vid/2025-08-03_annotationbackground.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Ctrl+D and Escape to Deselect <a href="#feature-tags"><span class="tag is-medium is-info has-text-weight-bold" title="Available in sessions hosted with Drawpile 2.2 and 2.3.">2.2-compatible</span></a>

By default, <kbd>Ctrl+D</kbd> is now bound to deselect, like it is in several other drawing programs. This is in addition to the <kbd>Ctrl+Shift+A</kbd>, which is the standard deselect shortcut in most other programs.

You can also hit <kbd>Escape</kbd> to deselect now, if there's no other action to cancel. If you don't like that, you can disable it via **Edit** → **Preferences**, under **Tools** via the option **Press Esc to deselect**. Actually, the key can be different, it's just whatever you bound the "cancel action" shortcut to.

![Escape to deselect setting]({{ "/assets/img/2025-06-08_deselect.webp" | relative_url }})

## Switch Tool and Deselect <a href="#feature-tags"><span class="tag is-medium is-info has-text-weight-bold" title="Available in sessions hosted with Drawpile 2.2 and 2.3.">2.2-compatible</span></a>

In other deselect news, there's shortcuts to switch tools and deselect at once, just search for "and deselect" in the shortcut preferences. This is useful if you want your selections to automatically go away when you switch to the brush tool for example, like it worked in Drawpile versions before 2.2.

![Tool and deselect shortcuts]({{ "/assets/img/2025-05-18_anddeselect.webp" | relative_url }})

## More Layer Locks <a href="#feature-tags"><span class="tag is-medium has-text-weight-bold" title="Only available in sessions hosted with Drawpile 2.3.">2.3-only</span></a>

You can now not only lock the content of a layer, to prevent someone drawing on it, but also the position in the tree, to prevent it from being reordered, and its properties, to prevent changing names or blend modes or whatever. And you can also set all of these at once if you want to lock a layer entirely.

![Layer locks]({{ "/assets/img/2025-05-18_layerlocks.webp" | relative_url }})

## New Faster File Format <a href="#feature-tags"><span class="tag is-medium is-info has-text-weight-bold" title="Available in sessions hosted with Drawpile 2.2 and 2.3.">2.2-compatible</span></a>

There's now a new DPCS file format that is much faster - and in many cases also smaller - than ORA files. ORA continues to be available of course.

The speedup is pretty huge, around 3000% faster to save and 200% faster to open. On the low end that is, some more pathological files are even faster, files that used to save in 2 minutes now take 2 seconds.

Or, if you want another comparison: saving the canvas in DPCS with all the layers, annotations and timeline in it is usually faster than exporting a flat JPEG.

Currently, ORA is still the default format. You can change the default via **Edit** → **Preferences**, under **Files** via the **Preferred save format** option. Here you can also now set a preferred export format, if you want something other than PNG.

![Preferred file format settings with DPCS selected]({{ "/assets/img/2025-05-18_dpcs.webp" | relative_url }})

## Small-Screen Mode Improvements <a href="#feature-tags"><span class="tag is-medium is-info has-text-weight-bold" title="Available in sessions hosted with Drawpile 2.2 and 2.3.">2.2-compatible</span></a>

If you use Drawpile on a phone or some other device with a small or low-resolution screen, you get a different user interface.

Under the **View** menu at the top, you can now enable **left-handed mode**, which will swap the sides of all docks and fold-out tabs. You can also **toggle the side or bottom toolbar** here now, if you don't want them permanently visible.

## Native Windows on ARM Support <a href="#feature-tags"><span class="tag is-medium is-info has-text-weight-bold" title="Available in sessions hosted with Drawpile 2.2 and 2.3.">2.2-compatible</span></a>

Drawpile 2.3 is available for Windows on ARM-based devices. If you don't know whether you own such a device: you probably don't.

Before installing the ARM version, you'll probably want to uninstall any existing versions of Drawpile for Intel-based devices first. Not doing so may give you strange results, but those should also be fixable by uninstalling and then reinstalling them. Your settings won't be lost when you do this.

## And More <a href="#feature-tags"><span class="tag is-medium is-info has-text-weight-bold" title="Available in sessions hosted with Drawpile 2.2 and 2.3.">2.2-compatible</span></a>

And a bunch of other fixes, performance improvements and features, such as:

* Support for QOI, the Quite Okay Image format.
* The option to define a separate curve for your eraser brush tip, in addition to the regular pen tip.
* Moving the buttons on the toolbars in small-screen mode so that rounded corners on some devices don't eat them.
* Small animations now get upscaled to fit into the flipbook preview.
* Arrow keys now let you navigate on the animation timeline.
* Brushes with a fixed X and Y offset now preview the outline in the correct place.
* MyPaint brushes now have a more accurate outline, as far as that's possible.
* A faster compression algorithm, speeding up session resets.
* Remembering who made changes to tiles across resets.
* Edit → Lightness/Darkness to Alpha actions, for turning lightness or darkness into transparency.
* Fixed audio playback on 32 bit Windows, Android and the Linux AppImage.
* Support for using the eraser side of pens on Android.
* And even more, plus further additions to the server and tools.
