---
layout: drawpile_help
title:  "Customizing Sounds, Icons and Themes"
date: 2023-10-21 00:00:00 +0200
category: "help"
tag: help tech
---

Drawpile comes with a bunch of assets that decide how it looks and sounds. These are just "normal" files, like vector images or sound files. While you *could* just replace these files in your system, that's not recommended because you have to manually back up the existing files and when you install a new version of Drawpile, they'll likely get overwritten again.

Instead, you can put override files into Drawpile's application data directory, which will be loaded instead of the stock files.

## Finding the Application Data Directory

Where this directory is located depends on your operating system:

* On Windows, the easiest way to get to it is to type `%APPDATA%` into the address bar of the file explorer and hitting the Enter key. Then find the `drawpile` directory and double-click on it, inside of it is another `drawpile` directory you need to double-click on. The full path where you end up should be `C:\Users\<Your Username>\AppData\Roaming\drawpile\drawpile`.

* On macOS, the directory is under `~/Library/Application Support/drawpile/drawpile`.

* On Linux, it's under `~/.local/share/drawpile/drawpile`.

You know you found the right directory if you see the files `brushes.db` and `state.db`. There might also be additional files and directories here.

## Customizing the Files

Quit Drawpile before you start messing with these override files! It may not load them properly if you just swap them out underneath a running system.

Read on below on how to swap out [sounds](#sounds), [icons](#icons) and [themes](#themes).

### Sounds

Sound effects go into the `sounds` directory inside [the application data directory](#finding-the-application-data-directory). It doesn't exist by default, so create the directory if you don't see it in there.

To override sound effects, place them in this directory and give them the appropriate name according to the table below. The files must be in WAV format. If your desired sounds aren't in that format, you must convert them, changing the extension is not enough.

<table class="table is-bordered">
    <thead>
        <tr>
            <th>Sound</th>
            <th style="width:100%;">File Name</th>
        </tr>
    </thead>
        <tbody>
        <tr>
            <td>Chat&nbsp;message</td>
            <td style="width:100%;"><code>notif-chat.wav</code></td>
        </tr>
        <tr>
            <td>Private&nbsp;message</td>
            <td style="width:100%;"><code>notif-private-chat.wav</code></td>
        </tr>
        <tr>
            <td>User&nbsp;joined</td>
            <td style="width:100%;"><code>notif-login.wav</code></td>
        </tr>
        <tr>
            <td>User&nbsp;left</td>
            <td style="width:100%;"><code>notif-logout.wav</code></td>
        </tr>
        <tr>
            <td>Canvas&nbsp;locked</td>
            <td style="width:100%;"><code>notif-lock.wav</code></td>
        </tr>
        <tr>
            <td>Canvas&nbsp;unlocked</td>
            <td style="width:100%;"><code>notif-unlock.wav</code></td>
        </tr>
        <tr>
            <td>Disconnected</td>
            <td style="width:100%;"><code>notif-disconnect.wav</code></td>
        </tr>
    </tbody>
</table>

Remember to quit Drawpile before changing the file. After you did so, you can try out the sound by going into Edit → Preferences, switching to the Notifications category and using the buttons under "Preview". Make sure you actually have "Play sound" actually checked, otherwise they won't play.

### Icons

Icons go into the `theme` directory inside [the application data directory](#finding-the-application-data-directory). It doesn't exist by default, so create the directory if you don't see it in there.

Inside that directory, create another directory, depending on your color theme. If you're using a dark theme, such as Krita Dark, create a `dark` directory. If you're using a light theme, such as Qt Fusion, create a `light` directory. The icons for dark themes are mostly white, those for light themes mostly black.

Icons should be square and ideally be in SVG format so that they look right at different sizes. PNG sort of works too, a size of 32x32 pixels usually looks okay.

Place the icon in the directory you created and give it the same name as the stock icon you want to override. Don't change the file extension. Take a look at [the stock icons for dark themes](https://github.com/drawpile/Drawpile/tree/main/src/desktop/assets/theme/dark) and [the stock icons for light themes](https://github.com/drawpile/Drawpile/tree/main/src/desktop/assets/theme/light) to see which ones there are.

Remember to quit Drawpile before changing these files, they won't be loaded until the next time it's started.

### Themes

Theme files are just text files with a funny extension that contain the colors for different elements.

You have to override one of the existing themes, Drawpile currently doesn't allow you to add new ones. Download one of the existing themes from below and place the file into [the application data directory](#finding-the-application-data-directory). They go in there directly, *not* into the `theme` directory. Don't rename the file or let your browser give it a different extension! The download button is on the top-right of the linked pages.

<table class="table is-bordered">
    <thead>
        <tr>
            <th>Theme</th>
            <th style="width:100%;">Download</th>
        </tr>
    </thead>
        <tbody>
        <tr>
            <td>Dark</td>
            <td style="width:100%;"><a href="https://github.com/drawpile/Drawpile/blob/main/src/desktop/assets/nightmode.colors">nightmode.colors</a></td>
        </tr>
        <tr>
            <td>Hot&nbsp;Dog&nbsp;Stand</td>
            <td style="width:100%;"><a href="https://github.com/drawpile/Drawpile/blob/main/src/desktop/assets/hotdogstand.colors">hotdogstand.colors</a></td>
        </tr>
        <tr>
            <td>Krita&nbsp;Bright</td>
            <td style="width:100%;"><a href="https://github.com/drawpile/Drawpile/blob/main/src/desktop/assets/kritabright.colors">kritabright.colors</a></td>
        </tr>
        <tr>
            <td>Krita&nbsp;Dark</td>
            <td style="width:100%;"><a href="https://github.com/drawpile/Drawpile/blob/main/src/desktop/assets/kritadark.colors">kritadark.colors</a></td>
        </tr>
        <tr>
            <td>Krita&nbsp;Darker</td>
            <td style="width:100%;"><a href="https://github.com/drawpile/Drawpile/blob/main/src/desktop/assets/kritadarker.colors">kritadarker.colors</a></td>
        </tr>
    </tbody>
</table>

After placing the file in the correct place, open in a regular text editor, such as Notepad on Windows. Don't use Microsoft Word, LibreOffice Writer or similar document editors, that probably won't work.

Inside the file, there's a bunch of hex colors for the different user interface elements. There's three categories, `[Active]` for windows in focus, `[Inactive]` for windows not in focus and `[Disabled]` for disabled elements. Most themes use the same colors for active and inactive.

Edit the colors to your liking. Start Drawpile and go into Edit → Preferences. In The General category, pick the correct theme and it should show your changed colors.

Remember to quit Drawpile before making further changes, they won't be applied until you restart it.
