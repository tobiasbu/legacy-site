---
layout: post
title: 'Last Challenge of 2014: An Arduino game'
date: 2015-01-11 20:23:39.000000000 -02:00
type: post
published: true
status: publish
categories:
- productions
tags:
- arduino
- desafio de verao
- marduino
- platform game
- summer challenge
comments: true
lang: EN
---
Hi. That is my first post in English. :)

I took a long time to post something here. Well 2015 is here and lets recover wasted time.

Summer in Brazil is on November-February and every summer I challenge myself to do some Game or App with another engine, programming language or technology. A friend borrow me an <a href="http://arduino.cc/en/Main/ArduinoBoardUno">Arduino Uno</a>. I never seen and programmed in an Arduino before.

## The Challenge:

{% image /portfolio/screen_marduino0.jpg\0\0width:540px %}

The challenge consist to make a platform game in <a href="http://www.arduino.cc/">Arduino</a> Uno with the components: <a href="http://www.adafruit.com/product/338">Nokia 5110</a> display, <a href="http://en.wikipedia.org/wiki/Buzzer">Piezo buzzer</a> and three buttons. Also I did need to learn about "How Arduino works" and "How the C language works on Arduino".

## Planning:

A platform game like<a href="http://pt.wikipedia.org/wiki/Super_Mario_Land"> Super Mario Land</a> for GameBoy. That's it was I thinking to do but few things I've done.

- <span style="color:#008000;">Basics platform player controls</span>;<br />
- <span style="color:#008000;">Side-scroll map control using tile map</span>;<br />
- <span style="color:#ff6600;">Song using Piezo Buzzer</span>;<br />
- <span style="color:#ff0000;">1-2 Enemies AI;</span><br />
- <span style="color:#ff6600;">2-3 Levels;</span><br />
- <span style="color:#008000;">Title Screen</span>;

<span style="color:#008000;">Green</span> = Implemented | <span style="color:#ff6600;">Orange</span> = almost implemented | <span style="color:#ff0000;">Red</span> = Not implemented

## Problems during development:

The biggest problem that I faced was the song because I using Piezo buzzer and all searches in Google failed. Every article that I found in internet uses this little piece of code:

{% highlight c %}
digitalWrite(targetPin, HIGH);
delayMicroseconds(delayValue);
digitalWrite(targetPin, LOW);
delayMicroseconds(delayValue);
{% endhighlight %}

This piece of code you should use inside a loop to execute a song note. <span style="color:#ff6600;">digitalWrite</span>(<em>pin</em>, <em>value</em>) is function to send if the <em>x</em> pin of Arduino must be turned on or off (LOW or HIGH). So, when you use <span style="color:#ff6600;">delayMicroseconds</span>(<em>x</em>) you will stop all the program process for <em>x</em> milliseconds also stopping the game loop. The solution I've found is use timer functions: <span style="color:#ff6600;">millis</span>() or <span style="color:#ff6600;">micros</span>():

{% highlight c++ %}
unsigned long buzzCurrentTimer = micros();

if (buzzCurrentTimer - buzzPreviousTimer <= delayValue)
{
      buzzPreviousTimer = buzzCurrentTimer;
      digitalWrite(targetPin, LOW);
}
{% endhighlight %}

I don't know why but doesn't works. I lost a long time trying to discover how I can write a code which plays background song. Maybe the game loop is too much thing to process. This failed implementation destroy the time for implement other features.

## Results:

The results of the challenge of this summer you can watch on this video:

{% video https://www.youtube.com/embed/y5DeofZac5w\0wide %}

## Source Code:

[GitHub Repository](https://github.com/tobiasbu/marduino)

## Thanks:

I would like to say thanks to my friend Reginaldo da Silva who teach me a little bit about electronics and to lend me his Arduino Uno.
