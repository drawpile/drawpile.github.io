---
layout: drawpile_post
title:  "Dev Update: Week 48 of 2023"
date: 2023-12-03 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---

Another week of bugfixes mostly, but also some work on documentation. Since there's no relevant open bugs left, next week will probably see the release of 2.2.0-beta.11. Unless there's further bugs found that warrant another in-between version, it'll be the last beta release before the final 2.2.0 one.

Everything mentioned is available in the [in the continuous development release](https://github.com/drawpile/Drawpile/releases/tag/continuous){:target="_blank"}.

## Documentation Relocation

Drawpile's documentation is in the process of being updated and moved to this site (docs.drawpile.net), rather than having it all scattered in like three or four different places. The help pages now have [a proper index](/help/){:target="_blank"} there.

Pages for [Frequently Asked Questions](/help/common/faq){:target="_blank"} and [Hosting Sessions](/help/common/hosting){:target="_blank"} have been added.

## Hosting Clarification

The host dialog has been adjusted a bit to hopefully prevent some common mistakes by pointing them out with a warning at the top.

Least importantly, it now tells you that you have to give a title to your session. Before it would just disable the Host button at the bottom, but would give you no indication as to why it was disabled.

If you don't type in a password, the dialog now warns you that your session will be public. While this may be obvious to some people, it wasn't clear to others, leading to them getting scared by strangers "hacking" into their session or resorting to just kicking anyone who joined. The dialog also offers to generate a password for you now and it's no longer hidden from you, since it's not *that* kind of password, you're supposed to share it with your friends after all. Drawpile's invite links include the password by default now, since that just makes sense.

Finally, if you choose the "host on this computer option", you get a message about that requiring further setup and linking to [the help page that explains port forwarding](/help/common/hosting#hosting-on-your-computer){:target="_blank"}. The invite dialog shows similar warnings already, but not everyone uses that, so it's better to have it here too.

![Host dialog]({{ "/assets/img/2023-12-03_hostdialog.webp" | relative_url }})

## 32 Bit Releases

Since there's still a few devices out there that need it, 32 bit releases now get built automatically for Windows and Android so that 2.2.0 can be provided for those too. The [continuous release page](https://github.com/drawpile/Drawpile/releases/tag/continuous){:target="_blank"} now has them as options. Most people will need the 64 bit versions though, so that's what it encourages you to use.

There's also some 32 bit Linux systems out there of course, but building Drawpile on Linux yourself is really easy, so there's no need to provide anything pre-built that might end up not being compatible because of other reasons.

## Minor Additions and Selected Bugfixes

When resizing from a selection, the aspect ratio no longer gets locked even though the checkbox is unchecked. Checking it will also no longer reset the aspect ratio, it'll just keep the current one. This was reported by Meru [on Discord](https://drawpile.net/discord/).

Onion skins now use a partially transparent color by default so that solid fills don't turn into monocolored blobs. You can change this by clicking on the onion skin color, as you could before, this just changes the initial values. Reported by BulletPepper [on Discord](https://drawpile.net/discord/).

Certain zoom levels and rotations should no longer make the pixels on the canvas move around slightly as you draw over them. This fix was contributed by Meru.

Clicking on the freehand tool button while your brush is in a non-Normal mode will no longer reset it if you're coming from another tool. Instead it will only do the reset if you already have it selected, as it was supposed to. Reported by Big Piston [on Discord](https://drawpile.net/discord/).
