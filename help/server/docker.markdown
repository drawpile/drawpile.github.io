---
layout: drawpile_help
title: "Server Setup with Docker"
description: "How to set up a dedicated Drawpile server using the all-in-one Docker script."
date: 2024-01-13 00:00:00 +0200
category: "help"
tag: help server
---

This is a step-by-step instruction guide to setting up your own Drawpile server
on a cheap cloud Linux server, using the Docker based [all-in-one installer script](https://github.com/drawpile/dpserver).

The following knowledge is assumed:

 * Basic Linux command line
 * How to connect to a server using SSH
 * How to use a text editor in Linux

## Step 1. Get a (virtual) server

First, you will need an actual server to run the server software on. The Drawpile server is not very demanding, so the cheapest server from [Hetzner](https://www.hetzner.com/cloud), [Digital Ocean](https://www.digitalocean.com/products/droplets), [IONOS](https://www.ionos.com/servers/vps), [OVH](https://www.ovhcloud.com/en/vps/), or any other cloud VPS provider will do just fine. 
<br>You can also use a physical machine at home (even a [Raspberry Pi](https://github.com/Wade821/PiDrawpile)!) but you will need to ensure your Internet connection is up to the task.

When creating the server, you must choose which Linux distribution to use. In this tutorial, I will use Debian.

<div class="message is-info">
<div class="message-body">
Tip: before renting a real server, you can practice by <a href="https://www.debian.org/distrib/netinst">downloading Debian</a> and installing it on virtual machine like <a href="https://www.virtualbox.org/">VirtualBox</a>. Set your VirtualBox machine's network mode to <i>Bridged Adapter</i> so it will get an IP address on your network for easy access.
</div>
</div>

<div class="message is-danger">
<div class="message-body">
<p>There is one thing I <strong>strongly recommend</strong> you to do first before anything else,
and that is <strong>disable password based SSH logins.</strong> Instead, set up and use SSH-keys.
Your cloud service provider likely has good <a href="https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys--2">tutorials you can follow</a>.</p>

<p>If there is just one thing you do to secure your server, do this. There are bots constantly scanning
the Internet for servers with weak passwords. If you don't secure your server,
you <em>will</em> get hacked.</p>
</div>
</div>



## Step 2. Get and run the installer script

First, log in to your server as root. To download the installer script, you will need Git.
If you're using Debian, install it like this:

<pre class="console">apt install git</pre>

Next, download the setup script:

<pre class="console">git clone https://github.com/drawpile/dpserver.git</pre>

Now, you can run the setup script. This will download all the necessary components.

<pre class="console">cd dpserver
./setup.sh
</pre>

The script will first download and install Docker, then the it will ask you some questions
about the server environment. Specifically:

 * Your domain name. If you don't have one, use your server's IP address
 * Whether you want to use Let's Encrypt. You will need a domain name for this to work.
 * If you have a Discord channel where you'd like to relay your server abuse reports

At this point, no server is actually started. If you wish, you can make additional customizations first.
The setup script will write a file named `.env`. You can modify this file later yourself.

Docker-compose is used to manage the actual server processes. Out of the box, the docker-compose file will provide you with:

 * The Drawpile server itself
 * A [list server](https://github.com/drawpile/listserver) (that just shows the active sessions by default)
 * An [abuse report bridge](https://github.com/drawpile/abusereport) (relays server abuse reports to a Discord webhook)
 * A web server
 * Let's Encrypt SSL certificate for the web server
 * [Web admin](https://github.com/drawpile/dpwebadmin)
 * WebSocket support for the web browser version of Drawpile

See the [readme file](https://github.com/drawpile/dpserver/blob/master/README.md) for more information on how to customize the server package. For example, if you already have a web server, you will not want to use the nginx server included in the docker-compose file.


## Step 3. Run the server

Once you're satisfied with the configuration, you can try starting the server up:

<pre class="console">./docker-compose-wrapper up -d</pre>

To update the server components, run `git pull` to update the repository. If you changed any of the files inside, you may have to resolve resulting conflicts. Then run `docker-compose pull`, followed by `docker-compose up -d` to restart the changed services.

You can update the web admin to the latest version by running the `./update-webadmin.sh` script.

Before connecting to the server, if your VPS provider has an additional local firewall (IONOS does!), you should make sure the ports `27750`, `443`, and `80` are allowed.
