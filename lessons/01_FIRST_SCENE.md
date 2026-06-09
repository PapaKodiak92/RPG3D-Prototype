# Lesson 01: The First Scene

## Mission

Today we are building the very first tiny 3D world for **RPG3D Prototype**.

By the end, the game will have:

- A solid ground area
- A visible player placeholder
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

## Important correction

For this project, the ground should be built like this:

```text
StarterWorld
  Ground                 StaticBody3D
    GroundMesh           MeshInstance3D
    GroundCollision      CollisionShape3D
```

The simple explanation:

```text
Ground = the solid floor object
GroundMesh = what our eyes see
GroundCollision = what the game can click and stand on
```

Do **not** make `Ground` a `MeshInstance3D` root. That makes the lesson harder and easier to mess up.

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

## Step 3: Add the solid ground node

Right-click `StarterWorld` and add:

```text
StaticBody3D
```

Rename it:

```text
Ground
```

This node is the solid floor body.

Set `Ground` transform:

```text
Position X: 0
Position Y: 0
Position Z: 0

Rotation X: 0
Rotation Y: 0
Rotation Z: 0

Scale X: 1
Scale Y: 1
Scale Z: 1
```

---

## Step 4: Add the visible ground mesh

Right-click `Ground` and add:

```text
MeshInstance3D
```

Rename it:

```text
GroundMesh
```

Select `GroundMesh`.

In the Inspector, find:

```text
Mesh
```

Choose:

```text
New PlaneMesh
```

Open the `PlaneMesh` settings and set:

```text
Size X: 30
Size Y: 30
```

Set `GroundMesh` transform:

```text
Position X: 0
Position Y: 0
Position Z: 0

Rotation X: 0
Rotation Y: 0
Rotation Z: 0

Scale X: 1
Scale Y: 1
Scale Z: 1
```

This is the part of the ground we can see.

---

## Step 5: Add the ground collision

Right-click `Ground` and add:

```text
CollisionShape3D
```

Rename it:

```text
GroundCollision
```

Select `GroundCollision`.

In the Inspector, find:

```text
Shape
```

Choose:

```text
New BoxShape3D
```

Open the `BoxShape3D` settings and set:

```text
Size X: 30
Size Y: 0.2
Size Z: 30
```

Set `GroundCollision` transform:

```text
Position X: 0
Position Y: -0.1
Position Z: 0

Rotation X: 0
Rotation Y: 0
Rotation Z: 0

Scale X: 1
Scale Y: 1
Scale Z: 1
```

This is the part of the ground the game can click and collide with.

Very important:

```text
Correct:
GroundCollision Scale = 1, 1, 1
BoxShape3D Size = 30, 0.2, 30

Wrong:
GroundCollision Scale = 30, 0.2, 30
BoxShape3D Size = 1, 1, 1
```

---

## Step 6: Create a simple player placeholder

Right-click `StarterWorld` and add:

```text
CharacterBody3D
```

Rename it:

```text
Player
```

Set `Player` transform:

```text
Position X: 0
Position Y: 1
Position Z: 0

Rotation X: 0
Rotation Y: 0
Rotation Z: 0

Scale X: 1
Scale Y: 1
Scale Z: 1
```

The `Player` node is the main body that will move later.

---

## Step 7: Add the visible player mesh

Right-click `Player` and add:

```text
MeshInstance3D
```

Rename it:

```text
PlayerMesh
```

Select `PlayerMesh`.

In the Inspector, find:

```text
Mesh
```

Choose:

```text
New CapsuleMesh
```

Open the `CapsuleMesh` settings and set:

```text
Radius: 0.4
Height: 2.0
```

Set `PlayerMesh` transform:

```text
Position X: 0
Position Y: 0
Position Z: 0

Rotation X: 0
Rotation Y: 0
Rotation Z: 0

Scale X: 1
Scale Y: 1
Scale Z: 1
```

This is the part of the player we can see.

---

## Step 8: Add player collision

Right-click `Player` and add:

```text
CollisionShape3D
```

Rename it:

```text
PlayerCollision
```

Select `PlayerCollision`.

In the Inspector, find:

```text
Shape
```

Choose:

```text
New CapsuleShape3D
```

Open the `CapsuleShape3D` settings and set:

```text
Radius: 0.4
Height: 2.0
```

Set `PlayerCollision` transform:

```text
Position X: 0
Position Y: 0
Position Z: 0

Rotation X: 0
Rotation Y: 0
Rotation Z: 0

Scale X: 1
Scale Y: 1
Scale Z: 1
```

This lets the player have a body in the world.

---

## Step 9: Add a camera

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
Scale X: 1
Scale Y: 1
Scale Z: 1
```

With `MainCamera` selected, enable:

```text
Current: On
```

This tells Godot which camera the player should see through.

---

## Step 10: Add sunlight

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

## Final scene tree

Your scene tree should look like this:

```text
StarterWorld
  Ground
    GroundMesh
    GroundCollision
  Player
    PlayerMesh
    PlayerCollision
  MainCamera
  SunLight
```

Node types should be:

```text
StarterWorld = Node3D
Ground = StaticBody3D
GroundMesh = MeshInstance3D
GroundCollision = CollisionShape3D
Player = CharacterBody3D
PlayerMesh = MeshInstance3D
PlayerCollision = CollisionShape3D
MainCamera = Camera3D
SunLight = DirectionalLight3D
```

---

## Step 11: Set the main scene

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

## Step 12: Press Play

Press the Play button.

You should see:

- A flat ground
- A capsule player
- A camera looking at the world
- A lit 3D scene

If the view is black, check the camera and light.

If the player is missing, select `PlayerMesh` and make sure its mesh is `CapsuleMesh`.

If the ground is missing, select `GroundMesh` and make sure its mesh is `PlaneMesh`.

If there is a yellow warning on `GroundCollision`, select `GroundCollision` and make sure it has `BoxShape3D` assigned.

---

## Step 13: Save your work to Git

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
- Which node is the solid floor?
- Which node is the visible floor?
- Which node lets the game click the floor?
- Which node is the player?
- Which node lets us see the game?
- Which node lights the game?
- Why do we save our work with Git?

The goal is not speed. The goal is understanding.

---

## Done checklist

- [ ] Godot project opens
- [ ] `StarterWorld.tscn` exists
- [ ] Ground is a `StaticBody3D`
- [ ] `GroundMesh` is visible
- [ ] `GroundCollision` has `BoxShape3D`
- [ ] Player is a `CharacterBody3D`
- [ ] `PlayerMesh` has `CapsuleMesh`
- [ ] `PlayerCollision` has `CapsuleShape3D`
- [ ] Camera is working
- [ ] Light is working
- [ ] Scene runs when Play is pressed
- [ ] Work is committed and pushed to GitHub
