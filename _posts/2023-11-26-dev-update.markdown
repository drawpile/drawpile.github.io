---
layout: drawpile_post
title:  "Dev Update: Week 47 of 2023"
date: 2023-11-26 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---

This week has been mostly bugfixes again, encroaching further on the final release of Drawpile 2.2.0. Everything described here is, as always, available in the [in the continuous development release](https://github.com/drawpile/Drawpile/releases/tag/continuous){:target="_blank"}.

## Tablet Driving

On Windows, you can change the way Drawpile handles tablet input through Edit → Preferences → Input → Driver. It's pretty common that you have to try all the options here if you're new to Drawpile, switch tablets or get one of those Windows updates that ruin everything. But that takes quite a lot of clicks when you want to try several of them (which you usually do.)

So now you can do it more quickly through Edit → Tablet Drivers. The old way is still there, the new one is just a shortcut.

![Tablet Drivers menu]({{ "/assets/img/help/tabletdriver.webp" | relative_url }})

## Tablet Detroubling

There's now a help article on [tablet setup and troubleshooting](/help/tech/tablet), which tries to help get tablets working when they refuse to do so.

This help page is also linked in the start dialog now, in the hopes that at least some users will spot it there.

## Login Flow Shortcut

Drawpile will no longer ask you which way you want to log in if the server you're connecting to only supports guest logins and internal server accounts, but no external authentication (like with drawpile.net accounts.) Instead, it works more like the old login flow, asking you just for a name. If that name belongs to a server account, it will tell you to log into it.

This is because these kinds of servers will have only very few user accounts, so the likelihood of accidentally picking a username that's already taken is very slim, which was the whole reason why the flow was changed. Worse, some users might try to log in with their drawpile.net account and then get confused why it's not working. So this new way shortcuts the complication and will let them log in as a guest with a single click.

If you are one of the few people that *do* have an account on a server like this, it'll show up in your recent accounts after you log in with it once, letting you log in again with one click too.

<div class="notification">
    <span class="fa fa-circle-info"></span> This is only available if the server is updated. At the time of writing, most servers aren't yet.
</div>

## Web Admin

The [dpwebadmin frontend](https://github.com/drawpile/dpwebadmin) has been updated to include the new settings introduced with Drawpile 2.2. It lets you, among other things, write a server rules text, send a message to all running sessions or bans from external sources.

At the time of writing, you have to use the `dev-2.2` branch to get this stuff, since some scripts still rely on `master` being the 2.1-compatible version.

## Minor Additions and Selected Bugfixes

Canvas rendering will no longer get stuck when toggling view modes or animation frames quickly. This was reported by Kink and Hopfel directly.

Drawpile will no longer crash when attempting to change the saturation in a color dialog in HSV or HCL mode if the current color has an indeterminate saturation. This was reported by Meru [on Discord](https:/drawpile.net/discord).

Floating selections now handle Copy Merged, Copy Without Background and Fill/Recolor/Color Erase Selection properly (even though it's kind of weird to use those things with floating selections.) Also reported by Meru [on Discord](https:/drawpile.net/discord).

Export Selection, Copy Merged and Copy Without Background now adhere to the current view mode (layer view, frame view and onion skins.) Before they would always use the normal view instead. Reported by Bovy directly.

The fill tool also adheres to the current view mode now, except it always ignores onion skins because you don't want to fill those. Again reported by Meru [on Discord](https:/drawpile.net/discord).

ORA files without a background now load annotations and the timeline properly. Reported by MyaThingoss [on Discord](https:/drawpile.net/discord).

Using Fill/Recolor/Color Erase Selection now adds that color to the recent colors swatch. For equalizing justice, tools that don't put any color on the canvas, such as the inspector or zoom tool, no longer add the current color to the recent colors swatch when you use them.

The recent colors swatch will now properly switch to the current color when only the palette is visible and you switch between different brush slots. Reported by Meru [on Discord](https:/drawpile.net/discord).

Deleting a recent user account no longer deadlocks the application.

The dock titlebars no longer get hidden if you hold shift while you're editing text, since that could cause the thing you're currently writing into to disappear from under you. Reported by Trite directly.

The Hold Shift to Arrange option that causes those title bars to disappear is also disabled by default now. Most new users don't get why it happens and any user that actually wants to customize their docks will probably look at the menu and notice that they can turn this option on.
