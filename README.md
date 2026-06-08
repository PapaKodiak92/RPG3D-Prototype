# RPG3D Prototype

A clean-slate low-poly 3D online sandbox RPG prototype.

This project is inspired by the **systems depth of RPGWO** and the **visual/movement feel of classic RuneScape**: a simple 3D world, click-to-move controls, object interaction, gathering, crafting, skills, combat, trading, and long-term online persistence.

This repo also has a second purpose: it is being built as a **father-and-son coding project**. Every major feature should be teachable, readable, and broken into small lessons.

---

## Project vision

Build a small but expandable online RPG where players can:

- Walk around a low-poly 3D world using click-to-move controls.
- Interact with trees, rocks, NPCs, buildings, crafting stations, and enemies.
- Gather resources like logs, ore, fish, herbs, and hides.
- Level skills through use instead of choosing a fixed class.
- Craft tools, weapons, armor, food, potions, furniture, and building pieces.
- Trade with NPCs and eventually with other players.
- Explore towns, forests, mines, dungeons, farms, and wilderness areas.
- Grow from a beginner into whatever playstyle they practice.

The long-term goal is not to copy any existing game. The goal is to build our own old-school sandbox RPG with a clear, learnable codebase.

---

## Teaching goal

This project should teach coding by building real game systems.

Each feature should answer three questions:

1. **What are we making?**
2. **What coding idea does it teach?**
3. **What can a beginner safely change and experiment with?**

Examples:

| Feature | Coding idea |
| --- | --- |
| Player movement | Variables, input, vectors, functions |
| Clickable tree | Objects, methods, events/signals |
| Inventory | Lists/arrays, data models |
| Skill XP | Math, conditions, level formulas |
| Crafting | Recipes, dictionaries/maps, validation |
| Combat | Timers, health, damage, state |
| Saving | Files, JSON, persistence |
| Multiplayer | Client/server, messages, authority |

---

## Planned tech stack

The starting stack is intentionally simple:

- **Client:** Godot 4
- **Language:** GDScript first, C# later if needed
- **Server:** Local/offline prototype first, authoritative C#/.NET server later
- **Database:** SQLite first, PostgreSQL later
- **Art style:** Low-poly 3D
- **Movement:** Click-to-move
- **World logic:** Grid/tile-friendly systems under 3D visuals

The first goal is to make the game fun locally before adding online multiplayer.

---

## First milestone

**Milestone 1: The First Walk**

Build a tiny 3D scene where:

- The player can click the ground and walk to that position.
- The camera follows the player.
- A tree exists in the world.
- Clicking the tree gives the player a log.
- The inventory can show the log count.

This teaches:

- Scenes and nodes
- Variables
- Mouse input
- Raycasting
- Functions
- Object interaction
- Basic inventory data

---

## Repo structure

```text
RPG3D-Prototype/
  client/              Godot game client files
  server/              Future multiplayer server
  shared/              Shared data contracts and schemas
  database/            Future database migrations/seeds
  docs/                Design, architecture, and planning docs
  lessons/             Beginner-friendly coding lessons
  art/                 Concept art, models, icons, textures, references
  tools/               Helper scripts and build tools
```

---

## Development rules

1. Keep systems small and readable.
2. Build one working feature at a time.
3. Prefer clear names over clever code.
4. Add comments when a beginner would need them.
5. Make every feature testable in-game.
6. Do not build multiplayer before the local core is fun.
7. Do not over-engineer early systems.
8. Keep the project clean enough that a beginner can open it and understand what is going on.

---

## Current roadmap

### Phase 0: Setup

- [x] Create repository
- [x] Add README
- [x] Add folder structure
- [ ] Create Godot project inside `client/`
- [ ] Add first test scene

### Phase 1: Local prototype

- [ ] Player character
- [ ] Click-to-move
- [ ] Camera follow
- [ ] Clickable objects
- [ ] Basic inventory
- [ ] Woodcutting
- [ ] Mining
- [ ] XP and levels

### Phase 2: Core RPG loop

- [ ] Combat
- [ ] Loot drops
- [ ] NPC shops
- [ ] Bank/storage
- [ ] Crafting stations
- [ ] Saving/loading

### Phase 3: Multiplayer foundation

- [ ] Account model
- [ ] Server connection
- [ ] Player sync
- [ ] Chat
- [ ] Server-authoritative inventory
- [ ] Server-authoritative skills

---

## Working design sentence

> RPG3D Prototype is a low-poly 3D sandbox RPG prototype with RPGWO-style systems, RuneScape-style click-to-move presentation, and a lesson-based code structure for learning game development.
