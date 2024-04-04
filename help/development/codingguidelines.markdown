---
layout: drawpile_help
title: "Coding Guidelines"
description: "The dos and don'ts for writing Drawpile code"
date: 2024-03-30 00:00:00 +0200
category: "help"
tag: help development
---

This page contains the dos and don'ts for code in Drawpile. It's just a general guideline, don't take it as gospel.

* Table of contents
{:toc}

## Dos

Get in contact! Be it [on IRC](https://drawpile.net/irc/){:target="_blank"}, [on Discord](https://drawpile.net/discord/){:target="_blank"} or [in the GitHub Issues](https://github.com/drawpile/Drawpile/issues){:target="_blank"}.

If you need help with something or want to know how to get started, you can ask there. If you want to take on an issue, it also really helps to get in contact so that we know someone is working on it and to avoid duplicate work or conflicts. This is especially important for stuff that changes the network protocol, since that needs to be coordinated properly.

Read [the architecture page](architecture) on where which code lives and check out [the contributing page](contributing) page for contribution guidelines.

Auto-format code. Use clang-format for C and C++, rustfmt for Rust, gofmt for Go, Prettier for JavaScript and TypeScript, black for Python. Some files aren't auto-formatted yet. When you make changes to them, either leave them be and make your new code follow the ambient format or auto-format them in a separate commit. For stuff not covered by the formatter, like includes in C and C++, try to follow the ambient style.

Put an `SPDX-License-Identifier` comment at the top of files. Some code still uses a big, verbose comment block instead. Either leave them be or replace them with an SPDX comment, but don't add new ones of this style.

If you take code from elsewhere, attribute it properly, ideally with an `SPDX-Snippet-` block like so:

```c
// SPDX-SnippetBegin
// SPDX-License-Identifier: Some-License-Identifier
// SDPX—SnippetName: implementation for a taken from project b

...code goes here...

// SPDX-SnippetEnd
```

Keep dependencies to a minimum, they are a maintenance burden and make building Drawpile harder. Remember that you have to get every dependency to build on a slew of different platforms: Linux (Flatpak and AppImage), macOS, Windows (x86 and x64), Android (arm32 and arm64) and WebAssembly. It also must be possible to sensibly develop with it, so the packages should either be available in common Linux distros and vcpkg or must be bundled.

Keep things compatible with both Qt5 and Qt6. Qt6 drops support for Windows 7 and old Android devices, which we are not willing to cut out. It also doesn't come with ANGLE anymore, which is required for OpenGL to actually work on Windows, which in turn we need for the hardware-accelerated canvas renderer.

## Don'ts

Don't take code from elsewhere that's proprietary or otherwise incompatible with the license of the code you're contributing to. Avoid GitHub Copilot or any other machine-learning-based tool that may regurgitate someone else's improperly-licensed code.

Stay away from bonkers language and framework features. There's a long list of these:

* Avoid exceptions and longjmp. The performance is awful, especially in the browser.
* Avoid overuse of RAII. Since Drawpile doesn't use exceptions, you don't have to worry about constructors bailing out early, so it's not necessary to put an RAII wrapper around absolutely everything.
* Avoid templates. They drive compile time into eternity and produce utterly incomprehensible error messages.
* Avoid function overloading. The error messages about type mismatches are long enough if there's only one candidate. This includes `const` overloading. Just give different functions different names.
* Avoid implicit conversion constructors. They mask errors. Put `explicit` on constructors that can take one argument.
* Avoid `auto`. It masks errors if C++ goes on an implicit conversion spree. If the type is particularly egregious to type and isn't otherwise interesting (e.g. an iterator), then it's fine to use it.
* Avoid overusing `const`. For local variables, it's often just noise. For classes, don't use it to the point where you have to write every member function twice and have immense amounts of logic in the syntactic quagmire of the constructor initialization list.
* Avoid ranges from C++20. They take an eternity to compile.
* Avoid C++ std::array. It's verbose and produces terrible error messages, just use a C-style array instead.
* Avoid using Qt enums in settings directly, use their integer values instead. The enums are fragile, you can't move or rename them without them breaking. They also break when switching between Qt5 and Qt6.
* Avoid dealing with settings or Qt metatype stuff during static initialization. That stuff isn't loaded properly yet at that point and will cause assertion failures when using Qt in debug mode.
* Avoid Qt's synchronization primitives (QMutex and friends) in places where performance matters. On Windows, they are glacially slow. Use DP\_Mutex and friends instead, they wrap the platform's synchronization primitives instead and are much faster.

There's some parts of the code that flagrantly violate the above. They continue to cause problems because of it and will probably need to be rewritten at some point.

Don't write Doxygen/JavaDoc style comments, their structure is too repetitive. If you want to document something in a comment, just write it in plain prose instead.

Don't try to design stuff with imaginary future extensibility. Usually this just leads to more complex code that in the end isn't extensible where it's needed. Simpler code is more malleable and can be changed more easily when new requirements come up.

Using Qt Designer for UIs is mildly discouraged. It's pretty clunky to use, often makes a mess of stuff like the tab order, makes it harder to figure out where connections are made and the merge conflicts it generates are virtually unsolvable. However, if it makes your task easier, feel free to use it.

Please don't submit pull requests that only change formatting but do nothing else useful. You can adjust code that you're actually working on and exercising, but making sweeping changes causes bugs to sweep in.
