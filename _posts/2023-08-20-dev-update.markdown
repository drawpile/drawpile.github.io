---
layout: drawpile_post
title:  "Dev Update: Week 33 of 2023"
date: 2023-08-20 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---
This week has been a some stuff I've been wanting to get to for a while: making the application not chug when big changes happen and letting you export brushes. Other than that, there's also been some smaller additions.

The changes listed here are available [in the continuous development release](https://github.com/drawpile/Drawpile/releases/tag/continuous). Or you can wait until the next beta version is released, which probably won't be too long.

## Brush Export

You can now export brushes, just like you can import them. You can either export tags or brushes from the Brushes dock, or you can go through `File → Export → Brushes…`. Here you can pick which brushes and export them in a brush pack. You can export any brush this way, it's not restricted to just MyPaint brushes. The brush import also now understands how to import classic Drawpile brushes, of course.

The brush pack format used for import and export is compatible with MyPaint, so you can import MyPaint brush packs into Drawpile and vice-versa.

## Asynchronous Canvas Rendering

Previously, Drawpile would always update the visible canvas in sync with the user interface. If big changes happened, it would noticeably chug, like when hiding a layer. If you had the navigator open, the whole canvas was always visible, meaning that on busy boards, you'd get these chug moments regularly.

Now it updates the canvas in the background instead, without blocking the user interface. If big changes happen, you'll see them play out gradually, but the application should keep running smooth. The navigator should no longer cause those hefty lag spikes as it did before.

Here's a video showing a canvas with a very large number of layers, where toggling a layer takes a while to update the whole canvas. Instead of lagging out Drawpile while that happens, it just updates the canvas gradually, while the rest of the application remains running smoothly. If the navigator is visible, the active view is updated first.

<video controls>
  <source src="{{ "/assets/vid/2023-08-20_asyncrender.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Asynchronous Previews

This one's a similar idea. Before, previews like from the curve tool or from a selection being transformed would happen in sync with the user interface. If you e.g. moved a large selection around, Drawpile would chug.

Now previews get updated in the background, so the user interface stays smooth even if the updates take a while.

In this video you can see it in action: the visuals take a bit to update because of how large they are, but the selection rectangle keeps moving smoothly, rather than chugging along.

<video controls>
  <source src="{{ "/assets/vid/2023-08-20_asyncpreview.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Color Wheel Dextrocardia Cure

The color wheel innards used to go from most saturated to least saturated, which is opposite to how other drawing programs do it. It now goes the other way round by default, with the option to toggle it in the preferences.

![Drawpile color wheel direction toggle]({{ "/assets/img/2023-08-20_wheeldirection.webp" | relative_url }})

## Color Slider Space

The color sliders now adhere to the color space (HSV, HSL or HCL) chosen in the preferences, instead of always being in HSV mode. The suggestion for this feature [came from leandro2222 on GitHub](https://github.com/drawpile/Drawpile/issues/1127).

![Drawpile color sliders in different color spaces]({{ "/assets/img/2023-08-20_slidermodels.webp" | relative_url }})

## Translation Constraint

Holding the constraint key (Shift by default) when moving a selection now snaps it to the closest axis. The suggestion for this feature [came from Kvothen on GitHub](https://github.com/drawpile/Drawpile/issues/1118).

<video controls>
  <source src="{{ "/assets/vid/2023-08-20_constraintranslation.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Selected Bugfixes

The "lock session" menu option will no longer get stuck disabled.

Drawpile will no longer claim that the layer is locked when you're in frame view and select a layer that's not visible in the current frame. Instead it will now correctly state that fact.

Erasing with a MyPaint brush in indirect mode now actually works. Before it would try to erase with a fully transparent brush, which accomplished nothing.
