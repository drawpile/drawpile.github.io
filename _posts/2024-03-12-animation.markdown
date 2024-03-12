---
layout: drawpile_post
title: "Animation Plans"
date: 2024-03-12 00:00:00 +0100
category: "devblog"
tag: "@askmeaboutloom"
---

The animation system in Drawpile 2.2 was basically written to serve my own purposes. My ideas on how animation ought to work is different to how it's handled in other software, so I've been writing my own animation programs since a long time, well before I started working on Drawpile.

This is where the unusual bits of Drawpile's animation system come from. The main thing is that in other programs, your layers tend to be your timeline tracks and each key frame is another "version" of a layer. In Drawpile, tracks are tracks, layers are layers and key frames tie a point in a track to the contents of a layer.

This has some advantages. For example, it lets you assign the same layer contents to different frames in the timeline, which is useful for making back-and-forth loops. You can also assign an entire group to a frame and then adjust the visibilities of the contained layers, I've used for e.g. doing different mouth shapes for lip sync assets or blinking eyes. Lastly, I think it ends up being better for collaboration, since it doesn't add another dimension to the canvas that needs to be dealt with and moderated. Instead, animations are just a different way to look at the layers that are already there.

It also has some disadvantages of course, but I got thoughts on fixing that and also ways to extend the system further. I thought about adding pictures to these, but I don't really have concrete ideas for how the user interface should look for this stuff, I just know what functionality there should be. So rather than posting bad concepts, I'll just leave it at the descriptions. If *you* have ideas on how the UI could look like, throw them at me.

## Mark Animations on the Canvas

Currently, you can usually tell that there's an animation on a Drawpile canvas because there's a bunch of layers on top of each other, forming a cursed scribble. To actually view it, you have open the flipbook, then probably fiddle with the cropping because the animation just takes a tiny part of the canvas. That works, but it's really pointless extra effort that every person who wants to look at it has to go through.

It would be nicer if you could mark animations on the canvas explicitly. It would work similar to annotations, some kind of rectangle that floats on top of the canvas. Then, when you hover over that rectangle, it will pop up a play button that you can click on, which opens the flipbook on that area.

This wouldn't be too difficult to implement, it just needs a bit of thinking on how it can be made so that it doesn't get in the way of drawing if the animation area happens to overlap with some non-animated bits of the canvas.

## Per-Animation Timeline

Currently Drawpile's timeline lets you set a framerate and frame count, like most other programs allow. That makes sense if you're working on a single animation together, but it doesn't work right when you have multiple animations. Currently, this can be solved by just making the timeline have a fixed rate and length that's enough for all animations on the canvas and then reduce the speed and frame range in the flipbook as needed.

Again, that's okay, but more effort than necessary. It would be nicer if Drawpile let you change those settings for every animation you got on the canvas instead, since that's what you're really doing. I don't have too clear of an idea how the interface for this would look like though.

This could obviously tie into the on-canvas marking above. Maybe when you create an animation, it also creates a new timeline to go along with it and you can switch to that timeline with an on-canvas button. Not sure, concepts for this would be appreciated.

Ideally, there should still be a global timeline though, since the current approach already works for when you want to collaborate on a single animation and adding extra steps to it.

## Animation Layer Groups

Currently, layers for animations are just spewed into the layer tree directly and presented as if they're just regular layers. That isn't really a suitable interface for those kinds of layers though, since you probably only want to look at the raw layers if you're intending to do something fancy with them.

So instead, there should be a kind of layer group that's marked specifically for animations. The layers inside it could automatically sync to the timeline, which could make it look pretty much like it does in other programs, where you can pretend that the key frames of each track are just different versions of a layer, with the option to break out of that and look at the raw layers if you need it.

A group of this kind would also let Drawpile present animations in a nicer way, since it can just show you the current frame of the animation automatically, which would make switching to Frame View unnecessary and integrate them better into a collaborative canvas. Also also, it would allow for automatically picking a sensible area to crop for the animation playback, since Drawpile could just figure out the bounds of it on its own.

This could also tie into the two ideas above: creating an animation layer group is what could spawn a new timeline.

## Tweening

My own animation process involves a mixture of frame-by-frame and skeletal animation, that is, moving, rotating, scaling and changing the opacity of "layers". Currently, I do the drawing in Drawpile and then orchestrate the animation in other software, which makes sense for bigger projects and games, but not so much for small animations.

So I'd like to be able to assign transformations to layers and ease between them, which is what tends to be called "tweening". That's really the reason why you can assign groups to key frames, I just haven't gotten around to implementing the transformation stuff.

I really don't have an idea for how the user interface should look like for this kind of thing, since my usual process is done through scripting, not via any visual tools. Pretty sure Krita has tweening in its animation system, so I might take a clue from there.
