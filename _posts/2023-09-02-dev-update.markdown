---
layout: drawpile_post
title:  "Dev Update: Week 35 of 2023"
date: 2023-09-02 00:00:00 +0200
category: "devblog"
tag: "@askmeaboutloom"
---
Last weekend, [Drawpile 2.2.0-beta.7](https://drawpile.net/news/release-2.2b7/) was released. Since then, there's mostly been work behind the scenes and bugfixes.

## Mark Re-Used Key Frames

The timeline now shows frames that are the same as the currently selected one with a dithering pattern. I was animating something and wanted a faster way to figure out what frames I needed to copy before editing them further.

In this image, frame 9 is selected, frame 19 is shown dithered because it's referring to the same layer.

![Timeline with re-used frame]({{ "/assets/img/2023-09-02_reusedframes.webp" | relative_url }})

## Return of the Command-Line Tools

Drawpile 2.1 came with two command-line tools to manipulate recordings: dprectool and drawpile-cmd. They were missing in action for a bit, but are now making their return.

For now, drawpile-cmd, the tool that renders recordings to images, is still in the works. I got it to make a few timelapses from recordings already though, so it's making good headway.

But dprectool, the tool to convert recordings between binary and text, is already back, and it works mostly like it did before:

```
$ dprectool --help
ARGS:
    [input]
      Input recording file.

OPTIONS:
    -v, --version
      Displays version information and exits.

    -o, --out <output>
      Output file. Use '-' for stdout, which is the default.

    -f, --format <format>
      Output format, one of 'guess' (the default), 'binary' (.dprec) or
      'text' (.dptxt). Alternatively, 'version' will print the recording
      version and exit.

    -e, --input-format <input_format>
      Input format, one of 'guess' (the default), 'binary' (.dprec) or
      'text' (.dptxt).

    -A, --acl
      Performs ACL filtering. This will filter out any commands that the
      user wasn't allowed to actually perform, such as drawing on a layer
      that they didn't have permission to draw on. The Drawpile client
      would also filter these out when playing back a recording.

    --msg-freq
      Print message frequency table and exit.

    -h, --help
      Prints help information.
```

## Minor Additions and Selected Bugfixes

The canvas view no longer blurs itself in situations where the pixels are at a 1:1 ratio, such as mirroring the canvas while at 100% zoom. This was reported [by SadColor on GitHub](https://github.com/drawpile/Drawpile/issues/1144).

Hitting the flipbook shortcut while it's in focus will refresh it now.

The flipbook no longer lets you extend the range of frames beyond the end of the animation. It will also now advance the end of the range if you change the frame count and it was at the end before, rather than making you increase it manually.

Event compression is now turned off. This feature basically eats cursor movements while the application is busy, causing it to appear to do huge jumps from Drawpile's perspective. That causes lines to go all jaggy on slower machines though. Supposedly it didn't apply to pen tablets before, but it's now disabled for everything.
