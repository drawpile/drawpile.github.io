---
layout: drawpile_post
title: "Dev Update: Week 45 to 47 of 2025"
date: 2025-11-17 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---

The last few weeks have mostly been focused on fixing bugs for Drawpile 2.3.0 and adding some new resources to it. Unless anything comes up, I'll probably start building the final release of that version.

## New Brushes

New brushes were added (all in the "Drawpile" category):

* "Pencil 1", a brush based on the 2B pencil from the Tanda category, but adjusted to use Wash mode instead. This was provided by Ben.
* "Marker Line", a line brush using the new Marker blend mode.
* "Soft Shade", a soft paint brush that works well for soft shading and lighting.
* "Pixel 3", a one-pixel brush with pixel-perfect enabled.
* "Pixel Art", a one-pixel brush with pixel-perfect and pixel art input enabled.
* "Binary 1", a binary line brush using the Marker blend mode. Based on a brush provided by Annoy.
* "Binary 2", a binary paint brush.
* "Spray", a pixel spraycan-esque brush. Based on a brush provided by lambda20xx.
* "Edger 1", a brush with a soft and a hard side. Provided by Blozzom.
* "Wavy Ink", a line brush based on Irregular Ink. Provided by Ben.

![Examples of the new brushes]({{ "assets/img/2025-11-18_brushes.webp" | relative_url }})

## New Layouts

And some new layouts (accessible through View → Layouts):

* "Floofderg", a layout for large screens with an extra view for the reference dock. Provided by Ausjamcian.
* "Kerfluff", a layout for right-handed use on tablets. Provided by Scruff.
* "Lambda", a layout for medium screens with extra views for the reference and color slider docks. Provided by lambda20xx.

![Examples of the new layouts]({{ "assets/img/2025-11-18_layouts.webp" | relative_url }})

## Color Pickings

The palette in the color picker tool settings will now only fill with colors you actually picked, rather than getting spammed with every color you drag over along the way. When you manually add a color here, it also now defaults to your current foreground color, rather than starting out black.

You can now toggle the sampling ring in the color picker tool settings, rather than having to go into the preferences for it.

The color sampling ring now has extra thickness on the sides to make the color comparison more visible. This is based on an implementation for Krita by tiar.

![Color sampling ring with thicker sides]({{ "assets/img/2025-11-18_colorpickerbaubles.webp" | relative_url }})

## Old Setting Transitions

Code for porting over really old settings from version 2.1 and earlier has now been removed, since it doesn't work properly anymore and causes more harm than good. This affects moving settings out of the registry into a file on Windows and porting over an older brush preset format that stored the brushes in directories instead of a database.

If you really need this functionality, you can run Drawpile 2.2.2 once to have it do the conversion. However, the program has changed quite a lot since Drawpile 2.1 was released in 2017, so it's probably better to start fresh than trying to pull in a really old setup like that.

## Minor Additions and Bugfixes

* On Android, fiddling with sliders no longer shows text selection handles until you actually edit the text. This fix has also been contributed to Krita.
* Long-presses for right clicks now behave better. They no longer get delayed by kinetic scrolling, calculate their activation distance correctly and act more like a real right-click would that causes less confusion for widgets its aimed at. These fixes have also been contributed to Krita.
* A new setting to enable touch draw pressure was added. This is needed for certain screen tablets apparently. This was reported by SurgeonTaco [on Discord](https://drawpile.net/discord/){:target="_blank"}.
* Dragging a layer onto its own canvas no longer pastes it, since that was really only ever used accidentally. You can still drag layers onto other canvases though. This was reported by Blozzom and Pepper [on Discord](https://drawpile.net/discord/){:target="_blank"}.
* Server dprec templates no longer claim that they're incompatible when they're not.
* The alpha lock feature is now a button next to the clip and inherit alpha buttons, rather than being under the lock menu. Previously, users not familiar with the latter would misinterpret the button and get completely stumped. This was reported by Phoneme.
* On Android, opening the preferences dialog no longer exits full-screen in some cases.
* If the screen is sufficiently large, you now get the desktop UI for the start and preferences dialog with the buttons on the side, rather than the small-screen versions where the buttons are all the way at the bottom. This was suggested by tiar.
* UI text that contained characters not available on Android now replaces those characters with something that doesn't show up as a box.
* MyPaint brushes now enable smudge syncing by default, since several brushes require it. This matches with how MyPaint itself works.
* On Android and the browser, saving/downloading a file now puts a proper filename into the name field and pre-selects the correct default extension from the list, rather than sometimes having garbage extra stuff in the name field and always selecting the top option.
* When attempting to pick a color from the screen on Wayland, you now get an error message telling you to switch to X. This was reported by Phoneme.
* In the browser, the pick from screen button is now gone entirely, since a web application can't do that.
* Reopening the main window in the browser no longer enters full-screen mode. This was reported by Bluestrings.
* Reconnecting to a session in the browser using a drawpile.net account now automatically picks the same username again like it does on other platforms, rather than requiring an extra click there.
* On fast reconnects, local state such as layer visibility, track visibility etc. are now preserved properly. This was reported by Bluestrings and hpar [on Discord](https://drawpile.net/discord/){:target="_blank"}.
* Using a text field on Android no longer makes hardware keyboard inputs stop working when using a keyboard like GBoard. This fix was also contributed to Krita. It reported by justanotatest [on GitHub](https://github.com/drawpile/Drawpile/issues/1495){:target="_blank"}.
* The chat now unfocuses when you collapse it so that you don't keep typing into something you can't see.
* On Android, the application now falls back to internal storage when proper storage is unavailable. This was reported by Sherb.
* Hardware and software renderers now use slightly different zoom levels from each other, optimized for the way they work. This improves image quality and reduces jitter.
* The hardware renderer now uses single-buffering by default, rather than the system default that might introduce massive input delays.
* Infinitesimally tiny, totally transparent or infinitely soft brush dabs are now properly ignored again. They incorrectly only got ignored when all three criteria were fulfilled, rather than any one of them. This was reported by Blozzom.
