---
layout: drawpile_post
title: "Dev Update: Week 30 and 31 of 2025"
date: 2025-08-03 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---

The last two weeks were spent on getting things ready for the next release: updating dependencies, writing up the announcement, fixing bugs and testing the donation infrastructure. I'd expect that 2.3.0-beta.1 will release next week. A 2.2.3 release will probably also follow, since there's some bugfixes that have been backported.

## Windows with ARMs

There's now a native version of Drawpile for Windows on ARM processors. GitHub has made the runners available for that publicly a while ago to make this possible.

If you don't know what this is, you probably don't have such a device, they're still pretty rare.

You can download those versions [from the alpha release](https://github.com/drawpile/Drawpile/releases/tag/continuous){:target="_blank"}, either the "Windows Installer for ARM-based devices" or "Windows Portable ZIP for ARM-based devices". You can disregard that it says "do not use" obviously, you are one of the few cases that *do* want such an obscure build.

## Annotation Backgrounds

The annotation tool settings will now use either the canvas background or the color behind the canvas as the transparent background color for the text input field. Previously, it would always be white, which was pretty annoying when writing light text.

This was suggested by Blozzom [on Discord](https://drawpile.net/discord/){:target="_blank"}.

<video controls>
  <source src="{{ "/assets/vid/2025-08-03_annotationbackground.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Work in Progress: Brush Fill

There's currently work going on to build a "brush fill" tool. This is also known as "anti-overflow" in some other programs and they tend to have it as a brush parameter instead of a separate tool, but I'll explain why I think separating it is better.

The video below shows how it works: you mark your lines layer as the fill source and then your brush will automatically stay within the lines. The way this works under the hood is that it does a flood fill from where your cursor is for every brush dab.

Currently there's not much UI for this other than the brush fill tool button, but there's the same Tolerance and Expand parameters as you have in the fill and magic wand tools. My idea for the settings is that it only shows the Size slider for the brush, plus sliders for those two parameters, as well as buttons to set and clear the fill source. If you didn't pick a fill source, the tool can tell you that you gotta do so.

One significant downside of this kind of fill is that you can't really have feathering or anti-aliasing, since your brush stroke will compound as you draw over the same area and ruin the transparency that's there. Other software seems to just accept this and not offer any way around it. Drawpile could do that too, since there's already a workaround: use Selection → Draw on Selection, draw over the area you want to fill, then feather the selection and fill it. That isn't a particularly nice process though.

Instead, the idea I currently have is to let you toggle between a straight anti-overflow brush like in other programs and an actual separate fill. The latter would work like the previews of the fill tool, where only you can see the fill until you apply it. Since the fill will exist in an intermediate state instead of the brush being drawn directly onto the canvas, it can be feathered or anti-aliased as a whole just fine.

If you have other ideas about this, [suggest them somewhere](https://drawpile.net/help/){:target="_blank"}.

<video controls>
  <source src="{{ "/assets/vid/2025-08-03_brushfill.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Minor Additions and Bugfixes

Fixed an issue where using different tools to draw in a selection mask could lead to them not synchronizing selection tiles properly, which made it impossible to draw on certain tiles until fiddling with the selection to reset it. This was reported by Bluestrings directly.

There's now a debug view for selections that can be enabled at compile-time, which will show those selection masks in green. This makes it easier to tell what the selection sync and brush fill tool are actually doing.
