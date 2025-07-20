---
layout: drawpile_post
title: "Dev Update: Week 28 and 29 of 2025"
date: 2025-07-20 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---

The last two weeks have seen a bunch of bugfixing and some smaller but significant features. The next beta version of Drawpile should be ready now, as well as a next stable version with some backported fixes. Otherwise, there's been a lot of organizing, since we're allowed to take donations now.

If you want to try it already, you can [grab the alpha version from GitHub](https://github.com/drawpile/Drawpile/releases/tag/continuous){:target="_blank"}.

## Pixel-Perfection

There's now a "pixel-perfect" setting for the Drawpile pixel brushes and MyPaint brushes. The setting is available either in the paint mode drop-down at the top-right of the brush settings dock or in the brush settings dialog.

This is mostly useful for single-pixel brushes to keep their thickness at actually a single pixel, without adding two pixel wide, L-shaped jags when doing curves. You can also enable it for larger brushes, but not sure if that has a notable effect.

For MyPaint brushes, enabling pixel-perfect will force the Hardness and Snap to Pixel settings to 100%, as well as the Pixel Feather setting to 0%, since those are what make a MyPaint brush a pixel brush.

This was reported by Meru [on GitHub](https://github.com/drawpile/Drawpile/issues/602){:target="_blank"} and by Squishy to me directly.

<video controls>
  <source src="{{ "/assets/vid/2025-07-20_pixelperfect.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Session Thumbnails

The Drawpile server now supports session thumbnails. Currently they're not shown in the client anywhere, but server owners can build things on it already.

How they work is that the server requests a client to generate a thumbnail. They will then do that in the background and upload the result to the server, which will store it. No image processing is done on the server, so server owners don't need to beef up their CPUs.

Thumbnails can at most be around 16KiB large and the client will only generate them up to a size of 1000x1000, so it shouldn't take up notable processing power, network capacity or storage space. Supported formats are WEBP and JPEG, which will get reduced in quality if the thumbnail doesn't fit into the size limit. Since WEBP is smaller and looks better at lower qualities, that's the default.

Only one thumbnail at a time is stored along with the other session files with a `.thumbnail` extension. If you have session archiving enabled, the thumbnails get archived along with the other files when the session is terminated.

Currently, the server doesn't request thumbnails from clients automatically, but the facilities for it is built into the client. The server could in the future send out a query to clients similar to how it does it for resets and then pick the best one to generate a new thumbnail.

If you want to build something for thumbnails on your own server, you can look at [the API documentation here](https://github.com/drawpile/Drawpile/blob/main/doc/server-api.md#session-thumbnails){:target="_blank"}.

## Organizing

After quite a lot of mostly waiting, the German government has approved Drawpile's "public goodness" as a free, public service to artists. So we're now allowed to have an organization and take donations for it, which is currently being set up and tested.

It will also let us do other stuff that wasn't possible as just a private person, like putting the application on Google Play or Steam. And theoretically we could also get a certificate from Apple for free so that macOS users don't have to jump through ridiculous hoops to install it… but apparently setting up an Apple developer account without owning Apple hardware is impossible. I've spent quite a lot of time on just trying to create an account and could probably rant on that for a few paragraphs, but presumably I'll manage to set that up in the future.

Explaining what kind of organization it is is a bit annoying, since English doesn't have proper words to describe it. The important thing is that it's "for the public good", which is similar to a non-profit organization in other countries – but not exactly. In particular, there isn't any for-profit company next to it like you have with e.g. Mozilla or Krita. Any money going to the organization must be used for its proper cause, it doesn't just go into my pockets and there can't be any shareholders profiteering. The organization is legally obligated to keep Drawpile a public good, which means no enshittification, no tracking, no paywalling or any of the other nastiness you're probably at least as sick of as I am.

## Iconography

The alpha and beta releases of Drawpile now use a different icon, to be able to tell the two apart better when you install both the development version and the stable version of Drawpile side by side. It's a colorful ferret holding a letter beta.

![Beta application logo]({{ "/assets/img/2025-07-20_betalogo.png" | relative_url }})

You'll probably see that ferret logo used in some other places as well. It was made to be "remixable", for example by giving the ferret different things to hold, changing its colors or drawing a different kind of creature in the same kinda pose. There's quite a lot of pieces to Drawpile that currently don't have their own logo – the dedicated server, the list server, various command-line tools and of course many communities – so having something that can be changed and remixed easily was the idea on how to solve that.

The current blue globe logo will continue to be used for Drawpile itself, there's no particular reason to change it and confuse people. It's just kinda "too perfect" to really add anything to it in a sensible way. Maybe it'll end up getting changed in the future if there's ends up being a reason for it, like to maybe tell apart a future Drawpile 3 from the current Drawpile 2 if they're sufficiently incompatible that you'd want to keep both around, but there's nothing like that planned.

The logo was created by [Morrow Shore](https://morrowshore.com/){:target="_blank"} and is licensed under [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/){:target="_blank"}. That means you can modify it and use it under the same terms, for example for your Drawpile community or similar.

Or take it and modify it to suggest we use your version instead! I kinda suspect that the SVG could be optimized at least. Here's the files without the ferret holding anything:

* [Logo as a SVG vector image]({{ "/assets/img/2025-07-20_logo.svg" | relative_url }}){:target="_blank"}
* [Logo as a PNG bitmap image]({{ "/assets/img/2025-07-20_logo.png" | relative_url }}){:target="_blank"}

Oh yeah, and for the relation between Drawpile and ferrets, just search for "ferret pile" on your favorite image search engine.

## Minor Additions and Bugfixes

An occasional crash when closing the main window on Windows was fixed. Although it probably wasn't terribly noticeable to begin with, since the main windows run in separate processes, so it just crashed a few microseconds before it would have terminated anyway.

The audio backend has been changed to miniaudio, which makes notification sounds work on Android, the Linux AppImage and 32 bit Windows. It also should also be more stable, previously you could get hangs or crashes on some Linux and Windows systems when they tried to play a notification sound. It also makes the application download a bit smaller and has some features that may be useful to add sounds to animations, if that ends up getting implemented at some point.

The Recolor and OKLAB blend modes have been optimized with vector processing on 64 bit Intel CPUs, meaning they now go a lot faster on most computers. This was contributed by Bonbli.

Opening DPCS files now works on Android. This was reported by CosmosX007 and Fanshen [on Discord](https://drawpile.net/discord/){:target="_blank"}.

DPCS files with key frames assigned to layers with ids above 255 now load properly. It incorrectly filtered those out as being out of bounds, leading to those key frames turning blank. This was only an issue in the reader, the files you may have that behave this way will now work fine.

Duplicating layers with ids above 255 now works properly. Previously it caused the id to get sliced, leading to the wrong layer getting duplicated.

The frame count dialog now properly shows the current amount of frames when you go to change your timeline frames. Previously it showed 99 as the current frame count if you had more than that. It always let you enter bigger numbers, it was just a display issue.

Some parts of the UI not getting translated despite there being translations for them has been fixed. This was reported by xxxx directly.

The gradient tool now properly updates the preview when you switch layers, rather than remaining on the previous layer and only updating when you futz with it afterwards.

The server now no longer tries to start the GUI on Linux when you don't have a graphical interface. There's also an explicit `--no-gui` option you can give it now, analogous to the `--gui` option. This was reported by Epiglottal Axolotl [on Discord](https://drawpile.net/discord/){:target="_blank"}.

On Linux under Qt 5, the color wheel no longer goes bonkers when you resize the window to a size smaller than its minimum. This was caused by a bug workaround for something that showed up briefly, but apparently got fixed upstream now, so it was just a matter of removing the workaround. This was reported by Bonbli [on Discord](https://drawpile.net/discord/){:target="_blank"}.
