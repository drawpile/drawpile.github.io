---
layout: drawpile_post
title: "Dev Update: Week 32 and 33 of 2025"
date: 2025-08-17 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---

The last two weeks were mostly spent on releasing the beta for Drawpile 2.3.0, which quickly got some fixes added to due to issues that only cropped up on specific devices.

## Drawpile 2.3.0 Beta

The Drawpile 2.3.0 is released, you can [download it here](https://drawpile.net/download/#Beta){:target="_blank"}.

You can find out in detail what changed in version 2.3 [in this illustrated guide](https://docs.drawpile.net/help/common/update2x3x0){:target="_blank"}.

The reason it's at version 2.3.0-beta.3 is one very uninteresting hotfix and one fix where playing a sound on Windows could cause you to no longer be able to rearrange layers, export animations, open file pickers or other strange effects. The story behind that is pretty technical, so I'm putting it in a separate section, you can skip over it if that doesn't interest you.

### The Audio Odyssey

The only thing Drawpile currently uses audio for is to make notification sounds. If someone joins or sends a message in chat or you get disconnected, it makes a bloop. The amount of grief and crashes that these little noises have caused is pretty impressive.

For quite a long time, Drawpile used Qt's multimedia framework to play these sounds. That framework is pretty heavyweight for playing sounds, since it supports a bunch of formats Drawpile doesn't need and can do video playback that isn't necessary. But since Qt is used for other stuff, it's a pretty logical choice.

Unfortunately, Qt multimedia is pretty broken. On Android, it just didn't play any sound at all, not sure if it even supports it. On Linux, it requires a lot of dependencies to work and even after more than doubling the AppImage's size, it was still missing stuff and I just gave up on it. It also sometimes could cause hangs when playing a sound. On Windows, it generally worked, but on some systems it just crashed outright, which is pretty bad.

I tried to fix that by using one of Windows' audio frameworks directly: WinMM. This is an old interface from like Windows 95, which just has a function called `PlaySound`. It's extremely limited, only able to play a WAV file, but that's all Drawpile needs. And that solved the crashes on those systems that Qt multimedia didn't work on.

…and then I found out that it crashed on *other* systems instead. On 32 bit systems it didn't work at all and sound just got disabled there outright. But rarely, some USB audio devices also caused it to crash. So that wasn't the solution either.

Then I switched the audio system to use miniaudio. This is a much more lightweight system only meant for playing audio. It actually works on Android and doesn't need extra dependencies on Linux, so those two platforms got fixed along the way. It also worked on 32 bit Windows and didn't cause crashes, so everything seemed dandy.

And then I started getting reports of weird behavior previously mentioned. When drawing online, layer reordering would stop working. Exporting animations didn't work. File dialogs would just hang forever. Except they worked when drawing offline. And worse, on my own Windows devices, everything was fine, so I was stumped for a while. Then suddenly, the issues started appearing on the old Surface tablet I have, where I could no longer export animations, which meant I could finally go looking for the problem.

How you actually *find* a problem like this is probably also a little interesting, and it's a question several people asked. The problem is totally mysterious, it could have showed up anywhere in the last three months or so and I had no idea where it cropped up. Luckily git, the version control system that's used by most software, can help with this situation. Every change is stored in git as a big list of "commits", you can [see it here](https://github.com/drawpile/Drawpile/commits/main/){:target="_blank"}. Well, it's not always a list, some projects allow it to be a more complicated graph structure instead, letting them branch off and then merge together again later. Drawpile doesn't though, because having it be just a linear list lets you *bisect* it.

Bisection means that you take the last "good" version, which was 2.2.2, and the earliest "bad" version, which I just picked the 2.3.0 beta for. Then git will pick whatever is in the middle of those and you check whether it has the same problem. If yes, you know the problem was introduced either on this commit or earlier. If not, it cropped up later. And this way, you keep halving the list over and over, until you finally reach the single commit that caused the problem, which usually doesn't take long because halving the range of commits each time narrows it down very quickly. Which in this case was the switch to miniaudio, where everything fell into place.

Of course, this only works if you keep things clean along the way. In Drawpile, all the commits are reasonably small, they're kept in a linear sequence and (almost) every commit can be built and tested individually. If you allow your commit history to become a twisting maze of branches, let your commits become huge or have commits that you can't build and test, then this doesn't work anymore. If you're a software developer, you probably heard stuff like "keep commits small" and "every commit must build" as mantras or "keep history linear" as an opinion thrown around, but rarely is there a tangible reason given for those. Well, bisection is one of the big reasons, it lets you use your history as a tool to track down mysterious problems.

Anyway, back to the topic. So how can *audio* of all things cause layer reordering and file dialogs to stop working? Well, because the audio system, drag and drop and file dialogs are all functions provided in Windows. And somehow the audio system corrupted itself so hard that those other Windows functions also stopped working. Specifically, it was the WASAPI audio system, which was introduced in Windows 10. The fix was simple: just disable WASAPI and let miniaudio use some other audio system instead. Windows has plenty of them, so now it usually uses DirectSound. I *think* this fixes everything now, finally. Quite a lot for some bloops though.

## Mac Things

After some calls to Apple's support, I was now finally able to create a developer account with them and have applied to their developer program. That application is currently waiting to be reviewed by them, not sure how long that'll take. Since Drawpile now has a non-profit organization behind it, membership should be free and would mean that you no longer have to jump through hoops to get Drawpile running on macOS. It does not change the situation on iPhone and iPad, Apple does not allow public software like Drawpile on their store.

I've also been able to secure an old Macbook, with which I can now build Drawpile versions for old macOS versions before Monterey. It also lets me test stuff on macOS myself now, at least on this old version of it. I've already fixed some things about the menu, which has some weird quirks compared to other operating systems, and made the hardware renderer work on it.

## Pixel Art Input

Drawpile does a lot of processing to inputs coming from your tablet, like smoothing out the positions, making a clean curve, stabilizing the brush and ignoring sub-pixel jitter. That's generally good and necessary to make your lines come out smooth.

For pixel art (like, spritework, where you poke at individual pixels with a mouse, not just drawing with a binary brush) that stuff gets in the way though. Here you mostly just want to place pixels wherever you click and not have it get intercepted in any way. And sure, you could turn off most of this stuff in the input settings, but then you'd have to change your settings a lot.

So there's now a "pixel art input" setting for round and square pixel brushes. It'll turn off all the smoothing, stabilization and compensation, letting you place pixels instantly. It's not available for MyPaint brushes, since those do even more processing on brush strokes that I'm not sure if it's possible to turn off without breaking the brush engine in half. Although for single-pixel brushes, there's not much reason to use MyPaint brushes I think.

This was reported by Nilifin [on GitHub](https://github.com/drawpile/Drawpile/issues/1301){:target="_blank"} and developed with testing and help from Ben and dAVePAGE.

<video controls>
  <source src="{{ "/assets/vid/help/pixelartinput.mp4" | relative_url }}" type="video/mp4"/>
</video>

## Minor Additions and Bugfixes

Putting labels on blank brush thumbnails now works. This was reported by hipofiz [on Discord](https://drawpile.net/discord/){:target="_blank"}.

You can no longer toggle alpha lock on your eraser tool or slot, which would make it not an eraser anymore.

Exporting animated WEBP with transparency now properly unpremultiplies alpha. Previously it would cause partially transparent pixels to tend toward black.
