---
layout: drawpile_help
title:  "Notes for Packagers"
date: 2023-12-16 00:00:00 +0200
category: "help"
tag: help development
---

This document is directed at people who want to package Drawpile for a Linux distribution or similar. If you don't know what that's about, you're in the wrong place.

If you want to get in contact for questions, patching or other things, you can do so on libera.chat, GitHub or Discord. Links are listed [on the help page](https://drawpile.net/help/).

Drawpile consists of the following executables:

* drawpile - the client
* drawpile-srv - the server
* dprectool, drawpile-cmd, drawpile-timelapse - command-line tools

The build doesn't produce any shared libraries, only static libraries that get linked directly into executables. Please don't attempt to make Drawpile build its static libraries as shared ones instead, they're only used for internal organization and have no business existing separately.

The following runtime dependencies are required, all Qt stuff can be either version 5 or 6:

* qtbase
* qtsvg
* qtimageformats
* qtmultimedia
* Either kf5archive when using Qt5 or libzip when using Qt6

The following runtime dependencies are technically optional, but they don't get dynamically loaded at runtime, so you probably want to include these or users will complain that stuff they need doesn't work:

* libmicrohttpd (web admin for the server)
* libsodium (makes external authentication work)
* qtkeychain (for saving passwords)
* libsystemd (systemd integration for the server)

The following runtime dependencies are optional:

* Whatever QMediaPlayer needs to play back sound, ask your qtmultimedia maintainer

The following dependencies have bundled versions that ship with Drawpile, but can be provided externally:

* QtColorWidgets

The following are build-time dependencies, but they are not required at runtime:

* cargo (comes with the Rust toolchain)
* qttools
* qttranslations

The following are bundled with Drawpile and cannot be provided as a shared external library:

* libmypaint - patched because of [this bug](https://github.com/mypaint/libmypaint/pull/186){:target="_blank"} that ruins smudging and adds limits to dab counts where high values cause chugging for other users. **Do not attempt to replace it with the stock version of the library, it makes it impossible to use MyPaint brushes in Drawpile correctly, which is a *critical* feature.**
* jo\_gifx - totally altered from the original, which is not intended for use as a shared library in the first place.
* psd\_sdk - altered and stripped down from the original, which is not intended for use as a shared library in the first place.
* qgrayraster - altered and stripped down from the original, which is a Qt-internal thing that isn't provided separately.
* parson - not intended for use as a shared library in the first place.
* uthash - header-only library.

Drawpile also has [some Qt patches that we use for our own releases](https://github.com/drawpile/Drawpile/tree/main/.github/scripts/patches){:target="_blank"}, but none of those are required and many probably aren't relevant. The Qt packages in your distribution likely do a good job of patching Qt into a working state already.
