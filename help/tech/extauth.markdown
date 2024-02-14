---
layout: drawpile_help
title: "External Authentication"
description: "Technical documentation on how Drawpile's external authentication works."
date: 2024-01-10 00:00:00 +0200
category: "help"
tag: help tech
---

The external authentication method allows user to log in to a server
as an authenticated (non-guest) user, without sending the password
to that server. It makes it possible for users to log in to
potentially untrusted 3rd party servers using their drawpile.net
account.

It also provides a simple way for site owners to provide a Drawpile
integration to their existing user accounts.

This document describes the ext-auth mechanism.

## Motivation

The Drawpile server supports two levels of users: guest users and
authenticated users. When guest logins are enabled, a user may log in
using any username that hasn't been registered. Thus, there is no guarantee
that the person behind the username is the same as before.

Registered user accounts protect against this, but the server's built-in
user management system offers no out-of-the-box way for users to
self-manage their accounts. Instead, an administrator must add each
user account manually.

This is where the external authentication mechanism comes in. By allowing
the server to delegate user authentication to an external service, an
existing user account management system can be leveraged.

The most simple approach would be to simply relay the username and
password to the authentication server. The authserver would then reply
with "ok" or "wrong password". For basic use cases, such as integrating
drawpile.net's public server with the website, this would be enough.
However, as we want to encourage people to run their own servers,
the ability for third parties to also make use of drawpile.net accounts
is desirable. For this, the simple mechanism is insecure, as there is
no way the user can be sure that the server is not skimming the password
meant for the authentication service.

Described below is a signed token based authentication mechanism that
allows users to log in to a potentially untrusted server without the server
ever seeing their password. This allows any server to permit logins
with drawpile.net (and potentially other) accounts.

## Definition of terms

 * User: the person using the client software
 * Client: the Drawpile desktop software
 * Server: the Drawpile server where a drawing session is hosted (e.g. drawpile.net public server)
 * Authserver: the authentication provider (e.g. drawpile.net website)

## The login process

A quick summary of Drawpile's login process:

1. The client connects to a server and (optionally) upgrades the connection to TLS.
2. The client sends the username the user specified.
3. If guest logins are possible and the given username is not reserved, the client is logged in as a guest.
4. If guest logins are not enabled or the username is reserved, the server asks for a password
5. The client prompts the user for a password, then sends it to the server
6. If the password is correct, the client is logged in.

If ext-auth is enabled in the server, the login process is slightly modified.
The server first checks its internal account list for the user account. If found
there, the normal login process is followed. If not, it will send the client
the URL for the authserver.

The client will then prompt the user for a password for the given authserver.
To provent phishing attacks, there should be a clear visual distinction between
asking for the server internal password and the "single sign on" password, and
the domain of the authserver should be clearly displayed.
The client may save the ext-auth password in a secure wallet for quick login.

The client then makes a HTTPS request to the ext-auth server to authenticate.
If the password is correct, the authserver will return a signed login token.

The client sends the login token to the server. The server will check that the
token's signature matches with the authserver's public key and validates the token.
If the token is valid, the login process is complete.

## Authentication token

The authentication token format is heavily inspired by the JSON Web Token standard.
The format is:

    <version>.<payload>.<signature>

where `version` is the token format version number (`1`),
`payload` is a base64 encoded JSON object and
`signature` is a base64 encoded Ed25519 signature of `<version>.<payload>`

When an avatar image is requested (and returned,) version 2 token format is used:

    2.<payload>.<avatar>.<signature>

The `avatar` is a base64 encoded image file.

The payload contains:

    {
        "username": "username provided by the authserver",
        "flags": ["extra", "privileges", ...],
        "iat": issued at time (seconds since epoch),
        "uid": unique user ID (optional),
        "group": "group ID" (if specified in request),
        "nonce": "random 64 bit hexadecimal string",
    }

The `uid` is an optional field that contains a stable unique identifier
for the user. When the auth server allows users to change their username
(or have alternative usernames,) the uid provides a way to identify the user.
The value should be either an integer or a string. An empty string or null
is treated the same as if the field was omitted entirely.

The Group ID is an optional field that allows user subsets to be
created on the authserver side. When a group is used,
its ID is set in the server configuration. A server must reject
any otherwise valid token with a mismatching group ID. Otherwise,
a user could create a group of their own where they are a moderator,
then use that group's login token to gain mod status on any server.

The nonce is a random number generated by the server during the login
process. It ties the token to the current connection and login
to prevent replay attacks.

