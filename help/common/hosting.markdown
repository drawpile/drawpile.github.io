---
layout: drawpile_help
title:  "Hosting Sessions"
date: 2023-09-29 00:00:00 +0200
category: "help"
tag: help common
---

If you want to start a new online drawing session, you can do so via the Host Session page in the start dialog. This article walks you through the process.

If you have trouble with this, you can ask for help on Discord or the web chat! You can find links to those [on the main help page](https://drawpile.net/help/).

* [Get your canvas ready](#get-your-canvas-ready)
* [Set up the session](#set-up-the-session)
* [Pick a host](#pick-a-host)
    * [Hosting on a server](#hosting-on-a-server) (recommended)
    * [Hosting on your computer](#hosting-on-your-computer)


## Get your canvas ready

If you just want to start with a blank canvas, you can skip this section. Drawpile starts with a blank canvas anyway.

Otherwise, open a file or create a new canvas and fill it with whatever you want to start with. When you're ready, select Session → Host… from the top menu.

![Host menu]({{ "/assets/img/help/sessionhost.webp" | relative_url }})


## Set up the session

Go to the "Host Session" page on the start dialog. If you don't see it, select Session → Host… from the top menu (see the screenshot above.)

* Give your session a **Title**. If you want to host a public session that strangers can join, it helps to be descriptive so that they know what they'll be getting into. If you just want to host a private session for people you invite, it doesn't matter much, just don't use anything offensive.

* If you want your session to be private, give it a **Password**. That way, only people that you give the password to will be able to join. If you don't put a password on your session, it will be public and anyone can join it.

* If your session allows adult content, check the **Not suitable for minors (NSFM)** option. If you're not sure if your content qualifies, err on the side of caution and check it.

![Host page]({{ "/assets/img/help/hostdialog.webp" | relative_url }})


## Pick a host

You can either [host on a server](#hosting-on-a-server), which is the easier option, or try to [host on your computer](#hosting-on-your-computer), which needs additional network stuff to be set up.

### Hosting on a server

This is the recommended option and works for any internet connection.

Drawpile provides some [community servers](https://drawpile.net/communities/) where you can host your sessions for free. You have to [register an account on drawpile.net](https://drawpile.net/accounts/signup/){:target=_blank} for this. The public Drawpile server `pub.drawpile.net` is already preselected by default, but it has limited capacity, so you might have to pick a different one.

When you host on these servers, you have to adhere to the rules they present you with and to [the common community guidelines](https://drawpile.net/communities/drawpile.net/ccg/)!

Anyone can set up a server, so there's many others out on the internet. Those are not related to drawpile.net and can make their own rules.

After setting everything up and picking a server, click on the "Host" button at the bottom. You should be presented with the server rules and may be prompted to log into your account. Once you do so, your session will be available and others can join it. Drawpile will give you a link you can use to invite friends.

### Hosting on your computer

When hosting on your own computer, you need to make it visible from the internet for others to be able to join you. This is kind of tricky, [hosting on a server](#hosting-on-a-server) is an easier option.

If you already know what you're doing: **forward TCP port 27750**.

Otherwise, here's the long explanation. This gets a little technical.

Note that if you are in a dormitory, hotel or some other kind of internet that you don't own, you probably don't have the necessary access to set things up. Also, some internet connections don't allow you to host servers altogether.

Your computer is not connected directly to the internet, instead it's connected to a box called a router, along with any other device in your home. This way, you only need one internet connection for all your devices.

However, that means when someone else tries to connect to your computer from the internet, they will instead reach your router. This router will reject the connection, because it doesn't know which device in your home it's supposed to go to.

So you have to tell your router to send connections that are trying to reach your Drawpile session to your computer. This is called "port forwarding", because your router takes the connection and forwards it to your computer.

![Diagram of how your computer is connected to the internet]({{ "/assets/img/help/router.webp" | relative_url }})

Unfortunately, every router is different, so there's no single set of instructions we can give here. You have to forward TCP port 27750 to your computer. You can normally do this on your router's configuration page, which is usually at <http://192.168.1.1/>{:target="_blank"} or <http://192.168.178.1/>{:target="_blank"} or <http://10.0.0.1/>{:target="_blank"}.

If you can't get this working, you can ask for help on Discord or the web chat. When someone has time they can walk you through it. Take a look at [the help page](https://drawpile.net/help/) for links to those.

If you use some service to check if your port forward worked, **make sure you're actually hosting a session when you do it**. If you're not running anything that could be reached, it will always seem like your computer isn't reachable!
