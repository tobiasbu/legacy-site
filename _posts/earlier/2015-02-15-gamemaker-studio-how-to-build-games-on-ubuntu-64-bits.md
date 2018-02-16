---
layout: post
title: 'GameMaker-Studio: How to build games for Ubuntu 64 bits'
date: 2015-02-15 18:05:39.000000000 -02:00
type: post
published: true
status: publish
categories:
- tutorial
tags:
- game maker
- how to build games ubuntu
- ubuntu
comments: true
lang: EN
---
Hello there!

<p style="text-align:justify;">After good time of searching and trying I finally discover a way to build games from <em>GameMaker: Studio</em> to Ubuntu OS (version 14.04 LTS - 64 bits). Of course you will need the <strong><a title="GameMaker: Studio Supports Linux Publishing -- Ubuntu Export Available Now!" href="http://www.yoyogames.com/news/144" target="_blank">GameMaker:Studio Linux module</a></strong>. In fact, the <a title="Setup GameMaker: Studio for Ubuntu development" href="http://help.yoyogames.com/entries/23167703-Setup-GameMaker-Studio-for-Ubuntu-development" target="_blank">tuturial</a> provided from YoYo Games don't have sufficient information.</p>

<p style="text-align:justify;">To help friends (and for me because I forgot every time when I trying to do this) who develop games with GameMaker, I created this little post to explain step-by-step how to run your games on the beloved Ubuntu.</p>

## 0. For new users: Getting Ubuntu OS

<p style="text-align:justify;">If you have no idea where you can get Ubuntu, you need to visit the <a title="Ubuntu" href="http://www.ubuntu.com/" target="_blank">Ubuntu official web page</a> and dowload the .ISO image (get <a title="Download Ubuntu 14.04 LTS - amd64" href="http://www.ubuntu.com/download/desktop/thank-you/?version=14.04.1&amp;architecture=amd64" target="_blank">here</a>).</p>
<p style="text-align:justify;">Physical machine: Burn a DVD or make a bootable USB with this <a title="How to create a bootable USB  stick on Windows" href="http://www.ubuntu.com/download/desktop/create-a-usb-stick-on-windows" target="_blank">tutorial</a>.</p>
<p style="text-align:justify;">Virtual machine (VM): if you don't have another computer you can try the emulation way. I personally recommend the <a title="Oracle VM VirtualBox" href="https://www.virtualbox.org/" target="_blank">VirtualBox</a> from Oracle.</p>

## 1. Transfer data libs for Ubuntu

<p>To start, you will need the <strong>OpenSSH</strong> tool. GameMaker use this tool to transfer data between networked computers. To do this you should open the <strong>Terminal</strong> application (you can find on Dashboard icon and typing "Terminal").</p>

{% image /posts/xlfeh3.jpg %}

<p>Into this command line, you should type the following lines one at time. Hit enter to confirm the packages installation.</p>

`sudo apt-get install openssh-client`

`sudo apt-get install openssh-server`

<p style="padding-left:30px;">What is "<strong>sudo</strong>"?</p>
<p style="padding-left:30px;">Wikipedia says: "... allows users to run programs with the security privileges of another user (normally the superuser, or root). Its name is a contraction of "substitute user do", meaning to do something as a different user (typically as root, the "superuser")."</p>
<p style="padding-left:30px;">What is the command "<strong>apt-get install</strong>"?</p>
<p style="padding-left:30px;"><strong>apt-get </strong>is a powerfull and fast Package management based in Debian distributions. That helps alot to download/update the most programs you need on your Ubuntu. <strong style="line-height:1.5;">install</strong><span style="line-height:1.5;"> is the function for download and install <em>X</em> package. Example: "I want the Mozilla Firefox web browser. Well, I go to the Terminal. Type: "sudo apt-get install firefox". Type my user password and done!"</span></p>

## 2. Necessary libs on Ubuntu:

<p>When I following the YoYo Games tutorial and build my game I get many errors like this:</p>

{% image /posts/90zgu8.jpg %}

<p>I searching in the internet about this error I have see many people having the same problem. So, I installed another libs to solve this problem and works perfectly. Maybe for you it will be the same thing. Let's install libs to solve this problem:</p>

**1. First of all, following the YoYoGames tutorial: install**

`sudo apt-get install libopenal1`

`sudo apt-get install libxrandr-dev`

`sudo apt-get install libxrandr2:i386`

**2. Now, it's probaly you will get the error of image above. It's necessary this "libstdc++.so".**

`sudo apt-get install lib32stdc++6`

<p>I tried build again, and many other errors appear. You should install other libraries:</p>

{% image /posts/akeio8.jpg %}

**3. After a long time discovering other libraries to run, here is the complete command line of libraries to install:**

`sudo apt-get install zlib1g lib32z1 lib32bz2-1.0 lib32ncurses5 libxxf86vm1 libgl1-mesa-glx:i386 libglu1-mesa:i386 libopenal1:i386 libssl1.0.0:i386`

**4. After all of this big installation list, the game works!**

<p><strong>Description about the libraries that you have just installed:</strong></p>
<p style="padding-left:30px;"><strong>- libopenal1 </strong>and<strong> libopenal1:i386:</strong> is the OpenAL library, the Open Audio Library. is a cross-platform audio application programming interface (API).<br />
<strong>- libxrandr-dev </strong>and <strong>libxrandr2:i386: </strong>provides an X Window System client interface to the RandR extension to the X protocol. The RandR extension allows for run-time configuration of display attributes such as resolution, rotation, and reflection.<br />
<strong>- lib32stdc++6: </strong>contains an additional runtime library for C++ programs built with the GNU compiler. <em>GameMaker compiles games on C++!?</em><br />
<strong>- lib32z1</strong> and <strong>lib32bz2-1.0</strong>: compression library and high-quality block-sorting file compressor library.<br />
<strong>- lib32ncurses5:</strong>  shared libraries for terminal handling.<br />
<strong>- libxxf86vm1: </strong>video mode extension library.<br />
<strong>- libglu1-mesa:i386: </strong>The OpenGL utility library (GLU).<br />
<strong>- libgl1-mesa-glx:i386: </strong>A free implementation of the OpenGL API -- GLX runtime.<br />
<strong><em>- libssl1.0.0:i386: </em></strong>libssl and libcrypto development libraries, header files and manpages. It is part of the OpenSSL implementation of SSL.</p>

## 3. Configure GameMaker:Studio

<p>Open your game project on <em>GameMaker:Studio IDE</em> and go to <strong>File &gt; Preferences &gt; Linux</strong>.</p>

{% image /posts/2q8d0yg.jpg %}

<p style="text-align:justify;"><strong>Linux Host Name: </strong>is the IP address or Device Name of the Ubuntu system. You can get the IP number on your Ubuntu OS on the menu <strong>Settings &gt; Network</strong>. If you want the Device name go to <strong>Settings &gt; Details</strong>.</p>
<p style="text-align:justify;"><strong>Linux User Name </strong>and <strong>Linux Password</strong><strong>: </strong>should contain your login user and password of the Ubuntu.</p>
<p style="text-align:justify;">After this, select if necessary the option "Clear SSH Keys". Then select "Check Linux Connection". If the message "Connection OK!" appears it's everything done and you can go to the next step. If not, something is wrong and try again.</p>

## 4. Build your game!

<p>Congratulations! You should also be able to create a Linux executable and test your games on Ubuntu!</p>
<p>I hope that's "HOW-TO" helps you.</p>
