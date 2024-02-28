---
layout: drawpile_help
title: "WebSocket Server Setup"
description: "How to set up drawpile-srv so that users can connect to it from the Drawpile web browser client."
date: 2024-02-20 00:00:00 +0200
category: "help"
tag: help server
---

This document describes how to configure a [dedicated Drawpile server](dedicatedserver) to be accessible from the web browser version of Drawpile.

If you just want to host a single drawing session that allows others to join via the browser, you can do so [on the community servers](https://drawpile.net/communities/) that support it.

Check out [the main help page](/help/) on how to get in contact if you have trouble setting this stuff up, have any questions about it or want to provide improvements to this documentation!

* Table of contents
{:toc}

### Requirements

To let people join sessions on your Drawpile server via the web browser client, you need the following:

* A Drawpile server, drawpile-srv version 2.2.1 or newer.
* TLS certificates. Ideally you also have a domain name for these, but self-signed ones will also work if your users go through the detour of adding an exception for them.
* Some web server that lets you reverse proxy WebSocket connections, such as nginx.

How to set these up will be described in the following sections.

You don't need to host the web browser client yourself, the one provided through web.drawpile.net works for any server. You only need to provide the WebSocket interface.

### Drawpile Server

Make sure your drawpile-srv version is at 2.2.1 or newer. If you compile it yourself, make sure you have QtWebSockets installed when you do. The configure step will tell you if WebSocket support has been enabled or not.

Add [the --websocket-port option](serverconfig#websocket-listen-port), along with a port of your choice. The documentation uses 27751, so if that's available, you can use it.

If you're using systemd sockets, pass the WebSocket port as the third socket (the first one is for TCP, the second one is for the HTTP web admin API.)

If you want to run your reverse proxy on the same machine as your drawpile-srv and don't have a firewall, you can also pass `--websocket-listen 127.0.0.1` to [restrict connections to ones coming from localhost](serverconfig#websocket-listen-address).

Restart your drawpile-srv afterwards.

### TLS Certificates

If you have a domain name, you can use [certbot](https://certbot.eff.org/){:target="_blank"} to get Let's Encrypt certificates for it. If not, you can generate self-signed certificates yourself.

TLS certificates are *required*. The web browser client can only run on HTTPS websites, which can only connect to TLS-secured WebSockets. The reason that it can only run on HTTPS websites is because browsers mandate [secure contexts](https://developer.mozilla.org/en-US/docs/Web/Security/Secure_Contexts) for multithreaded applications, which Drawpile is.

### Reverse Proxy

A reverse proxy will take a WebSocket connection to your server and forward it to drawpile-srv. It is used to apply the TLS certificates and is generally a good idea, since having a web server

The reverse proxy is *required* because drawpile-srv does not currently support TLS for its WebSockets directly (but someone could [contribute it](https://docs.drawpile.net/help/development/contributing)), and TLS is required for the reasons given above.

If you're using nginx, you can use the following configuration. Put it into a server block that's listening to port 443 and has TLS certificates set up in it.

```nginx
# Don't change the location, invite links only work with this one.
location /drawpile-web/ws {
    # This if block is optional, but recommended. WebSockets don't have a
    # same-origin policy, so without checking the origin, any website can
    # make a connection. Also, DO NOT change this to your own hostname, it
    # will make the client on web.drawpile.net and the Chinese mirror on
    # web.foxdice.cn stop working. If you want to allow other origins, you
    # can add them here of course.
    if ($http_origin !~ "^https://web\.(drawpile\.net|foxdice\.cn)$") {
        return 403;
    }
    # Same port as you passed to drawpile-srv via --websocket-port.
    proxy_pass http://localhost:27751;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
    proxy_set_header X-Real-IP $remote_addr;
}
```

Other web servers should work similarly, refer to their documentation on how to set up a WebSocket reverse proxy for them.

### Trying It Out

Use the Drawpile 2.2.1 desktop client to host a session on your server and copy the invite link. When you follow it, it should give you a button on the page that gives you the option to join via the browser.

If that's not working and you're trying to diagnose what's wrong, try using Firefox. It has better error messages for this stuff than Chromium-based browsers.

And you can of course get in touch if you need help, refer to [the main help page](/help/) on how to get in contact.

### Hosting the Web Browser Client (Not Required and Discouraged)

Hosting your own version of the web browser client is possible, but **strongly discouraged**.

Drawpile already provides a web browser client at web.drawpile.net. The browser client is just a bunch of static files, there's no server-side logic to them, so hosting a copy of them is pretty pointless and you have to keep them up to date. It also tortures users because they have to configure the client separately for every site it's hosted on. Additionally, Drawpile's invite links will always use web.drawpile.net and authentication through drawpile.net accounts only works there, not from other domains.

However, you may want to host your own client as a backup in case web.drawpile.net goes down, because you are in a region where that site is not accessible or because you want to make customizations to it. But make sure you keep it updated, it would be very annoying to have users complaining about stuff that has been fixed forever ago. Also, if you make customizations, you must also release the source code to those changes in accordance with the GPL!

The browser client is still in development. No pre-built versions of it are available. To build it yourself, you need Linux and Emscripten set up on it. Check out the `feature/qtwasm` branch, run `pkg/emscripten/setup.bash release` (this takes a long time), then run `pkg/emscripten/configure.bash release`, then `cmake --build builemdrelease` (takes pretty long, especially the linking at the end is very slow) and finally `cmake --install buildemrelease`. The files will be in the `installemrelease` directory.

To host the client using nginx, you need to set up the wasm type correctly. In nginx.conf in the http section, add:

```nginx
types {
    application/wasm wasm;
}
```

To set up the nginx site, use a configuration like the following (replace drawpile.example.com):

```nginx
map $sent_http_content_type $webexpires {
    default max;
    text/html off;
}

map $sent_http_content_type $webcachecontrol {
    text/html 'no-store';
}

server {
    server_name drawpile.example.com;
    server_tokens off;

    root /path/to/client/files;

    location / {
        add_header "Cross-Origin-Resource-Policy" "same-site";
        add_header "Cross-Origin-Opener-Policy" "same-origin";
        add_header "Cross-Origin-Embedder-Policy" "require-corp";
        add_header "Cache-Control" $webcachecontrol;
        expires $webexpires;
        limit_except GET {
            deny all;
        }
    }

    listen 443 ssl;
    ssl_certificate /etc/letsencrypt/live/drawpile.example.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/drawpile.example.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
}

server {
    if ($host = drawpile.example.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot

    server_name drawpile.example.com;
    server_tokens off;
    listen 80;
    return 404; # managed by Certbot
}
```

The caching stuff is necessary to avoid clients redownloading the large asset and wasm stuff every time, but always reload the index page in case of updates.

The headers are mandatory to get a secure context on the page.
