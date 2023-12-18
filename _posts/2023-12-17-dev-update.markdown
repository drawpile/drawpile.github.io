---
layout: drawpile_post
title:  "Dev Update: Week 49 and 50 of 2023"
date: 2023-12-17 00:00:00 +0100
category: "devblog"
tag: "@askmeaboutloom"
---

We're closing in on the final release of Drawpile 2.2.0. Beta 11 was released two weeks ago and is expected to be the last beta. There's mostly been organizational stuff these past two weeks.

As always, everything mentioned is available in the [in the continuous development release](https://github.com/drawpile/Drawpile/releases/tag/continuous){:target="_blank"}.

## Documentation Expansion

The documentation is being updated and several new and old topics are now available [on this site](/help/).

There's still some stuff missing, most significantly a guide on how to animate with Drawpile and an explanation of how the fill tool works, since both of those are pretty Drawpile-specific. But there's also still some other, scattered documentation to consolidate and update.

## Packaging

The [Dockerfile for drawpile-srv](https://github.com/drawpile/Drawpile/tree/main/pkg/docker) has been updated for Drawpile 2.2. The flatpak build scripts have also been updated. Neither of these have been released yet, but are functional.

There's also a page of [notes for packagers](/help/development/packaging) written. If you want your Linux distribution to provide packages for Drawpile, you can link to this page in your request for it.

## List Server Improvements

The listings at the bottom of [the community servers](https://drawpile.net/communities/) have been updated to be a bit more usable, especially on mobile devices. They also now let you filter sessions similar to how you do it in Drawpile itself.

The list server itself has gained some caching options for included servers. You can for example tell it to remember the host and port of an included server for 24 hours and the sessions for one minute, which is plenty for the purposes of listing sessions and avoids pelting the server for updates about data that doesn't change that quickly.

If you include more than one server, requests to those will now be made in parallel. The requests also have a configurable timeout now.

Finally, the list server now no longer allows listing sessions that are on an included server because that's pointless. Those sessions are already listed automatically, so listing them again manually does nothing useful.

## Server Securing

You can now use elliptic curve certificates in drawpile-srv, rather than only RSA ones. It will attempt to guess the type of certificate by default, but you can also explicitly specify it through the new `--ssl-key-algorithm` command-line argument. This was reported by Bluestrings directly.

You can also now specify the web admin username and password through the `DRAWPILESRV_WEB_ADMIN_AUTH` environment variable, rather than passing it as a command-line parameter. This is just a more proper way to handle a parameter like that.

## Minor Additions and Selected Bugfixes

Typing numbers into the brush sliders will no longer make them lose focus after the first digit. Reported by MachKerman [on Discord](https://drawpile.net/discord/){_target="_blank"}.

The fill tool size limit rectangle is now visible even when you turn off the brush cursor. Reported by Blozzom [on Discord](https://drawpile.net/discord/){_target="_blank"}.

Drawpile will no longer jump to every newly created layer if there's a default layer present.
