# Lesson 01: The First Scene

## Mission

Today we are building the very first tiny 3D world for **RPG3D Prototype**.

By the end, the game will have:

- A ground area
- A player placeholder
- A camera
- A light
- A saved starter scene

This is the first step before movement, trees, inventory, combat, or multiplayer.

---

## What you will learn

This lesson teaches that games are made out of small parts.

In Godot, those parts are called **nodes**.

A **scene** is a group of nodes saved together.

Think of it like this:

```text
Node = one LEGO piece
Scene = a small LEGO build
Game = many scenes working together
```

---

## Before starting

Open the project in Godot.

The Godot project should be here:

```text
RPG3D-Prototype/client/project.godot
```

If the Godot project does not exist yet, finish `lessons/00_SETUP.md` first.

---

## Step 1: Create folders in Godot

Inside the Godot FileSystem panel, create these folders if they do not exist yet:

```text
res://scenes
res://scenes/world
res://scenes/player
res://scripts
res://scripts/player
res://assets
```

These folders help keep the project clean.

---

## Step 2: Create the starter world scene

In Godot, click:

```text
Scene > New Scene
```

Choose:

```text
3D Scene
```

Rename the root node to:

```text
StarterWorld
```

Save the scene here:

```text
res://scenes/world/StarterWorld.tscn
```

---

## Step 3: Add the ground

Right-click `StarterWorld` and add:

```text
MeshInstance3D
```

Rename it:

```text
Ground
```

With `Ground` selected, set its mesh:

```text
Inspector > Mesh > New PlaneMesh
```

Set the PlaneMesh size to:

```text
Size: 20, 20
```

This gives us a flat area to stand on.

---

## Step 4: Add a ground collision shape

The ground needs collision so the player can stand on it later.

Right-click `Ground` and add:

```text
StaticBody3D
```

Rename it:

```text
GroundBody
```

Right-click `GroundBody` and add:

```text
CollisionShape3D
```

Rename it:

```text
GroundCollision
```

With `GroundCollision` selected, set:

```text
Shape: New BoxShape3D
```

Set the BoxShape3D size to:

```text
Size X: 20
Size Y: 0.1
Size Z: 20
```

Move `GroundBody` slightly down:

```text
Position Y: -0.05
```

---

## Step 5: Create a simple player placeholder

Right-click `StarterWorld` and add:

```text
CharacterBody3D
```

Rename it:

```text
Player
```

Right-click `Player` and add:

```text
MeshInstance3D
```

Rename it:

```text
PlayerMesh
```

With `PlayerMesh` selected, set:

```text
Mesh: New CapsuleMesh
```

Set the player position:

```text
Position X: 0
Position Y: 1
Position Z: 0
```

---

## Step 6: Add player collision

Right-click `Player` and add:

```text
CollisionShape3D
```

Rename it:

```text
PlayerCollision
```

With `PlayerCollision` selected, set:

```text
Shape: New CapsuleShape3D
```

This lets the player have a body in the world.

---

## Step 7: Add a camera

Right-click `StarterWorld` and add:

```text
Camera3D
```

Rename it:

```text
MainCamera
```

Set the camera transform:

```text
Position X: 0
Position Y: 8
Position Z: 10
Rotation X: -35
Rotation Y: 0
Rotation Z: 0
```

With `MainCamera` selected, enable:

```text
Current: On
```

This tells Godot which camera the player should see through.

---

## Step 8: Add sunlight

Right-click `StarterWorld` and add:

```text
DirectionalLight3D
```

Rename it:

```text
SunLight
```

Set its rotation:

```text
Rotation X: -45
Rotation Y: 35
Rotation Z: 0
```

This gives the scene light so we can see the world.

---

## Step 9: Set the main scene

Click:

```text
Project > Project Settings
```

Go to:

```text
Application > Run
```

Set Main Scene to:

```text
res://scenes/world/StarterWorld.tscn
```

Close Project Settings.

---

## Step 10: Press Play

Press the Play button.

You should see:

- A flat ground
- A capsule player
- A camera looking at the world
- A lit 3D scene

If the view is black, check the camera and light.

If the player is missing, check the player position.

If the ground is missing, check the ground mesh size.

---

## Step 11: Save your work to Git

Go back to PowerShell inside the project folder:

```powershell
cd "$env:USERPROFILE\Desktop\Code\RPG3D-Prototype"
```

Check the changed files:

```powershell
git status
```

Save the checkpoint:

```powershell
git add .
git commit -m "Create first Godot scene"
git push
```

---

## Kid challenge

Try changing one thing at a time:

1. Make the ground bigger.
2. Move the player to a different starting spot.
3. Move the camera higher.
4. Rotate the sunlight.

After each change, press Play and ask:

```text
What changed?
Why did it change?
Should we keep it?
```

---

## Parent notes

Good questions to ask:

- What is a node?
- What is a scene?
- Which node is the player?
- Which node lets us see the game?
- Which node lights the game?
- Why do we save our work with Git?

The goal is not speed. The goal is understanding.

---

## Done checklist

- [ ] Godot project opens
- [ ] `StarterWorld.tscn` exists
- [ ] Ground is visible
- [ ] Player placeholder is visible
- [ ] Camera is working
- [ ] Light is working
- [ ] Scene runs when Play is pressed
- [ ] Work is committed and pushed to GitHub