## External authentication process

When the server requests external authentication, it passes the following
fields to the client for constructing the auth request:

 * Authserver URL
 * A 64 bit nonce for identifying this auth request (encoded as a hex string)
 * Group ID (if configured)

The client can then make a HTTPS POST request to the given URL:

    {
        "username": "username as given by the user",
        "password": "user's password",
        "nonce": "value given by the server",
        "group": "group ID" (if given),
        "avatar": true (to request avatar picture)
    }

The authserver responds with HTTP 200:

    {
        "status": "auth status",
        "token": "login token",
        "ingroup": "name of the group the user must belong to" (optional)
    }

If the request is invalid (missing fields, group doesn't exist or values
in incorrect format,) the server returns a HTTP 400 error.

Possible statuses are:

 * `auth`: authentication OK, token provided
 * `badpass`: incorrect username/password
 * `outgroup`: this user account is not a member of this group
 * `banned`: this user account is blocked (global ban)

The `token` field is included when status is `auth`. The client can
then send the token to the server to finish the login process.

If the status is `outgroup`, the server may return the
(human assigned) name of the group the user must belong to.
Whether the `ingroup` field is included depends on the authserver.

## Guest logins and external authentication

If guest logins are enabled, the server must check with the authserver
whether a username is reserved or not.

In login step 3, if the username is not found in the server's internal
account list, the server must make a request of its own to the authserver.
This is a simpler form of the request the client sends:

    {
        "username": "username",
        "group": "group ID" (if configured)
    }

The server will respond with:

    {
        "status": "user account status",
        "ingroup": "name of the group the user must belong to" (optional)
    }

The status is one of the following:

 * `auth` - authentication needed
 * `guest` - not a registered username: guest login possible
 * `outgroup` - user account not included in this group
 * `banned` - user account is blocked (global ban)

Enabling guest logins will leak information about the existence of
registered usernames. In some cases this is acceptable if the
usernames can be discovered by other means as well. If not, guest
logins should be disabled. When guest logins are disabled on the
authserver side, the authserver will always return the status `auth`,
even if that username is not registered. (Attempt to authenticate will
then always result in `badpass`)

If the authserver does not support guest logins, guest logins should
be disabled on the drawpile server side as well. This allows the server
to skip the superfluous account check.

The server must also be configured with a fallback mode for times when
the authserver is unreachable:

**Permit guest logins**: Behave as if there is no authserver configured
and allow login as guest.

**No guest logins**: Do not allow guest logins at all. Only users on
the internal account list can log in.

## Server configuration

External authentication process can be customized with the following
configuration settings on the server side:

 * Authserver URL: the URL of the authentication API endpoint. Must use HTTPS.
 * Public key for verifying the token signature.
 * Group ID (optional)
 * Guest login fallback mode: what to do if authserver is unreachable.
 * Respect `mod` flag: allow ext-auth users to be moderators.
 * Whether to permit avatar pictures

When ignoring the mod flag, only accounts on the server's internal
list can be moderators. An alternative is to create a custom authentication
group to select your own moderators.

## Authentication groups

The group ID feature enables the creation of user groups with
different access rights. This is a feature of the authserver, so
how users can be grouped (if at all,) is implementation specific.

From the perspective of the Drawpile server, the group ID is just
an extra field that is passed to the client during the ext-auth process
and checked when validating the login token. The group ID in the token
must match the one configured. If no group is configured, the token
must not contain a group ID. Otherwise, a user could claim
extra privileges by using a valid token from another group.

Typical user group features:

 * Permit login to only a subset of users (whitelist)
 * Ban specific users (blacklist)
 * Limit new session hosting privilege to only a subset of users
 * Respect global moderator status (or not)
 * Group specific moderator list

The public drawpile.net server uses the null group: everyone is
welcome and the default set of privileges apply.
However, another server making use of drawpile.net accounts may
want to restrict who can log in or host sessions.

Example use cases:

 * Public server
   - No group: default privileges apply
   - Guest logins enabled
 * The Big Unofficial Server
   - All users may log in and host sessions
   - Global moderator status respected
   - Group has extra moderators
 * Furry Server (SFW)
   - All users may log in (except for a few on a custom banlist)
   - Guest logins disabled
   - Hosting limited to group members
   - Custom set of moderators
 * Adult Furry Server (NSFW)
   - Login restricted to group members
   - Custom set of moderators
 * Super Secret In Crowd Server
   - Login restricted to a few whitelisted users
   - Server ignores `mod` flag
