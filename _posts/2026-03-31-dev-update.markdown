---
layout: drawpile_post
title: "Dev Update: Week 12 and 13 of 2026"
date: 2026-03-31 00:00:00 +0100
category: "devblog"
tag: "@askmeaboutloom"
---

The last two weeks had some more work on autorecovery and animation, as well as several fixes, particularly for Android. You can try this out [in the alpha release](https://github.com/drawpile/Drawpile/releases/tag/continuous){:target="_blank"}.

I think this is getting pretty close to a beta release. There are still some things I want to change before opening translations, but the big feature of autorecovery should mostly be ready enough to be worth it, especially for people who use Drawpile offline and don't have a safety net of their drawings being in an online session.

## Autorecovery Limits

Autorecovery files now have a limit you can set in the preferences to prevent them from getting overly large and eating up all your disk space in pathological situations. For example, if you idle in a public session for days on end with autorecovery enabled, the recording can get unreasonably large. The same goes if the session is manually reset many times, each of those resets adds quite a lot of size to the recording.

Since this limit is just supposed to be a safety net that is never supposed to be hit in practice, the limit is quite high by default: 5 GiB on desktop, 1 GiB on Android and 500 MiB in the browser. You can configure it in the preferences and you can also change it for individual sessions under File → Manage Autorecovery. Autorecovery files are temporary and get removed upon quitting Drawpile cleanly, so they won't eat all your disk space while not using the program. These limits should be high enough to even record a large multi-user animation project in one go without losing any data, any normal session will be far below that.

When a file hits 75% of the limit, you will get a warning above the canvas. If you keep going and the limit is hit, autorecovery will terminate for the current session.

## Project Compression

When you save to a dppr file, the drawing commands saved to it are now combined and compressed. It uses a similar compression to the pixel data.

From my testing, this can make files 70% smaller if you use particularly egregious brushes. But even realistic often end up half the size of what they were before, without any measurable slowdown when reading or writing the files. You can check the differences yourself by saving to a dppr file and then comparing it with the uncompressed autorecovery dppr file in Drawpile's application data directory.

The autorecovery files are also in the dppr format, but are not compressed like this because that would require buffering many commands in memory before writing them out. That obviously goes against the point of the autorecovery feature, if it's all just in memory and your power goes out, you can't recover it.

## More Move Locking

[Continuing from last week](https://docs.drawpile.net/devblog/2026/03/16/dev-update.html#key-frame-move-locking){:target="_blank"}, key frame move locking is now fully implemented. It has its own icon, you can drag over the locked track to flip through the timeline and using the exposure tool will ignore move-locked trackes, letting you change the exposure on tracks that aren't adjacent to each other.

The actions that previously increased and decreased the exposure of all visible tracks now ignore the move locked ones instead, since that makes more sense.

## Minor Additions and Bugfixes

When you enable long-pressing for context menus, the canvas is now no longer considered to have a context menu. This fixes some cases where the long-press emulation interfered with other interactions.

Sliders and numeric spinners now ignore slight adjustments made immediately before letting go of them. This should fix the annoying issue where you lift your stylus after carefully adjusting a slider to a value and then the slight jitter causes it to get nudged off the desired value.

Text input on Android has been rewritten to a large degree. Hitting spacebar on a physical keyboard should now work as a shortcut again without your keyboard application eating it, the view should no longer turn blue on some devices when pressing a key and text inputs should no longer curse the area of the screen they were on and prevent stylus inputs. All of these only happened on certain devices. This also made it into [Krita 5.3.1](https://krita.org/en/posts/2026/krita-5.3.1-released/){:target="_blank"} already.

On Android, F13 to F24 keys are now handled properly. F21 is translated to middle mouse button by default, which you can toggle in the preferences. This is a workaround for OnePlus styluses, which inexplicably input this key when you press their stylus button, despite Android having perfectly functional stylus button events they could be using. This was reported by [Clover\_Yan on the Krita-Artists forum](https://krita-artists.org/t/my-styluss-side-button-is-not-recognised-by-krita/176767){:target="_blank"} and is also part of [Krita 5.3.1](https://krita.org/en/posts/2026/krita-5.3.1-released/){:target="_blank"}.

Transforms with oversized selection masks now properly get translated to a cut and paste operation. This was reported by phanie [on Discord](https://drawpile.net/discord/){:target="_blank"}.

When you disconnect from a session where you aren't user 1, save the file and then open a file or new document, you no longer end up in a weird situation where you are simultaneously user 1 and whatever other number you had before, which caused permissions to get really loopy and your own strokes to show a user marker on the canvas. This was reported by grimsley [on Discord](https://drawpile.net/discord/){:target="_blank"}.
