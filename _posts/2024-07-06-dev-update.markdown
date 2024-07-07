---
layout: drawpile_post
title: "Dev Update: Week 26 and 27 of 2024"
date: 2024-07-06 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---

The last two weeks have been some more work on filling and selections. I think this may be the point where no new strings are added before the next beta release, so unless something comes to me, translations will open for it soon.

If you want to try out the stuff here, where not otherwise mentioned it's [in the continuous development release](https://github.com/drawpile/Drawpile/releases/tag/continuous){:target="_blank"}.

## More Fillage

The fill and magic wand tools will no longer feather along the canvas edges.

You can also now toggle the Expand slider to be a Shrink slider instead, making the expansion work in reverse.

These were reported by Meru [on Discord](https://drawpile.net/discord/){:target="_blank"}.

## Selection Alteration

You can now expand, shrink and feather (blur) selections. This can be done via Selection → Expand/Shrink/Feather Selection. This will present you with a dialog where you can pick what to do to your selection in that regard.

This was suggested by MorrowShore [on GitHub](https://github.com/drawpile/Drawpile/issues/1306){:target="_blank"}.

## Local Selections

Selection operations are now local-only. That means that making large selections won't slow other people down and connecting to a session won't pointlessly process stuff during catchup unnecessarily. Since currently selections don't have any visual effect, this doesn't cause any kind of desync.

The way this works is by only sending a "local match" message across the network. Other users will ignore this message, since they have nothing to match it to, but the client that sent it will be able to match it with the real command that happened locally and know that it's synchronized properly.

In the future, pieces of a selection can be sent across the network as needed to implement stuff like brush masking with selections or maybe also a "draw within the lines" mode. Drawpile supports multiple selections per user under the hood of which it currently only uses a single one with ID 1. So it could use ID 2 for brush masking in the future and ID 3 for drawing with in the lines. It can send only the parts of those selections that are actually needed, thereby avoiding slowdowns from huge selections being applied all at once.

## Indirect Blend Mode Switchery

Indirect mode in Drawpile is also called "wash" or "opacity" (as opposed to "flow") in other programs. It keeps the opacity across a stroke consistent.

The way Drawpile implements this allows for softer brushes than in e.g. Krita. However, this doesn't look particularly nice if you want to overlap strokes.

A more Krita-esque blend mode has been implemented now. It doesn't allow brushes to get as soft as they do with the current way they're implemented, but avoid most of the artifacting issues. It'll probably be appearing in Drawpile 2.3.0 as the default option, but won't be introduced into 2.2 since it would cause desync. We'll probably keep the old one as an option though, since it's useful for stuff like soft line brushes, where you don't overlap them anyway.

In the picture below you can see a comparison of it. Left is the current one, right is the new one.

![Indirect modes comparison]({{ "/assets/img/2024-07-06_indirect.webp" | relative_url }})

## Minor Additions and Bugfixes

Drawpile's dependencies have been bumped to the latest versions.

Selections now don't randomly start in the wrong view mode anymore, they will use the mask view if you enabled that and the marching ants if you didn't. This was reported by Blozzom [on Discord](https://drawpile.net/discord/){:target="_blank"}.

The selection outline will no longer be generated if your selection is overly large, since that can run you out of memory. It will instead always use the mask view in that case. This was also reported by Blozzom [on Discord](https://drawpile.net/discord/){:target="_blank"}.

You can now specify `idleOverride` and `allowWeb` in the dedicated server's session templates, the options were missing from there. This was reported by MorrowShore.
