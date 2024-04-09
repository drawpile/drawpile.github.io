---
layout: drawpile_help
title: "Contributing"
description: "How you can contribute to Drawpile, both with code- and without."
date: 2024-02-10 00:00:00 +0200
category: "help"
tag: help development
---
### How to contribute to Drawpile

If you'd like to contribute to Drawpile, then you've come to the right place.

Here we will go over a variety of ways you can help the project with development, and without!

While Drawpile could use help with its developement, you don't need to be a developer or possess coding skills to provide very valuable contributions.


* Table of contents
{:toc}


## Non-Development Contribution

Here are quite a few ways you could contribute that don't require you to be a software developer. You can contribute in many other ways not mentioned here.

### Helping Other Users

Users come to ask questions about Drawpile on our [Discord](https://drawpile.net/discord/) and [libera.chat](https://drawpile.net/irc/). 
If you know your way around Drawpile and want to help others this way, you can hang around help respond to those kinds of questions.

### Providing Illustrations

You may have noticed that the Drawpile website is pretty thin on illustrations. It would be great to have some for decoration or to showcase features, issues or bugs!

If you've drawn artworks or prepared showcases that you would like Drawpile to us, [contact us](https://drawpile.net/help/)! 

The works provided should naturally come with your consent to use, and ideally be put under a [Creative Commons license](https://creativecommons.org/share-your-work/).
They should of course be made at least for the most part in Drawpile and shouldn't contain any canon characters or intellectual property.

### Reporting Problems, Suggesting Features

When you find a bug or some other problem or have an idea for a good feature, bring it up! This is how Drawpile improves. 
Don't worry about reporting duplicates, it doesn't hurt to hear things brought up again and might end up as a good reminder to get to them.
If the matter is already brought up in for example a GitHub issue, feel free to add your thoughts or elaboration to it!

### Translations

Drawpile is used all across the world, by people speaking many different languages. 
If you want to translate it into yours or fix something about an existing translation, you can do so [on Weblate](https://hosted.weblate.org/engage/drawpile/).
You can see which languages there are already and how complete the translations are. If you don't spot your language, you can add a new one.

### Community Servers

Drawpile has a set of [community servers](https://drawpile.net/communities/). These are servers run by and moderated by people who want to give a space for others to draw. 
If you have your own Drawpile server that you want to become one of these community servers, you can [submit it here](https://drawpile.net/communities/drawpile.net/ych/).

If you want to help moderate existing Drawpile servers, feel free to [contact us](https://drawpile.net/help/). 

### Documentation

You can contribute to this help page by writing documentation! 
If you know your way around, you can send pull requests [to the drawpile.github.io repository](https://github.com/drawpile/drawpile.github.io). 
Otherwise, you can just write up an article in your favorite word processor and send it over to us! 

### Reproducing Issues

You could help developers pinpoint the cause of problems by recreating the problems that are reported on our [GitHub issues page](https://github.com/drawpile/Drawpile/issues) and [Discord server](https://discord.gg/M3yyMpC) and greatly speed up the process, especially by providing log files if applicable.

### Testing New Features

Additional testing for new or experimental features is always valuable, especially since your devices and cirumstances is likely unique. Description of your experience will help developers improve the features for everyone.


## Development Contribution

These are areas that need some software development skills. 

If you'd like to take on a task or work on an area, we strongly recommend getting in contact with us and the other members in our community, to avoid conflicts or potentially working on something that is already being worked on.
This is especially important when it comes to the network protocol or similar pillar components because of the potential for merge conflicts, which can be avoided if we know what you're working on.
You can find out how to get in contact [on the main help page](https://drawpile.net/help/).

Read [the architecture page](architecture) to become familiar with the different components, and check out our [coding guidelines](https://docs.drawpile.net/help/development/codingguidelines) for general but very useful guidelines.


We've compiled the ideas into a large backlog, and created their corresponding GitHub issue.

### Development Backlog

All items in the following chart **should** exist as issues on our GitHub; you can check their current status by clicking them.
Note that this list isn't updated in real time, but is updated often enough for you to pick an area to contribute.

| Tasks & Features                                                                                                                                                                                                                                     | Status   | Size | Type   |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ---- | ------ |
| Implement OpenGL canvas view                                                                                                                                                                                                                         | OCCUPIED | L    | patch  |
| [Port for iPad (iOS/iPad OS)](https://github.com/drawpile/Drawpile/issues/1095)                                                                                                                                                                      | idea     | XL   | patch  |
| [Make undo and redo not require a round-trip to the server](https://github.com/drawpile/Drawpile/issues/1203)                                                                                                                                        | Awaiting | L    | patch  |
| [Remember background color per brush slot](https://github.com/drawpile/Drawpile/issues/1205)                                                                                                                                                         | Awaiting | S    | patch  |
| [First-time user setup wizard to reduce preferences fiddling](https://github.com/drawpile/Drawpile/issues/1207)                                                                                                                                      | Awaiting | M    | patch  |
| [Redesign chat to not be fixed at the bottom (perhaps dock, overlay or additional tab for the right pane)](https://github.com/drawpile/Drawpile/issues/1208)                                                                                         | idea     | L    | patch  |
| [Rework selections and transforms](https://github.com/drawpile/Drawpile/milestone/10), see [GitHub Milestone](https://github.com/Drawpile/Drawpile/milestone/10)                                                                                     | Awaiting | L    | UPDATE |
| Allow hiding user cursors when they get too close to where you're drawing                                                                                                                                                                            | idea     | S    | patch  |
| [Make arrow keys move around the timeline when it has focus](https://github.com/drawpile/Drawpile/issues/1209)                                                                                                                                       | idea     | S    | patch  |
| [Add more fonts to the browser client so that non-Latin languages work](https://github.com/drawpile/Drawpile/issues/1175)                                                                                                                            | idea     | S    | patch  |
| [Indicate and remember hidden list servers in the server browser](https://github.com/drawpile/Drawpile/issues/1213)                                                                                                                                  | idea     | S    | patch  |
| [Implement cel mode for timeline tracks](https://github.com/drawpile/Drawpile/issues/1214)                                                                                                                                                           | Awaiting | M    | UPDATE |
| [Allow operations like moving or copying across multiple timeline frames](https://github.com/drawpile/Drawpile/issues/1158)                                                                                                                          | Awaiting | M    | UPDATE |
| [Implement proposed gap closing algorithm for the fill tool](https://github.com/drawpile/Drawpile/issues/1216)                                                                                                                                       | idea     | M    | patch  |
| Action Log                                                                                                                                                                                                                                           | idea     | M    | patch  |
| Remove support for the old login process                                                                                                                                                                                                             | idea     | S    | SeRVeR |
| [Bundle ffmpeg on Windows](https://github.com/drawpile/Drawpile/issues/1129)                                                                                                                                                                         | idea     | M    | patch  |
| Filtering Communities                                                                                                                                                                                                                                | idea     | S    | patch  |
| [Pan and Rotation Tool (as part of the current Zoom tool)](https://github.com/drawpile/Drawpile/issues/1217)                                                                                                                                         | idea     | M    | patch  |
| Drop-downs that involve 3 or less items should become buttons                                                                                                                                                                                        | OCCUPIED | S    | patch  |
|                                                                                                                                                                                                                                                      |          |      |        |
| Presets for key bindings, with import and export (+ start screen)                                                                                                                                                                                    | idea     | M    | patch  |
| Allow exporting and importing settings between desktop, mobile and browser                                                                                                                                                                           | idea     | M    | patch  |
| [Make the browser version save all configurations properly](https://github.com/drawpile/Drawpile/issues/1175)                                                                                                                                        | idea     | M    | patch  |
| Increase layer count limit                                                                                                                                                                                                                           | Awaiting | M    | UPDATE |
| [Increase brush size limit](https://github.com/drawpile/Drawpile/issues/1171)                                                                                                                                                                        | Awaiting | M    | UPDATE |
| [Redesign permissions (setting limits & privileges)](https://github.com/drawpile/Drawpile/issues/1219)                                                                                                                                               | idea     | L    | UPDATE |
| [Sidecar Server-side Permission Manager](https://github.com/drawpile/Drawpile/issues/1257)                                                                                                                                                           |          |      | SeRVeR |
| Unify host dialog and session settings so that you can host with the intended settings immediately                                                                                                                                                   | idea     | M    | patch  |
|                                                                                                                                                                                                                                                      |          |      |        |
| Add private/public toggle to host dialog, defaulting to the former                                                                                                                                                                                   | Awaiting | S    | patch  |
| [Tags and/or descriptions for public sessions](https://github.com/drawpile/Drawpile/issues/1225)                                                                                                                                                     | idea     | M    | patch  |
| [Split server browser into table and detail view](https://github.com/drawpile/Drawpile/issues/1226)                                                                                                                                                  | idea     | S    | patch  |
| [Make it clearer why someone can't join a session (e.g. wrong version.)](https://github.com/drawpile/Drawpile/issues/1223)                                                                                                                           | idea     | S    | patch  |
| [Remove private listing roomcode feature (it's been replaced with invite links)](https://github.com/drawpile/Drawpile/issues/1224)                                                                                                                   | Awaiting | S    | patch  |
| [Remove "block new logins" session setting, it's redundant with the password](https://github.com/drawpile/Drawpile/issues/1222)                                                                                                                      | Awaiting | M    | patch  |
| Make invite links not include stale passwords if it was changed                                                                                                                                                                                      | idea     | S    | patch  |
| [Allow favoriting brush presets](https://github.com/drawpile/Drawpile/issues/1227)                                                                                                                                                                   | idea     | S    | patch  |
| [Dynamically switch between desktop and small-screen mode](https://github.com/drawpile/Drawpile/issues/1228)                                                                                                                                         | idea     | S    | patch  |
| Allow resetting settings to their defaults in a sensible way                                                                                                                                                                                         | idea     | S    | patch  |
| Allow customizing tool and status bar widgets                                                                                                                                                                                                        | idea     | M    | patch  |
| [Add clone and heal brush (plus permissions.)](https://github.com/drawpile/Drawpile/issues/1232)                                                                                                                                                     | idea     | L    | UPDATE |
| [Implement floating reference image annotations (plus compression & permissions)](https://github.com/drawpile/Drawpile/issues/1147)                                                                                                                  | idea     | L    | UPDATE |
| [Attempt utilizing more modern compression (brotli, zstd, webp.)](https://github.com/drawpile/Drawpile/issues/1233)                                                                                                                                  | idea     | M    | UPDATE |
| [Decompress compressed commands once upon receipt, rather than each time they're executed](https://github.com/drawpile/Drawpile/issues/1234)                                                                                                         | idea     | S    | patch  |
| [Allow saving and loading webp Ideally also saving animated webp for animations](https://github.com/drawpile/Drawpile/issues/1235)                                                                                                                   | idea     | M    | patch  |
| [Allow exporting animation frames on Android and browser (into a ZIP)](https://github.com/drawpile/Drawpile/issues/1236)                                                                                                                             | idea     | S    | patch  |
| Upgrade browser client to Qt 6.7 and check if [this bug](https://bugreports.qt.io/browse/QTBUG-121416) still appears                                                                                                                                 | Awaiting | S    | patch  |
| [Darken depressed buttons](https://github.com/drawpile/Drawpile/issues/1237)                                                                                                                                                                         | idea     | S    | patch  |
| [Make autosave actually automatic](https://github.com/drawpile/Drawpile/issues/1065)                                                                                                                                                                 | idea     | M    | patch  |
| [Add a graphical interface for the Drawpile-timelapse CLI](https://github.com/drawpile/Drawpile/issues/1242)                                                                                                                                         | idea     | M    | patch  |
| [Allow exporting animations as videos, probably via ffmpeg](https://github.com/drawpile/Drawpile/issues/1243)                                                                                                                                        | idea     | M    | patch  |
| [Allow zooming the timeline](https://github.com/drawpile/Drawpile/issues/1244)                                                                                                                                                                       | idea     | S    | patch  |
| [Make kinetic scrolling work in the timeline](https://github.com/drawpile/Drawpile/issues/1245)                                                                                                                                                      | idea     | S    | patch  |
| [Add a brush size palette widget](https://github.com/drawpile/Drawpile/issues/1246)                                                                                                                                                                  | idea     | M    | patch  |
| Make session resets less disruptive by designating a single user to perform the reset                                                                                                                                                                | idea     | L    | patch  |
| Allow the server to delegate resetting the session to an external tool instead of a client                                                                                                                                                           | idea     | L    | patch  |
| [Make the systemd service not install socket activation automatically](https://github.com/drawpile/Drawpile/issues/1249)                                                                                                                             | idea     | S    | patch  |
| [Integrate with systemd watchdog](https://github.com/drawpile/Drawpile/issues/1250)                                                                                                                                                                  | idea     | S    | patch  |
| [Add optional buttons for mirror, rotate, etc, to navigator](https://github.com/drawpile/Drawpile/issues/1251)                                                                                                                                       | idea     | M    | patch  |
| [Truncate files when writing them on Android](https://github.com/drawpile/Drawpile/issues/1252)                                                                                                                                                      | idea     | S    | patch  |
| [Add rotation and panning to zoom tool](https://github.com/drawpile/Drawpile/issues/1217)                                                                                                                                                            | idea     | M    | patch  |
| [Implement animation tweening](https://github.com/drawpile/Drawpile/issues/1254)                                                                                                                                                                     | idea     | S    | patch  |
| [Replace global timeline with animation groups](https://github.com/drawpile/Drawpile/issues/1253)                                                                                                                                                    | Awaiting | L    | UPDATE |
| [Allow hiding the brush preview](https://github.com/drawpile/Drawpile/issues/1255)                                                                                                                                                                   | idea     | S    | patch  |
| [Implement optional server-side rate limiting](https://github.com/drawpile/Drawpile/issues/1256)                                                                                                                                                     | idea     | M    | patch  |
| [Allow opening multiple documents/sessions in tabs](https://github.com/drawpile/Drawpile/issues/1006)                                                                                                                                                | idea     | L    | patch  |
| [Integrating multiple account systems , e.g. Drawpile.net, Drawpile.cn, or even third party ones (like Steam)](https://github.com/drawpile/Drawpile/issues/1258)                                                                                     | Awaiting | L    | patch  |
| [Add a scribble area to the brush settings dialog, to allow for testing brushes](https://github.com/drawpile/Drawpile/issues/1259)                                                                                                                   | Awaiting | M    | patch  |
| [Add scratchpad docker, to allow for an off-canvas area to mix colors and such ](https://github.com/drawpile/Drawpile/issues/1260)                                                                                                                   | idea     | M    | patch  |
| Split the server into a frontend that users initially connect to and a backend providing the actual session hosting, to allow for load balancing, graceful restarts and running multiple Drawpile servers on the same host using different hostnames | idea     | L    | SeRVeR |
| Get rid of the TCP protocol and run everything via WebSockets, since that allows making use of HTTP tooling around proxying, tunneling and whatnot                                                                                                   | idea     | M    | SeRVeR |
| [Implement gesture handling on Windows](https://github.com/drawpile/Drawpile/issues/1261)                                                                                                                                                            | idea     | M    | patch  |
| [Add touch shortucts, like double-tap to undo](https://github.com/drawpile/Drawpile/issues/1174)                                                                                                                                                     | idea     | M    | patch  |
| [Allow importing animation frames](https://github.com/drawpile/Drawpile/issues/1262)                                                                                                                                                                 | idea     | M    | patch  |
| [Bundle Microsoft Visual C++ Redistributables in installer](https://github.com/drawpile/Drawpile/issues/1263)                                                                                                                                        | idea     | S    | patch  |
| [Dedicated Server as a Windows Service](https://github.com/drawpile/Drawpile/issues/463)                                                                                                                                                             | idea     | S    | patch  |
| [Build a Drawpile version](https://github.com/drawpile/Drawpile/issues/1264) of [this Chrome Wintab Plugin](https://github.com/Agamnentzar/chrome-stylus-pressure) and integrate it into Qt                                                          | idea     | M    | patch  |
| Host Keys for List Server (support for cluster-type hosts)                                                                                                                                                                                           | idea     | S    | patch  |
| Implement cel/frame linking for animation workflow                                                                                                                                                                                                   | idea     | L    | UPDATE |
| Allow color marking of frames or cels                                                                                                                                                                                                                | idea     | M    | UPDATE |
| [Every few dozen strokes, create a very small thumbnail as preview for the layer](https://github.com/drawpile/Drawpile/issues/1265)                                                                                                                  | idea     |      |        |
| [Upon pasting media create and hold a temporary layer ](https://github.com/drawpile/Drawpile/issues/1266)                                                                                                                                            | Awaiting | M    | UPDATE |
| [Implement feather edges feature to selection](https://github.com/drawpile/Drawpile/issues/1267)                                                                                                                                                     | idea     | M    | UPDATE |
| [Allow resolution presets in the New dialog](https://github.com/drawpile/Drawpile/issues/1269)                                                                                                                                                       | idea     | S    | patch  |
| Improve UI theme                                                                                                                                                                                                                                     | idea     | S    | patch  |
| [Make shift-scroll-driven brush size adjustment dynamic based on scroll speed](https://github.com/drawpile/Drawpile/issues/1270)                                                                                                                     | idea     | S    | patch  |
| [Allow creating sessions from the web admin panel](https://github.com/drawpile/Drawpile/issues/1240)                                                                                                                                                 | idea     | M    | patch  |

If you'd like to advocate or provide concept, explanation or illustration involving the changes, feel free to [contact us](https://drawpile.net/help/) or write directly in the corresponding GitHub issue.






