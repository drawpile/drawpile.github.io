---
layout: drawpile_help
title:  "Network Protocol"
description: "How Drawpile's network message protocol works."
date: 2023-12-16 00:00:00 +0200
category: "help"
tag: help development
---

Drawpile uses a message-based protocol. Each message begins with a header containing the length of the message, the type and the user ID.

Messages can be divided into different categories in three different ways:

 * Recordable/non-recordable messages
 * Transparent/opaque messages
 * Control/Meta/Command

Control messages are used for general client/server communication. They are not recordable.

Meta messages are used for things not directly related to drawing, such as user login notifications and access control changes.

Command messages are used to perform drawing and other canvas manipulation. The bulk of Drawpile traffic consists of command messages.

Transparent messages are those message types the server needs to understand. They include all Control messages and some Meta messages. The server does not parse Opaque messages, but merely passes them along to the clients. Most Meta and all Command messages are opaque.

Each message begins with a header indicating its length, type and user ID:

```
┌────────┬──────┬─────────────────────┐
│ LENGTH │ TYPE │ USERID │ PAYLOAD... │
└────────┴──────┴─────────────────────┘
```

The length field indicates the length of the payload data. The full length of the message is 4 + payload length.

As of Drawpile 2.2, the protocol messages are defined [in the protocol.yml file](https://github.com/drawpile/Drawpile/blob/main/src/drawdance/generators/protogen/protocol.yaml).

## Protocol Revision History

The protocol version number consists of four parts: namespace, server, major and minor version.

A server can support any client whose server number matches that of the server. The namespace allows non-Drawpile clients to use the same server as well.

A change in the major number indicates changes to the message format (e.g. added or removed fields or message types.) A change in the minor version indicates that the client interpretation of some commands has changed. (E.g. new brush drawing algorithm that results in a different shape for the same settings.)

Clients can connect to any server sharing the same server protocol version number, but all clients in the same session must share the exact version. Version numbers are also used to determine whether a session recording is compatible with the user's client version. Some client versions may provide compatibility modes with earlier versions to ease transitions.

Protocol stability promises:

 * No breaking changes between patch releases (e.g. 2.0.0 and 2.0.1)
 * Client compatability may only be broken between minor number bumps (e.g. 2.0.0 and 2.1.0)
 * Server compatibility may only be broken between major number bumps (e.g. 2.0.0 and 3.0.0)
 * New server features may be added at any time, but they should not break older clients,
   nor should a missing feature break newer clients.

### Protocol dp:4.24.0 (2.2.0)

* Added DrawDabsMyPaint command
* Added numerous new blend modes
* Added MoveRect command
* Added TransformRegion command, subsuming MoveRegion (which is still there for compatibility)
* Added layer tree manipulation commands for layer group support
* Added timeline manipulation commands
* Added metadata manipulation commands
* Added UndoDepth command
* Added additional feature level tiers for timeline, metadata and MyPaint brushes
* Made locking of user 0 count as a reset lock

The skip of the version number is due to different protocol stuff being experimented with in the beta of Drawpile 2.2.0.

### Protocol dp:4.21.2 (2.1.9)
* User 0 (server) is now always treated as Operator tier. (Change for experimental smart server)

### Protocol dp:4.21.2 (2.1.2)
* Added FIXED flag to LayerAttributes. (Minor protocol stability promise break, but 2.1.1 is still a beta version)

### Protocol dp:4.21.2 (2.1.0)

* Changed PutImage pixel format to `ARGB32_Premultiplied`
* Added PutTile command
* Removed ToolChange and PenMove commands
* Added DrawDabsClassic and DrawDabsPixel commands
* Added CanvasBackground command
* Added TrustedUsers command
* General session lock is now applied with the LayerACL command by using layer ID 0
* Removed "lock new users by default" feature
* Replaced SessionACL message with FeatureAccessLevels message
* Added sublayer field to LayerAttributes command
* Added flags field and "censored" flag to LayerAttributes command
* Added PrivateChat transparent meta message

### Protocol dp:4.20.1 (2.0.9)

* Added `Filtered` message type. Fully backward compatible.

### Protocol dp:4.20.1 (2.0.0)

* Protocol major revision 4. Lots of changes!
* Message header now includes the user ID

### Protocol 15.6 (1.0.0)

* Added "Behind" blending mode
* Added "Color erase" blending mode
* PutImage now uses regular brush/layer blending modes

### Protocol 15.5 (0.9.10)

* Merged LayerCopy with LayerCreate

### Protocol 14.5 (0.9.9)

* Implemented LayerCopy
* Fully backward compatible

### Protocol 13.5 (0.9.8)

* Added ERASE and UNDER composition modes to PutImage
* Fully backward compatible

### Protocol 13.4 (0.9.7)

* Layer IDs and annotation IDs are now 16 bits long and assigned by the client.

### Protocol 12.4 (0.9.6)

* Added Ping message type
* Added smudge fields to ToolChange message
* Brush size now means brush diameter instead of radius
* Login protocol change: session ID prefixed with '!' means ID was user specified

### Protocol 11.3 (0.9.5)

* Added preserve alpha blending mode
* Fully backwards compatible

### Protocol 11.2 (0.9.3)

* Added ACTION flag to Chat message.
* Fully backwards compatible: No server changes needed and older clients will simply ignore the flag.

### Protocol 11.2 (0.9.2)

* Various changes to the login process to fix bugs and to support authenticated logins
* Added maxUsers field and PERSISTENT flag to SessionConf message
* Increased SessionConf::attrs length to 16 bits to make room for more future attributes
* Session ID format change: replaced numeric IDs with strings of format [a-zA-Z0-9:-]{1,64}
* Added "flags" field to Chat message
* Changed some operator commands
* Increased UserAttr::attrs length to 16 bits to make room for more future attributes
* Added MOD and AUTH UserAttr attributes
* Use int32 coordinates in PutImage, CanvasResize and FillRect
* Breaks compatiblity with previous version
* First version to support session hibernation

### Protocol 10.2 (0.9.0)

* New login process to support multiple sessions on a single server
* Added Disconnect message
* No change in recording format

### Protocol 9.2: (0.8.6)

* MovePointer command coordinates now use 1/4 pixel resolution (same as normal brushes)
* MovePointers were not recorded in earlier versions, so backwards compatibility is maintained.
* New meta command: Marker
* Client side change: minor changes to stroke rendering
* Recordings are backward compatible with 7.1 and 8.1, but strokes may be drawn slightly differently

### Protocol 8.1:

* New command: FillRect
* New meta command: MovePointer
* Fully backward compatible with 7.1

### Protocol 7.1:

* First protocol revision that can be recorded.
