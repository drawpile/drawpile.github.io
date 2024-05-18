---
layout: drawpile_post
title: "Dev Update: Weeks 18 to 20 of 2024"
date: 2024-05-18 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---

The last three weeks were pretty busy, but a lot of new stuff hapened. Selections and transforms are totally rewritten, there's now a pixel ruler and the browser version of Drawpile now works better in standalone mode.

Everything here is available [in the continuous release](https://github.com/drawpile/Drawpile/releases/tag/continuous){:target="_blank"}.

## Selections Rework

The implementation for selections and transforms has been replaced entirely, solving many issues and making it possible to extend them further.

Selections and transforms are now properly separated. They already were sort of separate before, but the program made them look the same, so it was pretty hard to tell if what you had in front of you was a selection or a transform.

Selections are now persistent on the canvas. You can add to an existing selection (Shift), remove from it (Alt) or intersect with it (Shift+Alt). They no longer disappear when you switch tools, to remove a selection, you click outside of it. They also have an alpha channel now, so you can, for example, toggle anti-aliasing in the selection tools. Selection operations can be undone and redone.

Selection and transform actions are under the Select menu now, to not bloat the Edit menu too much. There's an Invert Selection action, which swaps the opaque and transparent parts of a selection. Select Layer Bounds will select everything on the current layer so that you can transform it. Layer to Selection will turn the contents of the current layer into a selection, which you can use to effectively "draw" selections.

Transforms are triggered either by clicking on a selection, pressing the Transform button in the selection settings or activating the Transform action (default shortcut is T.) This will start a transform and return to the current tool when it's done. Alternatively, you can manually switch to the new transform tool and click anywhere to begin a transform.

When transforming, the cursor now changes depending on what part of the transform you're interacting with. The handles on the corners and edges are also a bit larger now and turn from partially transparent to opaque when you hover over them.

Transforms are now rotated by clicking outside of them and dragging, shearing is done by clicking on an edge. That means there's only two modes now, scale and distort; the third rotate/shear mode is no longer needed. Switching modes is still done the same way by clicking into the transform. Scaling and skewing are no longer locked to cardinal axes, they now pay mind to the rotation and distortion of the transform.

Clicking outside a transform no longer applies it immediately, which was a frequent source of grief because a single misclick would mean you had to start your transform all over. To apply a transform now, you now either double-click outside of it, hit enter or use the apply button in the transform settings. You can also undo and redo steps in a transform while it's active.

Holding Shift will constrain a move along either the X or Y axis, retain the aspect ratio when scaling from a corner, rotate in 15° steps or keep an edge distortion on its own axis. Holding Alt will scale from the center of the transform.

Invalid transforms that you can create by distortion now no longer cause weird visual glitches, they instead just turn red and refuse to continue.

All of this is compatible with Drawpile 2.2.1, the selection commands are simply ignored by older clients. It's also compatible with Drawpile 2.1, although you don't get an alpha channel there. Also, when you're drawing in a session hosted "on this computer", you need the "Cut, Paste & Fill" permission to use selections, since those servers don't allow unknown commands to be issued and so the selection commands need to be disguised as paste commands. When you're on a regular server, no special permissions are needed.

There's still a lot more to do with this stuff, like growing/shrinking selections, feathering, letting you transform multiple layers and more. But this is a big step toward making all that actually possible.

Here's a video showing all that off. Some actions involve keys being pressed, look in the bottom-left corner for those.

<video controls>
  <source src="{{ "/assets/vid/2024-05-18_selectionsrework.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Pixel Ruler

Using View → Show Rulers, you now get a pixel ruler around the canvas. It scales depending on your zoom level.

This was [contributed by fluttershydev](https://github.com/drawpile/Drawpile/pull/1302){:target="_blank"}.

## Small-Screen Mode Improvements

Small-screen mode is enabled automatically on Android and in the browser if you have a device with a small screen. Some issues with it have been fixed.

The toggle items on the sides of the canvas are now vertically offset from one another, so that they no longer overlap on devices with very small screens when docks are opened up.

Dialogs get maximized if appropriate, rather than having them be windows that spill over the edge of the screen.

The start dialog and settings dialog now get arranged horizontally instead of vertically.

## Browser Client

The web browser version of Drawpile no longer shows the "in development" warning, since there's nothing critical left. It instead now starts automatically if it has nothing else to say, instead of making you click on the Start button.

If you're on a browser with known incompatibilities, it will show a warning in that regard. This primarily affects Firefox, since it has trouble with tablet support and Qt doesn't seem to deal with it properly.

Failed connections now try to intuit what happened, giving you a clue as to what's wrong. It can't really know for sure, but it can guess at issues with certificates for example.

Browsing, joining and hosting should now work properly in the browser, as long as the target server is set up properly. If you try to use a non-WebSocket link, the client will try to translate it over, which should work fine unless the server owner uses a weird setup. Note that most servers don't currently allow you to host sessions from the browser though.

## Minor Additions and Bugfixes

Depressed buttons now have better contrast on dark themes. Patched around in Qt because it uses a fixed contrast that's just pretty bad. This was reported by MorrowShore.

The extension arrow buttons on menus and toolbars are now actually visible on dark themes. Qt just hard-codes them to be black, so we patch around on that.

The Linux Flatpak should no longer crash when hosting. This is a bug in Qt 6.6 and later on Linux, apparently. This was reported by Vanska [on Discord](https://drawpile.net/discord/){:target="_blank"}.

Tabbed windows work again on macOS now. Qt had patched that out, we patch it back in. This was reported by mira [on Discord](https://drawpile.net/discord/){:target="_blank"}.

Synthetic mouse clicks caused by some touch devices on Windows are now ignored. This was reported by sfin [on Discord](https://drawpile.net/discord/){:target="_blank"}.
