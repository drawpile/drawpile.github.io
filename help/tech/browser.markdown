---
layout: drawpile_help
title: "Web Browser Client"
description: "Documentation on Drawpile's web browser version."
date: 2024-01-10 00:00:00 +0200
category: "help"
tag: help tech
---

This article is a work in progress. The browser version of Drawpile is currently in development. If you want to follow it closer, take a look at [this GitHub issue](https://github.com/drawpile/Drawpile/issues/1175){:target="_blank"}.

## SharedArrayBuffer Issues

The "SharedArrayBuffer not available" error can have several causes. The page should tell you what it thinks the problem is. If the server is misconfigured, only the server owner can resolve the issue.

### Missing Browser Support

If your browser doesn't support SharedArrayBuffer, you're either using an outdated or entirely unsupported web browser. You can take a look at [the compatibility chart on mozilla.org](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer#browser_compatibility){:target="_blank"} to see which browsers support it.

### Missing Cross-Origin Isolation

If it says that the server is missing "cross-origin isolation", it means that the server owner did not set up the page correctly. It must be served with the following headers:

```
Cross-Origin-Resource-Policy: same-site
Cross-Origin-Opener-Policy: same-origin
Cross-Origin-Embedder-Policy: require-corp
```

### Missing Secure Context

If the server is missing a "secure context", it's probably not using HTTPS. You can read more about this concept [on mozilla.org](https://developer.mozilla.org/en-US/docs/Web/Security/Secure_Contexts){:target="_blank"}. Even though SharedArrayBuffer has nothing to do with security, browsers require a secure context to use it anyway.

Server owners can use Let's Encrypt to set up HTTPS on their server. This requires a domain name, an IP address is not sufficient.
