---
layout: drawpile_post
title:  "Dev Update: Week 44 of 2023"
date: 2023-11-06 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---

This week was a few further animation and server adjustments. Currently thinking of putting out the next beta release in the coming week.

Assuming I get things ready early enough next week to give the translators some time to update the text, so not too certain on this yet. That next release would freeze the features for Drawpile 2.2.0 anyway, meaning that only bugfixes would be done until the actual release, giving some time for testing, updating documentation etc. without having to account for even more new stuff.

As always, anything you see here is available [in the development release](https://github.com/drawpile/Drawpile/releases/tag/continuous){:target="_blank"}.

## Flipbook Improvements

The flipbook (the thing you preview animations with) will no longer cause the user interface to chug while it renders frames. Instead it now renders them in the background, showing a loading spinner in the corner if it's currently busy. It also uses multiple CPU cores for the rendering, so it should get done faster than it did before.

If you have an area of the canvas selected before opening the flipbook, it will now automatically crop to that area when you do open it. That cuts out the step of fiddling with the cropping until it looks just right.

The flipbook user interface should also be a bit clearer now. The buttons now actually look like buttons, the zoom-out button now only shows up when you can actually zoom out and the playback speed slider shows you how many FPS you're currently viewing the animation at, rather than only the percentage speed.

## Account Rememberage

Drawpile will now remember previous accounts that you logged in with and give you quick access to them when you connect to a server that's aware of this account. For folks who only use a single account and username, this means that they can just hit return like before and they'll be in. For people with multiple accounts and/or usernames, they no longer have to re-type the name over and over, instead they can just pick from the list.

If you want to change or avatar or enter an updated password, you can press the "edit and log in" button instead, which will auto-fill the login form, but not send it off yet.

<div class="notification">
    <span class="fa fa-circle-info"></span> This is only available if the server is updated. At the time of writing, most servers aren't yet.
</div>

![Recent accounts page]({{ "/assets/img/2023-11-06_accounts.webp" | relative_url }}){:#recentaccounts}

## Server Rules

Server owners can now configure rules for their servers, which will be shown when you connect to them and you are prompted to accept or decline them.

By default, Drawpile will remember that you accepted the rules for a server and not bug you about it again unless they change. If you want to read them agin anyway, you can do so by clicking on the "Rules" button that you see at the bottom of [the screenshot above](#recentaccounts).

<div class="notification">
    <span class="fa fa-circle-info"></span> This is only available if the server is updated. At the time of writing, most servers aren't yet.
</div>

![Server rules page]({{ "/assets/img/2023-11-06_rules.webp" | relative_url }})

## Minor Additions and Selected Bugfixes

Saving and loading no longer relies on file extensions to be correct, instead Drawpile will now look inside the file to see what format it is. This is especially important on Android, where some special folders mangle the actual file path into gibberish, which caused confusing errors before.
