---
layout: drawpile_help
title: "Contributing"
date: 2024-02-10 00:00:00 +0200
category: "help"
tag: help development
---

This is supposed to be a list of good spots for people looking to contribute to Drawpile. This doesn't necessarily encompass stuff where you need to be able to write code, there's plenty of things beyond that!

Note that this list isn't necessarily super up to date, it's last been updated on February 10, 2024. If you want to contribute something and this date is far in the past, consider giving a poke so that this list can be updated, you can find out how to get in contact [on the main help page](https://drawpile.net/help/){:target="_blank"}.

## Non-Code Stuff

These are things that don't require you to be a software developer. Some things are still technical, others less so.

### Helping Other Users

Users come to ask questions about Drawpile on [Discord](https://drawpile.net/discord/){:target="_blank"} and [libera.chat](https://drawpile.net/irc/){:target="_blank"}. If you know your way around Drawpile and want to help others this way, you can idle around in those places and help respond to those kinds of questions.

### Providing Pictures and Animations

You may have noticed that the Drawpile website is pretty thin on pictures. It would be nice to have some for decoration.

If you drew any cool pictures, animated something neat or anything in that regard that you would like Drawpile to use for such decorative purposes, in screenshots and such, give a poke about it! You can find out how to get in contact [on the main help page](https://drawpile.net/help/){:target="_blank"}.

All people that collaborated on the works need to agree to it being used. Ideally, the works should be put under a [Creative Commons license](https://creativecommons.org/share-your-work/), that way there's no need for any special agreements. The works should of course be made at least for the most part in Drawpile and shouldn't contain any canon characters or other intellectual property of that sort.

### Reporting Problems, Suggesting Features

When you find a bug or some other problem or have an idea for a good feature, bring it up! This is how Drawpile improves. Don't worry about reporting duplicates, it doesn't hurt to hear things brought up again and might end up as a good reminder to get to them.

You can find out where to do so [on the main help page](https://drawpile.net/help/){:target="_blank"}.

### Translations

Drawpile is used all across the world, by people speaking many different languages. If you want to translate it into yours or fix something about an existing translation, you can do so [on Weblate](https://hosted.weblate.org/engage/drawpile/){:target="_blank"}. You can see which languages there are already and how complete the translations are. If you don't spot your language, you can add a new one.

### Community Servers

Drawpile has a set of [community servers](https://drawpile.net/communities/){:target="_blank"}. These are servers run by and moderated by people who want to give a space for others to draw. If you have your own Drawpile server that you want to become one of these community servers, you can [submit it here](https://drawpile.net/communities/drawpile.net/ych/){:target="_blank"}.

If you want to help moderate existing Drawpile servers, feel free to drop a line too. There's currently no process by which moderators are onboarded, but we can figure something out. You can find out how to get in contact [on the main help page](https://drawpile.net/help/){:target="_blank"}.

### Documentation

You can contribute to this help page by writing documentation! If you know your way around this kind of techy stuff you can send pull requests [to the drawpile.github.io repository](https://github.com/drawpile/drawpile.github.io). If not, you can just write up an article in your favorite word processor, a Google Doc or whatever else and then someone can convert it over to the correct format. For that, you can find how to get in contact [on the main help page](https://drawpile.net/help/){:target="_blank"}.

There's currently no video tutorials or anything of that sort, but we'd gladly include those too. Translations of these pages into other languages are also gladly taken.

## Code Stuff

These are things that need some software development skills. They're not necessarily easy pickings, but are things that are either reasonably isolated to not run into conflicts or require owning specific hardware or running certain operating systems. If you notice anything stale here, give a poke so that we update it. You can find out how to get in contact [on the main help page](https://drawpile.net/help/){:target="_blank"}.

Also, considerer joining [Discord](https://drawpile.net/discord/){:target="_blank"} or [libera.chat](https://drawpile.net/irc/){:target="_blank"} so you can ask if you hit a snag!

"Repository" says which part of Drawpile this is about, e.g. the application itself, the listserver or the website. "Tech" lists what kinds of technologies and languages are involved, vaguely in order of importance. There's also GitHub issue links where available.

### Transformation Handles

When making a selection and then zooming out very far, the arrows on the corners start getting cut off, I guess because the selection item's bounding box is not calculated correctly when zoom gets involved.

Also, those handles sometimes annoyingly difficult to hit. The area in which they can be clicked on should be made larger and there should be some visual indication when hovering over one of them (e.g. by drawing them with 50% opacity by default and when you hover over them you draw with 100% opacity and/or changing the cursor to some kind of grabby hand) to make it clear that you're actualyl going to hit them.

This is a good starter issue, since it's small and self-contained to a single component.

Repository: [Drawpile](https://github.com/drawpile/Drawpile){:target="_blank"}

Tech: Qt, C++.

[GitHub Issue](https://github.com/drawpile/Drawpile/issues/1116){:target="_blank"}

### Pan and Rotation Tool

Currently, Drawpile only has a zoom tool (shortcut is Z.) It would be nice to extend this tool to also allow panning and rotation of the canvas. This would allow easier one-handed operation of Drawpile, since not everyone has two of those.

The tool's options panel can be extended with radio buttons to this effect, similar how it works for selections where you have the three Scale/Shear/Distort options. It could also be added as separate tools instead, but I'd rather avoid that, since that would add two additional buttons in the toolbar, which already tends to have trouble with being too wide on devices with small screens.

Repository: [Drawpile](https://github.com/drawpile/Drawpile){:target="_blank"}

Tech: Qt, C++.

This doesn't currently have a GitHub issue.

### Action Log

This would be a feature for the Drawpile client where "important" actions get logged so that they can be inspected and maybe also undone. For example, layer deletions, timeline changes, session resets etc. The kinds of things that tend to happen accidentally and then end up in a scramble of trying to figure out what happened.

It involves adding another tab to the dialog that shows up when you go into Session → Event Log, where those kinds of events get logged, along with the user who did it. The events would need to be bubbled up from the paint engine when they're executed.

Repository: [Drawpile](https://github.com/drawpile/Drawpile){:target="_blank"}

Tech: Qt, C++, C.

[GitHub Issue](https://github.com/drawpile/Drawpile/issues/1135){:target="_blank"}

### Gestures on Windows

On Windows, some laptop touchpads emit gesture events. [Qt doesn't handle them](https://code.qt.io/cgit/qt/qtbase.git/tree/src/plugins/platforms/windows/qwindowsmousehandler.cpp?h=5.15#n701){:target="_blank"}, which leads to Drawpile getting [fallback behavior](https://learn.microsoft.com/en-us/windows/win32/wintouch/windows-touch-gestures-overview#legacy-support){:target="_blank"}, which doesn't feel particularly nice because it only supports zooming and scrolling separately and doesn't handle rotations.

Fixing this means ideally owning a device with such a touchpad and then extending the native Windows event filter in `wineventfilter.cpp` to catch these events and sends them to the canvas. Other widgets are fine with the fallback behavior, since they don't need to do any simultaneous moving, zooming and rotating.

Repository: [Drawpile](https://github.com/drawpile/Drawpile){:target="_blank"}

Tech: Qt, Win32, C++.

This doesn't currently have a GitHub issue.

### Touch Shortcuts

It would be nice to define certain touch operations as shortcuts. For example, tapping with two fingers to undo, tapping with three to redo. Ideally this would be reassignable in the shortcuts panel, but that's not super necessary to be useful.

This involves altering canvasview.cpp, which does its own touch handling. It would basically have to detect a brief touch with 2 or 3 fingers, which it would then interpret as an undo or redo. Ideally without moving the canvas around in that case, which could be accomplished with some brief guessing, similar to how touch drawing is currently detected in the same file. It would be enough to implement this for touchscreen mode only (QTouchEvent), not in gesture mode (QGestureEvent), since this is most relevant for devices that only have a touchscreen.

Repository: [Drawpile](https://github.com/drawpile/Drawpile){:target="_blank"}

Tech: Qt, C++.

[GitHub Issue](https://github.com/drawpile/Drawpile/issues/1174){:target="_blank"}

### Importing Animation Frames

Currently there's no way to import a bunch of images into Drawpile as animation frames, there's only an import for Drawpile 2.1 animations in ORA files. So currently, users have to work around this by e.g. importing the frames into GIMP as layers, saving as an ORA file and then importing that, which is pretty roundabout. It would be nicer if Drawpile just had a way to import frames directly, similar to e.g. Krita.

At the time of writing, the frame import on the main branch is still in Rust. This is replaced by C again on the feature/qtwasm branch, since linking it in WebAssembly causes trouble.

Repository: [Drawpile](https://github.com/drawpile/Drawpile){:target="_blank"}

Tech: C, C++, Qt.

This doesn't currently have a GitHub issue.

### Bundle ffmpeg on Windows

It'd be nice if we bundled ffmpeg on Windows, since there's no package manager and no standard binary paths there. This involves fiddling with GitHub actions.

Repository: [Drawpile](https://github.com/drawpile/Drawpile){:target="_blank"}

Tech: GitHub Actions, CMake.

[GitHub Issue](https://github.com/drawpile/Drawpile/issues/1129){:target="_blank"}

### Bundle Microsoft Visual C++ Redistributable in Windows Installer

The Windows installer doesn't bundle the Microsoft C++ libraries, it just tells you to go install them if you don't have them. This is pretty user-unfriendly, it should either include them if possible or at least give the user a link to click so that they don't have to type in the text manually. Theoretically, any system of Windows 10 and above should have these libraries, but it seems like reality is a bit different sometimes.

Requires messing around with the WiX toolkit to somehow bundle it into the MSI.

Repository: [Drawpile](https://github.com/drawpile/Drawpile){:target="_blank"}

Tech: WiX Toolkit, MSI, Windows.

This doesn't currently have a GitHub issue.

### Dedicated Server as a Windows Service

The Drawpile server has proper integrations to run it as a systemd service, but no such thing exists for Windows. If you know how Windows services work, this is probably not to difficult to implement (speaking as someone who doesn't know Windows and only took a cursory look, anyway.)

Repository: [Drawpile](https://github.com/drawpile/Drawpile){:target="_blank"}

Tech: WiX Toolkit, MSI, Windows.

[GitHub Issue](https://github.com/drawpile/Drawpile/issues/463){:target="_blank"}

### iOS Port

Drawpile is written in Qt, which ostensibly supports iOS too. However, none of the developers are Apple users, so none of them have the required devices or access to the Apple developer program. If you have those and aren't afraid of diving deep into build system stuff, this would be a big help.

Repository: [Drawpile](https://github.com/drawpile/Drawpile){:target="_blank"}

Tech: Qt, iOS.

[GitHub Issue](https://github.com/drawpile/Drawpile/issues/1095){:target="_blank"}

### Filtering Communities

The different [community servers](https://drawpile.net/communities/){:target="_blank"} have different setups. Some require accounts for hosting, some allow only SFW stuff etc.

It would be nice if that site let you filter these communities accordingly, so that you don't have to click each one to figure that out.

Repository: [website](https://github.com/drawpile/website){:target="_blank"}

Tech: Django, Python.

This doesn't currently have a GitHub issue.

### Host Keys for List Server

The Drawpile list server lets people list sessions hosted elsewhere. For example, if you look at [pub.drawpile.net](https://pub.drawpile.net/){:target="_blank"}, you can see sessions listed from various other places. This is used by e.g. the server browser in Drawpile.

This list server will check if the incoming IP address matches the domain name, to avoid listing spam. If they don't match, the user gets "hostname does not match client IP". This is fine for bare metal servers, but if you're e.g. in a Kubernetes cluster, this doesn't work.

The solution for this is to add the ability to hand out some kind of key to skip this check. Basically involves adding an admin endpoint that allows assigning a key to a hostname and if that key is passed in the request, the check gets skipped. The keys should be revokable. Having this in the admin web UI would also be nice.

A starting implementation is [in this branch](https://github.com/drawpile/listserver/tree/feature/hostkeys), which is still missing an admin interface and the web UI.

Repository: [listserver](https://github.com/drawpile/listserver){:target="_blank"}, [drawpile-admin-webui](https://github.com/drawpile/drawpile-admin-webui){:target="_blank"}

Tech: Go, SQLite (for the listserver); TypeScript, Lit (for the Web UI)

[GitHub Issue](https://github.com/drawpile/listserver/issues/6){:target="_blank"}
