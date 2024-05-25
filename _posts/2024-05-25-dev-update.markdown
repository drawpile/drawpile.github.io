---
layout: drawpile_post
title: "Dev Update: Week 21 of 2024"
date: 2024-05-25 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---

Last week has mostly been some additional work on selections and transforms, plus some other smaller things.

## Selection Stuff

More work has been going into the selections and transforms:

* You can now toggle between fast and accurate preview. The fast preview works like in Drawpile 2.1, where the selection is just an image on top of the canvas. This ignores layering, blend modes, opacity and resolution, which is what makes it fast. The accurate preview is like it is since Drawpile 2.2, where the preview actually gets painted onto the layer itself, showing you exactly what it will look like when applied.
* The click detection is now tighter. It still allows some amount of dragging when using a tablet and touch, since some amount of shift with those is natural, but with a mouse, it now allows much less. Suggested by Blozzom [on Discord](https://drawpile.net/discord/){:target="_blank"}.
* Switching tools now applies the transform (and also other multi-part tool operations like curves) instead of cancelling it. Suggested by Blozzom [on Discord](https://drawpile.net/discord/){:target="_blank"}.
* You can now use Deselect during a transform to finish the transform and immediately deselect the associated selection, if one exists. Suggested by SadColor [on Discord](https://drawpile.net/discord/){:target="_blank"}.
* Clicking with the transform tool now lets you hold down the button and continue dragging immediately instead of requiring you to click once with it to start a transform. Suggested by SadColor [on Discord](https://drawpile.net/discord/){:target="_blank"}.
* Some ancillary fixes.

## Proxy Styling

When building Drawpile, you can now pass `-DPROXY_STYLE=ON` to enable a proxy style to fix the bad contrast in dark themes when using the default Fusion style. This is relevant when you're not building your own Qt with Drawpile's patch set for it that fixes this stuff at the source.

This is known to cause problems on some language versions of Windows. English works fine, but Chinese breaks horribly, for example. But on Windows, you're always building your own Qt anyway, so you should be using the patches.

## Windows Installer Woes, Part n+1

The Windows installer for the continuous release is broken again. Instead of overwriting the existing installation, it somehow manages to install a second version of Drawpile on top of the old one. I tried figuring out what change in Drawpile caused this problem, but even going back to version 2.2.1-beta.1, whose installer works properly, now produces a broken installer when rebuilding it.

The only explanation I have is that GitHub Actions updated something related to the installer generator and that's busted now. Unfortunately, the installer technology and the generator documentation are of the usual MSDN quality, so it's of absolutely no help. It'll likely take some long staring sessions at installation logs and twiddling stuff to hopefully find the thing that's going wrong.

The investigation is ongoing, more can be found [in this GitHub issue](https://github.com/drawpile/Drawpile/issues/1201#issuecomment-2126238167){:target="_blank"}.

## Minor Additions and Bugfixes

TCP\_NODELAY is now enabled on all TCP sockets. This might improve latency in some cases.

The Layouts option is now available in dock menus, since it's a very dock-related option.
