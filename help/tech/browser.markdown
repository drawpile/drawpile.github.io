---
layout: drawpile_help
title: "Web Browser Client"
description: "Documentation on Drawpile's web browser version."
date: 2024-01-10 00:00:00 +0200
category: "help"
tag: help tech
---

This is a collection of browser-specific issues. If there's something you have trouble with not listed here, take a look at [the main help page](https://drawpile.net/help/) for ways to ask about it!

## SharedArrayBuffer Issues

The "SharedArrayBuffer not available" error can have several causes. The page should tell you what it thinks the problem is. If the server is misconfigured, only the server owner can resolve the issue.

### Embedded Browsers

Some chat applications, such as Telegram on mobile devices, will open links in an embedded browser that break Drawpile's functionality. There should be a menu in the corner somewhere where you can open the page properly. Alternatively, you can copy the link you were given and paste it into your regular browser.

### Missing Browser Support

If your browser doesn't support SharedArrayBuffer, you're either using an outdated or entirely unsupported web browser. You can take a look at [the compatibility chart on mozilla.org](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer#browser_compatibility){:target="_blank"} to see which browsers support it.

### Server Misconfiguration

If you are a server owner and are hosting your own custom version of the Drawpile client, seeing an error about SharedArrayBuffer means you configured your site wrong. Check the instructions again.

If you're not sure if you're hosting your own client: you're not. You're most likely using the official client on `web.drawpile.net` instead, which is configured correctly.
