---
layout: project
title: Odalric Bot
permalink: /portfolio/odalric/
date: 2018-02-23 00:54:00.000000000 -03:00
portfolio: true
---

## Source code

{% boxlink https://github.com/tobiasbu/odalric\0\0Get source code on GitHub %}

## Description

OdalricBot is a Terran StarCraft BroodWar bot written from scratch in C++ based on BWAPI 4.1.2.

The architeture is based on managers strongly inspired on [UAlbertaBot](https://github.com/davechurchill/ualbertabot){:target="_blank"} and [Steamhammer](http://satirist.org/ai/starcraft/steamhammer/){:target="_blank"}.

Development focused on the robustness and expansion of the architecture. However, given the short development time, the bot efficiency is unbalanced.

## Features

- Workers Manager;
- Scouting: find the enemy base;
- Terrain Analyzer that runs in background, analyzing and classifying the tiles in 'buildable' or walkable and search for best place for future bases; 
- Resource Area Manager: find all minerals and geysers available in the map creating Resources Zones; 
- Building and Build Plan Managers;
- Commander Manager: order next actions from Strategy Manager and Tactics Data; 
- Utilities classes: Math, Quick Commands, Draw, Debugging, IO and more... 

## Architecture

The follow image shows the final architecture approach. There is a lot of features that is missing mainly about the Combat manager and continuous strategies.

{% image /portfolio/odalric_architecture.png %}

## References

- [BWAPI Documentation](https://bwapi.github.io/){:target="_blank"}
- [SSCAIT](https://sscaitournament.com/){:target="_blank"}
- [Jay Scott](http://satirist.org/){:target="_blank"}
- [Starcraft AI Blog](http://satirist.org/ai/starcraft/blog/){:target="_blank"}
- [UAlbertaBot](https://github.com/davechurchill/ualbertabot){:target="_blank"}
- [Steamhammer](http://satirist.org/ai/starcraft/steamhammer/){:target="_blank"}
- [OpprimoBot](https://github.com/jhagelback/OpprimoBot){:target="_blank"}

## Details:

<p style="font-size:0.8em">
<strong>Version:</strong> 1.0.0<br>
<strong>Language:</strong> C++<br>
<strong>Purpose:</strong> Academic.<br>
<strong>Date:</strong> June, 2017.<br>
</p>