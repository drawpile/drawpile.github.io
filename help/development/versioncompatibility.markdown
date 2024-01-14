---
layout: drawpile_help
title:  "Version Compatibility"
date: 2023-12-16 00:00:00 +0200
category: "help"
tag: help development
---

<table class="compat-chart">
    <thead>
        <tr>
            <th>Client</th>
            <th>Server</th>
            <th>Protocol</th>
            <th>Recording</th>
        </tr>
    </thead>
    <tbody>
        <tr class="version-group even">
            <td>2.2.0</td>
            <td class="srv even" rowspan=9>2.x.x</td>
            <td class="proto">dp:4.24.0</td>
            <td class="rec even">24.0</td>
        </tr>
        <tr class="version-group odd">
            <td>2.1.4&ndash;2.1.20</td>
            <td class="proto" rowspan=4>dp:4.21.2</td>
            <td class="rec even" rowspan=4>21.2</td>
        </tr>
        <tr class="version-group odd">
            <td><span class="tip" title="Server 2.1.3 needed for banning of logged out users to work">2.1.3</span></td>
        </tr>
        <tr class="version-group odd">
            <td><span class="tip" title="Fixed layers feature added, color glitch in recolor and other blending modes fixed">2.1.2</span></td>
        </tr>
        <tr class="version-group odd">
            <td><span class="tip" title="Autoreset, trusted user and private messaging features need server version 2.1 to work">2.1.0, 2.1.1</span></td>
        </tr>
        <tr class="version-group even">
            <td>2.0.9&ndash;2.0.11</td>
            <td class="proto" rowspan=4>dp:4.20.1</td>
            <td class="rec even" rowspan=4>20.1</td>
        </tr>
        <tr class="version-group even">
            <td><span class="tip" title="&quot;No guest logins&quot; session option added, needs server version 2.0.8 to work.">2.0.8</span></td>
        </tr>
        <tr class="version-group even">
            <td><span class="tip" title="Ext-auth feature added. Older clients will see the error &quot;invalid state&quot; when logging in with a reserved username">2.0.6, 2.0.7</span></td>
        </tr>
        <tr class="version-group even">
            <td>2.0.0&ndash;2.0.5</td>
        </tr>
        <tr class="version-group odd">
            <td>1.0.5, 1.0.6</td>
            <td rowspan=4 class="srv odd">1.0.x</td>
            <td rowspan=4 class="proto">15.6</td>
            <td rowspan=4 class="rec odd">&leq;15.6</td>
        </tr>
        <tr class="version-group odd">
            <td><span class="tip" title="New feature: cut&amp;paste restriction (requires 1.0.4 server to use, tool UI does not lock in older clients)">1.0.4</span></td>
        </tr>
        <tr class="version-group odd">
            <td><span class="tip" title="New feature: chat message pinning (shown as a regular a chat message to older clients)">1.0.3</span></td>
        </tr>
        <tr class="version-group odd">
            <td>1.0.0&ndash;1.0.2</td>
        </tr>
    </tbody>
</table>

Drawpile's versions consists of three or four parts:

1. The *server* version.
2. The *major* version.
3. The *minor* version.
4. If it's a development or beta release, it will have some kind of suffix identifying it as such.

For example, if you got version `1.2.3`, the server version is 1, major version is 2 and minor version is 3. A beta release may look something like `1.2.3-beta.4`.

A change in the minor version doesn't break any compatibility. It may add new features or fix bugs, but all files and sessions will be interoperable. The [protocol version](#protocol-version) won't change between these.

A change in the major version represents a client-side change. Usually this means that you can't join sessions hosted by different major versions, but the server doesn't need to be updated.

A change in the server version means that the network protocol is entirely incompatible. The client and server version must match for anything to work.

## Protocol Versions

Drawpile's network protocol also has versions. They work similar to the application version.

All clients in the *same session* must share the *exact* protocol version number (e.g. `dp:4.22.0`), unless they happen to provide additional compatibility modes.

A client can use any server that supports the same *server protocol version* (`4` in case of Drawpile 2.0.) However, some new features may not work with older servers.

The protocol version number consists of four parts:

1. namespace (`dp`)
2. server version (`4`, indicates change to client&harr;server protocol)
3. major version(`20`, indicates change to client&harr;client message structure)
4. minor version (`1`, indicates change to client&harr;client message semantics)

See the [protocol revision history](protocol#protocol-revision-history) for details

## Stability Promises

* Compatibility is never broken in patch releases (e.g. 2.0.0 &rarr; 2.0.1)
* Client compatability may only be broken between minor number bumps (e.g. 2.0.0 &rarr; 2.1.0)
* Server compatibility may only be broken between major number bumps (e.g. 2.0.0 &rarr; 3.0.0)
* Any new feature added without a protocol version bump must be backward/forward compatible

## Notes About Recording Compatiblity

* Version 1.0.6 can play recordings made with all previous versions (exact reproduction not guaranteed)
* Version 2.0.0 cannot play recordings made with older versions
* Opening recordings with a newer *minor* number will likely produce unexpected results
* Opening recordings with a newer *major* number will likely result in missing drawing actions
