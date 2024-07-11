# Mega Man X2 Archipelago Tracker for PopTracker

This is a PopTracker pack for Mega Man X2 Archipelago. Created by MeridianBC.

![](https://raw.githubusercontent.com/BrianCumminger/megamanx3-ap-poptracker/master/images/screenshot.png)

## Installation

Just download the lastest build or source and put in your PopTracker packs folder.

## Features
This is a pre-release beta for Mega Man X2 Archipelago pre-release. Expect logic to be incomplete.

- Pickupsanity
- Jammed buster
- X Hunter Base access conditions (medals/weapons/upgrades/heart/sub/access codes)
- Boss weaknesses
  
Includes individual stage maps showing item locations, with the option to automatically switch tabs (on by default).


## Usage
When using Archipelago auto tracking, logic settings will all be set automatically.  For manual operation (or to check which settings are active), click on the "Open Pack Settings" button at the top of PopTracker while this pack is loaded.

Brief notes for various settings when not using autotracker:
- X Hunter Base options: sets the access requirements for X Hunter Base Stages  If all of these are blank or set to 0, the associated stage will unlock when access codes are acquired.
- Bosses Require Weaknesses: yaml option (`logic_boss_weakness`).  Bosses will be shaded yellow if you can reach and damage them but destroying them is not in logic. When not autotracking, bosses are assumed to have unshuffled weaknesses.
- Jammed Buster: yaml option `jammed_buster` - adds an extra arm upgrade to the pool.  A jammed buster is indicated by a grayed out arms icon with a blue down arrow.
- There are a few access requirements (notably number of boss refights completed) which only update when an item changes.


## More Info

Check out PopTrackers Documentation on packs [here](https://github.com/black-sliver/PopTracker/blob/master/doc/PACKS.md)

Still having trouble realizing your pack and looking for help or just want more information about everything PopTracker? Check out the ['Unofficial' PopTracker Discord Server](https://discord.com/invite/gwThqMCPgK)!

## License

Public Domain