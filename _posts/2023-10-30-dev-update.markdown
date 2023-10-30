---
layout: drawpile_post
title:  "Dev Update: Week 43 of 2023"
date: 2023-10-30 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---

Other than a pile of fixes, this week was spent mostly on making importing animations from Drawpile 2.1 possible, rejigging the server login flow and building stuff on Windows.

As always, anything you see here is available [in the development release](https://github.com/drawpile/Drawpile/releases/tag/continuous){:target="_blank"}.

## Drawpile 2.1 Animation Import

You can now import animations through File → Import → Import Drawpile 2.1 animation…

It lets you pick an ORA file that contains an animation made in Drawpile 2.1 and will convert it into the same animation using Drawpile 2.2's timeline. That is, it will turn regular layers into frames in the timeline and give fixed layers their own tracks that exist for the entire duration of the animation. The frames will be put into a layer group. You can choose how many frames each key frame should last when importing them, in case you want to animate on twos, threes etc.

For most animations, this means that you'll have your fixed layers at the top and bottom, with all the frames in a group between them. If your animation is weird and uses fixed layers in the middle, you'll get multiple groups, split by those fixed layers. The result should look the same when playing it back anyway.

## Reworked Login Flow

The login flow for Drawpile servers is pretty strange. You enter a username and the server uses that to guess what you meant. If the name isn't registered, it will assume you want to join as a guest, otherwise it will prompt you for a password.

This causes a very common problem: someone wants to join as a guest, but they accidentally pick a username that's already taken. When they're asked for a password, they enter the *session* password, which just leads to them getting booted out of the login process being told that the password is wrong. This then commences a confusing mess of trying to figure out why the password that's working for everyone else isn't working for them, until they (hopefully) finally realize that it's the username that's the problem.

So now the login flow works like it does everywhere else: the first step is to ask you how you want to log in. Here you can pick between logging in using an external account (probably one on `drawpile.net`), an account on the server itself or as a guest. When you try to join as a guest and pick a username that's taken, you'll be told that fact and to pick a different one. Similarly, if you try to join with an external account but the name is taken by an internal one. You'll also only be shown the options that the server actually supports for what you're trying to do, so for example if it doesn't allow guests to host a session, it won't offer that as an option when you're hosting.

Server owners can provide a link for more information on how to register an account, which will be shown in this first step. If the server uses `drawpile.net` for authentication, Drawpile will also include a link on how to register an account there.

As another bonus, you also don't get kicked out of the login process when you enter an incorrect password. This was especially annoying for session passwords, since it made you have to start the login process all the way from the beginning just because you made a typo at the last step. Now it just tells you that the password is wrong and lets you try again.

<div class="notification">
    <span class="fa fa-circle-info"></span> This is only available if the server is updated. At the time of writing, most servers aren't yet.
</div>

## Onion Skin Wrap

Onion skins will now wrap around the timeline by default. So if you're making a loop, you will see the frames from the beginning when you're looking at a frame at the end.

This is enabled by default, but can be toggled in the onion skins dock. It was suggested by Hopfel.

## Background Layer Translation

Some programs, such as Krita or GIMP, don't support a canvas background like Drawpile does. Instead, if you want a background in those programs, you stick a filled layer at the bottom of the stack. That makes working with those programs kind of annoying though, because you either have to deal with this pointless layer at the bottom or manually delete it and set the canvas background color.

So now when you load an ORA or PSD file, Drawpile will check if the bottom layer looks like a background – a Normal layer at 100% opacity filled with a singular color – and automatically turn it into one.

Nothing changed about saving these files in that regard, Drawpile already did that in a way that made those other programs load a filled layer at the bottom.

## Windows Buildage

Building on Windows is now documented better and should work without having to manually copy stuff around. This probably needs some further testing from a fresh system, since my own is already polluted with a bunch of development tools, but what's in the README should now be a bit more usable.

This also lead to a 32 bit version of Drawpile getting built again, which will probably be available for the 2.2.0 for devices that really need it. It's not recommended, since you run into trouble with larger canvas sizes and such, but it'll be an option.

Reported to still be needed for some devices [on GitHub](https://github.com/drawpile/Drawpile/issues/1155).

## Minor Additions and Selected Bugfixes

More stuff was fixed on PSD saving. Now even Photoshop will open the PSD files produced by Drawpile (because apparently they don't read their own file format specification and require something that's marked optional in there.) Layer names with non-ASCII characters should now also work properly. Thanks to xxxx for reporting and helping test this stuff.

The other tool slots now no longer get disabled when you switch to the eraser, allowing you to get out of it again easier.

Alt+Space canvas shortcuts should now sorta work on Windows, rather than opening the pointless menu at the top-left that I don't think anybody ever uses. This probably doesn't work 100% still, since it requires some terribly hacky rummaging around in Qt's internals, but should be better than before. Reported by xxxx and Bovy.

Catchup after a session reset should now no longer get stuck even if the server isn't updated.
