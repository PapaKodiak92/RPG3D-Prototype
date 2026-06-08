# Architecture Notes

This document explains how the project should be organized as it grows.

The goal is to keep the project easy to teach, easy to debug, and easy to expand.

---

## Current approach

Start with a local Godot prototype first.

Do not add a multiplayer server until the local game loop is fun.

Recommended order:

1. Local player movement
2. Local object interaction
3. Local inventory
4. Local skills and XP
5. Local combat
6. Local saving/loading
7. Multiplayer server

---

## Client responsibilities

The Godot client handles:

- Rendering the 3D world
- Player input
- Camera movement
- UI
- Local prototype gameplay
- Showing inventory, XP, and messages

During the early prototype, the client can temporarily own simple gameplay logic so it is easier to teach.

Later, when multiplayer begins, important gameplay rules should move to the server.

---

## Future server responsibilities

The future server should handle:

- Accounts
- Character data
- Player position validation
- Inventory authority
- Skill XP authority
- Combat authority
- Chat
- Trading
- Saving/loading
- World state

The client should never be trusted with final decisions in the online version.

---

## Shared data

The `shared/` folder is for data structures or schemas that both client and server need to agree on.

Examples:

- Item IDs
- Skill names
- Object action names
- Network message formats
- Recipe definitions

---

## Teaching rule

Every new system should have:

- A clear name
- A small file when possible
- Comments for beginner-level concepts
- A matching lesson file in `lessons/`
- A simple test scene or way to test it in-game
