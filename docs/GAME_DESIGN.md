# Game Design Document

## One-sentence pitch

A low-poly 3D sandbox RPG with RPGWO-style depth and RuneScape-style click-to-move presentation, built as a teaching-friendly father-and-son coding project.

---

## Core pillars

### 1. Skill-based progression

Players improve by doing actions.

Examples:

- Chop trees to improve Woodcutting.
- Mine rocks to improve Mining.
- Smelt ore to improve Smithing.
- Fight monsters to improve Combat skills.
- Cook food to improve Cooking.

No fixed class should lock the player into one role.

### 2. Interactive world

The world should be full of objects with clear actions.

Examples:

| Object | Actions |
| --- | --- |
| Tree | Chop, Inspect |
| Rock | Mine, Prospect |
| Furnace | Smelt |
| Anvil | Smith, Repair |
| Water | Fish, Fill Bucket |
| Door | Open, Close, Lockpick |
| NPC | Talk, Trade |
| Enemy | Attack, Inspect |

### 3. Player-driven economy

NPC shops can help beginners, but useful items should eventually come from gathering, crafting, drops, and trading.

### 4. Readable old-school visuals

The game should be charming, readable, and low-poly. The goal is not realism. The goal is clarity and personality.

### 5. Teaching-first code

Code should be simple enough to explain. Every system should become a lesson.

---

## Starter area idea

### Havenbrook

A small beginner town surrounded by basic resource zones.

Locations:

- Town square
- Bank
- General store
- Blacksmith
- Small forest
- Beginner mine
- Fishing pond
- Rat cellar
- Goblin trail
- Farm plots

Starter loop:

1. Chop trees.
2. Mine ore.
3. Smelt bars.
4. Smith tools.
5. Fight weak monsters.
6. Sell loot or craft better gear.
7. Level skills to unlock better areas.

---

## Early skills

### Gathering

- Woodcutting
- Mining
- Fishing
- Foraging

### Crafting

- Smithing
- Cooking
- Carpentry
- Alchemy

### Combat

- Melee
- Defense
- Archery
- Magic later

### Utility

- Trading
- Building later

---

## MVP features

The first playable version should include:

- Click-to-move player
- Camera follow
- Small 3D map
- Clickable tree
- Clickable rock
- Basic inventory
- Woodcutting XP
- Mining XP
- Simple UI text

Combat, NPCs, saving, and multiplayer come later.
