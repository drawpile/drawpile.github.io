---
layout: drawpile_help
title: "Installing Alpha and Beta Versions"
description: "How to install testing versions of Drawpile, optionally next to a stable version already installed."
date: 2025-08-07 00:00:00 +0200
category: "help"
tag: help tech
---

This article explains how you can install alpha and beta releases of Drawpile on different systems.

It also explains how you can install both the main and an alpha or beta version at once.

If you have trouble getting this to work, questions or know of a better way of doing it, <a href="https://drawpile.net/help/" target="_blank">take a look at the help page on how to get in contact!</a>

* Table of contents
{:toc}

## Windows

On Windows, you can install one version of Drawpile and use other versions using the portable ZIP. Both options are available [on the downloads page](https://drawpile.net/downloads/){:target="_blank"}. Alternatively, you can also just use the portable versions for everything.

It's recommended that you install the newer version (beta or alpha) and keep using the older one from the ZIP. The newer version is always backward-compatible, so you can use it to join both new and old sessions, but not vice-versa.

## Web Browser

The browser version lets you pick which version you want to use. Just choose it from the "Version" drop-down.

Invite links to sessions that can only be joined with specific versions will gray out any other option. So if you can't pick one of them, it means that you wouldn't be able to join the session with it.

## macOS

On macOS, you can just keep two application bundles around next to each other. Rename one of them and then install the other.

## Linux

Linux comes in two variants, the AppImage and Flatpak. It is not recommended that you mix them.

### Linux AppImage

Just download both AppImages [from the downloads page](https://drawpile.net/download/){:target="_blank"}. Then just keep both files around and pick which one you want to run.

### Linux Flatpak

You can use the beta version of Drawpile via Flatpak as follows.

First, add the beta repository: `flatpak remote-add --user --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo`

Then install Drawpile beta: `flatpak install flathub-beta net.drawpile.drawpile`

And now you can run the beta version by using `flatpak run net.drawpile.drawpile//beta`

The stable version can be explicitly run by using `flatpak run net.drawpile.drawpile//stable`

## Android

Android comes in two variants, an APK and installing via F-Droid. Installing them side-by-side is unfortunately a bit involved, you need to use Shelter or similar.

### Android APK

Download both APKs [from the downloads page](https://drawpile.net/download/){:target="_blank"}. Then either install them into different profiles (e.g. via Shelter) or just keep them both around and install the one you want to use as needed.

### Android F-Droid

You can <a href="https://flathub.org/apps/net.drawpile.drawpile" target="_blank">get Drawpile on F-Droid here</a>. To enable the beta version, tap on the three dots at the top-right and pick "allow beta updates".

![Enabling beta updates on F-Droid]({{ "/assets/img/help/fdroidbeta.webp" | relative_url }})
