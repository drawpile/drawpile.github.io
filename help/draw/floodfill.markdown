---
layout: drawpile_help
title: "Flood Fill Tool"
date: 2024-02-03 00:00:00 +0200
category: "help"
tag: help draw
---

Drawpile's Flood Fill tool, also sometimes called fill bucket or similar, lets you fill areas in a single go. It works similar to other programs, with the notable difference that it comes with a size limit to prevent disrupting other users.

You can select the Flood Fill tool through Tools → Flood fill. The default shortcut is F.

To apply the fill, left-click with it. To cancel it if it's taking too long, either right-click or hit the cancel action key (Escape by default.)

![Flood fill tool in action]({{ "/assets/img/help/floodfillcircle.webp" | relative_url }})

## Tool Settings

The flood fill tool has several important settings. They appear in the same place as e.g. your brush settings do when you have the brush or eraser selected.

![Flood fill settings]({{ "/assets/img/help/floodfillsettings.webp" | relative_url }})

### Size Limit

The tool has a size limit to prevent the fill from spilling all across the canvas and "flashbanging" everybody else. The limit is a square area around the cursor.

![Flood fill size limit]({{ "/assets/img/help/floodfillrect.webp" | relative_url }})

You can adjust the size limit by using the slider in the tool settings or by using the same shortcuts that you use to change your brush size (`[` and `]` by default, or `Shift` + `Left Click` and dragging left and right, or `Shift` + `Middle Click` and dragging up and down.) Either make the size limit large enough to encompass the entire area you want to fill or do multiple separate fills. Using the latter technique also makes it easier to find holes in your lines.

You can also make the size limit so large that it encompasses the entire canvas to make it behave like fill tools in other programs. However, this is likely to make other people you're drawing with pretty annoyed because you'll keep disrupting their drawings with your spills.

Large areas can take a while to fill in one go.

### Tolerance

The tolerance decides how close a color in the source image needs to be to get filled. Zero means that the color needs to match exactly, higher values increase the distance.

When you are filling a transparent area, only the opacity matters.

### Expand

This setting decides how many pixels the fill should be expanded after applying it. You can use this to grow the fill into the surrounding lines.

Expanding by larger values may take a while.

### Feather

Feathering blurs the fill. This smoothes out the edges, rather than having them be hard pixels. Feathering is applied after [expansion](#expand).

Large feather values may take a while to process.

### Close Gaps

Also known as line detection or sandbagging. This will attempt to compensate for gaps in your lines to prevent spills.

At the time of writing, Drawpile's algorithm for gap closing is pretty simplistic. Especially larger values will have trouble filling into small corners and crannies. However, it may still be faster to fix up those obvious little corners than hunting for difficult to spot gaps in your lines.

Large gap close values can take a while to process.

### Source

Decides where the fill tool takes its border area from. You usually set this to your lines layer and fill on a colors layer below.

Instead of picking a layer from the dropdown, an easier option is probably to right-click on a layer and selecting Set as Fill Source, or selecting a layer and using Layer → Set as Fill Source from the window menu.

![Set as fill source]({{ "/assets/img/help/setasfillsource.webp" | relative_url }})

### Mode

The blend mode that the fill tool uses. The blend modes work like they do for brushes.
