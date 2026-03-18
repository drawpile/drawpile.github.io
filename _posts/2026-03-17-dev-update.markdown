---
layout: drawpile_post
title: "Dev Update: Week 10 and 11 of 2026"
date: 2026-03-17 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---

The last two weeks have had a good number of animation and other improvements. You can try out this stuff [in the alpha release](https://github.com/drawpile/Drawpile/releases/tag/continuous){:target="_blank"}.

## Autorecovery Renaming

The "autosave" feature is now called "autorecovery" because that probably describes better what it does and separates it from the previous *actual* "autosave" feature where Drawpile would basically just periodically hit Ctrl+S for you. From seeing issues with that kind of thing with Krita, many users associate that exact behavior with autosaving, so it's a better idea to use a different name I think.

It still doesn't really describe *fully* what it does, since you also need to enable autorecovery to get timelapses and project statistics, but it's probably close enough.

## Spinner Sliding

You can now drag over most numeric inputs in Drawpile to adjust their value. This makes them less annoying to input without a keyboard. As a side-effect, you can also now enter math expressions into them (like you can into sliders too.)

I still find that it often changes the value while lifting the stylus, since that naturally introduces some jitter. That can probably be solved by adding a bit more drag resistance if you held the cursor in a single position for a bit.

This was suggested by LingjenKaos [on the Krita-Artists forum](https://krita-artists.org/t/increase-or-decrease-values-by-hovering-and-dragging-left-or-right-just-like-in-blender-and-davinci-resolve/172305){:target="_blank"} and may make it into Krita if it has positive reception in Drawpile.

<video controls>
  <source src="{{ "/assets/vid/2026-03-17_slider.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Timeline Exposure Tool

The timeline now has an exposure "tool" that lets you drag to increase or decrease key frame exposures. This basically makes the timeline usable if you don't have a keyboard to change exposure and it's also more comfortable and performant than repeating the same action. You can also access this by holding the Alt key.

Dragging across a single track changes the exposure of that track, dragging across multiple tracks changes it on all within the range. Dragging over the header changes the exposure across all tracks.

<video controls>
  <source src="{{ "/assets/vid/2026-03-17_exposure.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Timeline Zoom

The timeline can now be zoomed. This makes the key frames wider or narrower horizontally.

You can also zoom it by holding Ctrl and spinning the mouse wheel.

This was suggested by Myathingoss.

<video controls>
  <source src="{{ "/assets/vid/2026-03-17_timelinezoom.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Key Frame Move Locking

You can now lock tracks for yourself to prevent accidental moving of key frames. This is useful when you're in the coloring stage for example and definitely don't want to be throwing frames out of order.

This feature isn't fully baked yet. The icon definitely needs to be different, since a lock is too strong of an indicator. It also probably should let you drag over the key frames like you can over the header instead of doing nothing at all. The exposure tool should probably also ignore move-locked tracks, which would let you move multiple tracks at once without them having to be adjacent. Feedback on this would be appreciated.

This was suggested by Saphiros.

<video controls>
  <source src="{{ "/assets/vid/2026-03-17_draglock.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Flipbook Looping

"Reverse" ranges in the flipbook will now play back everything outside of the given range.

That is, when you for example have an animation that goes from frame 1 to 100 and you enter a range from 90 to 10, it will play back frames 1 to 10, then skip to 90 to 100. This is useful if you're making a looping animation and don't want to keep watching the entire thing all over again if you're working on the looping bit.

These ranges don't export correctly yet. This was also suggested by Saphiros.

<video controls>
  <source src="{{ "/assets/vid/2026-03-17_reverseloop.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Minor Additions and Bugfixes

The track controls on the timeline are now above the tracks in the area that was previously just a blank space. This saves some room in the (still very wide) docker header.

Deleting a key frame that is only assigned to a single layer now also deletes the associated layer by default, since that's probably the more common desire than leaving a stray layer laying around. Unlinking a key frame is now a different action.

The short settings page now has an "overview" tab that explains the different flavors of shortcuts. It seems like the tabs at the top often got missed when users were searching for e.g. a way to rebind a canvas shortcut, so this hopefully makes that better.

The main menu bar actions (File, Edit, View etc.) can now be assigned to action shortcuts, by default they are on Alt+F, Alt+E etc. like before. They're no longer dependent on the language you have Drawpile set to.

In that regard, hitting Alt on its own will no longer cause the main menu bar to steal your keyboard focus.
