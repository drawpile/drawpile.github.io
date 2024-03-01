---
layout: drawpile_help
title: "Updating to Drawpile 2.2"
description: "The important stuff that changed between 2.1 and 2.2."
date: 2023-09-29 00:00:00 +0200
category: "help"
tag: help common
---

Drawpile 2.2 is a major new version with many improvements. To update from version 2.1, head to [the download page](https://drawpile.net/download/) and get the latest version. It's backward-compatible, so you can still join sessions hosted with the old version.

On Windows, if your pen pressure does not work after the update, go into Edit → Tablet Driver and try one of the other options you find there, one of them should work. Refer to [the tablet setup page](/help/tech/tablet) for more information.

Since the user interface changed, the layout you had arranged may not look right anymore. You can enable View → Docks → Hold Shift to Arrange to make it easier to drag the docks around. You can also go into View → Layouts to pick a predefined layout instead and save your favorite layouts there.

If you're having some other kind of problem with the new version, refer to [the help page](https://drawpile.net/help/) or join directly into [Discord](https://drawpile.net/discord/) or [the web chat](https://drawpile.net/irc/) so that we can get it fixed! You can continue to use Drawpile 2.1 for now, but the community servers will disable support for it eventually, so better to report issues now than later.

Below you can find a list of stuff that's changed.

* Table of contents
{:toc}

<div class="columns is-vcentered">
<div class="column is-three-quarters" markdown="1">

## Android and Web Browser Versions

Drawpile is now available for Android and for Web Browsers, which also works on iOS. It comes with a small-screen mode so that it can be used on phones and other devices that can't handle the full desktop layout.

You can get the Android version on [the download page](https://drawpile.net/download/). It's not currently on any store yet, but that'll probably come in the future.

To let someone use the Web Browser version, you have to invite them to a session on a server that supports it. For example, when you host a session with a password on pub.drawpile.net and the invite link will [give the option to join via web browser](joining#joining-via-web-browser). To find out which of the community servers support Web Browsers, take a look at [the Communities page](https://drawpile.net/communities/).

For server owners, there's [instructions on how to enable the Web Browser version for your server](/help/server/websocket).

</div>
<div class="column">
<a href="{{ "/assets/img/help/smallscreenmode.webp" | relative_url }}" target="_blank"><img src="{{ "/assets/img/help/smallscreenmode.webp" | relative_url }}" alt="Drawpile in small-screen mode"></a>
</div>
</div>

<div class="columns is-vcentered">
<div class="column">
<a href="{{ "/assets/img/help/brushpresets.webp" | relative_url }}" target="_blank"><img src="{{ "/assets/img/help/brushpresets.webp" | relative_url }}" alt="Brush presets that ship with Drawpile"></a>
</div>
<div class="column" markdown="1">

## New Brushes and Stabilizer

Drawpile now supports the MyPaint brush engine, which allows for many different kinds of effects that weren't possible before. It also comes with over 200 brushes built-in, with anything from pencils over paint brushes to smudging and blurring.

All the old brushes are still around and you can configure them more comprehensively in [the new brush settings dialog](/help/draw/brushsettings#brush-settings-dialog). This replaces the "Input" dock, curves and dynamics are now attached to the brushes themselves, like they are in any other drawing program.

There's also now [a proper stabilizer](/help/draw/stabilization#brush-stabilization) that works much like the one from e.g. Krita or Paint Tool SAI. The old smoothing stabilization is still around as an option too.

Brushes can be [imported, exported and directly shared when drawing online](/help/draw/brushsharing).

</div>
</div>

<div class="columns is-vcentered">
<div class="column is-two-thirds" markdown="1">

## Layer Groups, Clipping and Masking

There's now layer groups ("folders") to let you organize your session better. Participants can stick all their stuff into a group, rather than having all those layers strewn around in one big list.

Layer groups automatically act as clipping groups. When you pick a blend mode other than Normal, it will clip to the stuff below it. You can also use the new Erase blend mode to make a mask. For more information on that, check out [the page on alpha preserve, clipping groups, masks and alpha lock](/help/draw/clipping).

Speaking of which, there's also several new blend modes: Screen, Overlay, Hard Light, Soft Light, Linear Burn, Linear Light, Luminosity/Shine (SAI), Hue, Saturation, Luminosity and Color. Recolor is also available for layers now, rather than just brushes. It acts like Normal, but with clipping.

</div>
<div class="column">
<a href="{{ "/assets/img/help/layergroups.webp" | relative_url }}" target="_blank"><img src="{{ "/assets/img/help/layergroups.webp" | relative_url }}" alt="Layer groups in Drawpile"></a>
</div>
</div>

<div class="columns is-vcentered">
<div class="column">
<a href="{{ "/assets/img/help/uistyles.webp" | relative_url }}" target="_blank"><img src="{{ "/assets/img/help/uistyles.webp" | relative_url }}" alt="Different Drawpile UI styles"></a>
</div>
<div class="column is-two-thirds" markdown="1">

## Nicer User Interface

Drawpile's UI is now in dark mode by default and no longer looks like it's a Windows 95 program. Although if you're into that, it's still available in the preferences, along with other color schemes and styles.

When you start the program, it will now no longer just dump you into a blank canvas and make you pick through the menu at the top to get where you want to go. Instead, it shows a startup dialog that has everything accessible with a single click.

The docks have been condensed so that they fit better on smaller screens and you can now arrange them more freely. You can also now save and load layouts under View → Layouts, so if you use a different arrangement for animation, online and solo drawing, you can set those up here. There's also some presets built-in that are akin to other drawing programs.

Tablet-friendly sliders are now used everywhere, which are easier to operate with a pen. You can also enable kinetic scrolling in the preferences, letting you scroll stuff by flicking it with your finger or pen.

For displays with a large resolution, you can enable high-DPI scaling in the preferences. You can also change the scale and font size there, if the system doesn't get it right.

The sound effects have also been replaced with a set that's gentler on the ears. No more getting startled by a sudden, loud door slamming sound because someone left your session.

Finally, you can set up custom color schemes, icons and sounds. See [this page on how to customize them](/help/tech/customassets).

</div>
</div>

<div class="columns is-vcentered">
<div class="column" markdown="1">

## Invite Links

When you host a session in Drawpile, you are now prompted to copy an invite link to give to the folks you want to join the session. You can also get one via Session → Invite or using the Invite button at the top of the user list in the chat.

Clicking on this link will bring you to a page like the one shown on the right, with the option to copy the link, open Drawpile or (if the server supports and allows it) join directly via the web browser. There's also a link to where to download Drawpile. If your session has a password on it, the link will also include that automatically.

This should reduce the amount of fiddling needed to invite someone to a session, just give them the link and that's it.

The old ways still work of course. Joining a session by manually typing in an IP address, using the server browser and so on is possible just like before.

</div>
<div class="column">
<a href="{{ "/assets/img/help/webinvite.webp" | relative_url }}" target="_blank"><img src="{{ "/assets/img/help/webinvite.webp" | relative_url }}" alt="Invite link page"></a>
</div>
</div>

## Animation Timeline

While the previous version of Drawpile had some simple animation support, there's now a full animation timeline in Drawpile. It lets you collaborate on a single animation together or do smaller animations as part of a larger canvas. You can also mix regular drawings and animations on a single canvas.

Read [the page on animation](/help/draw/animation) for how to get this going.

<a href="{{ "/assets/img/help/timelineonionskins.webp" | relative_url }}" target="_blank"><img src="{{ "/assets/img/help/timelineonionskins.webp" | relative_url }}" alt="Timeline and onion skins"></a>

## Performance Improvements

The whole program has gotten significantly faster than it used to be.

It now makes use of multiple CPU cores so that big drawing operations no longer cause the entire application to chug. Many common operations have also been sped up using vector processing.

When you do something that affects the entire canvas, such as hiding a layer or switching view modes, it will now update the canvas gradually, rather than hanging the whole program during one big heave. The navigator will also no longer cause chugging, since it also uses these gradual updates.

## New Community Servers

Okay, this isn't really related to Drawpile 2.2, but there's new servers that joined the roster of official community servers and they're cool. You can find them [on the communities page](https://drawpile.net/communities/).

These servers are in different locations, so if you're experiencing high latency, hosting on one of these other servers could improve it. Several of them also provider longer idle timeouts than pub.drawpile.net, so if you want to host sessions that keep going over multiple days, you can do so on them.

## And Much More

There's a lot of other stuff that changed.

* You can increase the undo limit up to 255 under Session → Undo Limit. Before, it was capped at 30.
* The flood fill tool now has gap closing, feathering and a size limit you can actually see. See [the page on the flood fill tool](/help/draw/floodfill) for details.
* Drawpile now uses 15 bit color channels rather than 8 bit, which prevents the funky artifacts that used to happen when painting with low opacity.
* Indirect drawing mode now works propely. It's also known as Wash mode or Opacity (as opposed to Flow) mode in other programs.
* You can configure canvas shortcuts more freely now, allowing you to e.g. zoom the canvas by just scrolling, rather than having to hold Ctrl for it.
* You can change the canvas background only for yourself via Edit → Canvas Background → Set Local Background. If someone is using a blindingly white canvas background, you can set this to something less eye-searing this way (or vice-versa, if you're into that.)
* Transforms now have the option between bilinear and nearest-neighbor interpolation, the latter is useful for pixel art. The transform preview is also now actually accurate, shown on the correct layer and with the proper blend mode, rather than just being a graphic on top that didn't accurately represent what the result would look like.
* There's now a color swatch on top of the color wheel, sliders and palette that shows the most recent set of colors used.
* Added shortcuts for stuff like switching to Recolor mode, picking a color from the screen, swapping brush slots, resetting a brush to the last preset and more.
* Drawpile now has a channel [on the libera.chat IRC network](https://drawpile.net/irc/).

And probably still more stuff. You can read the changelogs of the development versions of Drawpile 2.2 [in the news section of the website](https://drawpile.net/news/) if you're interested in the whole gamut.

There's also a [development blog](https://docs.drawpile.net/devblog/) that's updated regularly and talks about the stuff that's being worked on.
