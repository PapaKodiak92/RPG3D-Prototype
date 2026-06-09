# Lesson 04: Clickable Tree

## Mission

Today we are building the first real RPG object: a tree.

When the player clicks the tree:

```text
You chop the tree.
Picked up 1 Log.
Woodcutting XP gained: 10
```

This is the start of gathering, inventory, and skills.

---

## What you will learn

This lesson teaches:

- Game objects
- Visible mesh vs collision
- Functions
- Object interaction
- Basic inventory counting
- Beginner-friendly RPG logic

---

## Important vocabulary

### Mesh

The part we see.

### Collision

The invisible solid/clickable part.

### Function

A named action in code.

Example:

```gdscript
func interact(player):
    print("You chop the tree.")
```

### Inventory

A list of items the player owns.

Example:

```text
Log: 3
Ore: 1
```

---

## Before starting

You should already have:

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

The player should be able to click the ground and move.

---

## Step 1: Pull the latest files

Open PowerShell:

```powershell
cd "$env:USERPROFILE\Desktop\Code\RPG3D-Prototype"
git pull
```

You should get:

```text
client/scripts/world/ClickableTree.gd
```

In Godot, it appears as:

```text
res://scripts/world/ClickableTree.gd
```

---

## Step 2: Create a tree node

In Godot, open:

```text
res://scenes/world/StarterWorld.tscn
```

Right-click:

```text
StarterWorld
```

Add child node:

```text
StaticBody3D
```

Rename it:

```text
OakTree
```

Set `OakTree` position:

```text
Position X: 4
Position Y: 1
Position Z: 0
```

Why Y = 1?

Because our simple tree is about 2 units tall, so this places it above the ground.

---

## Step 3: Add the tree trunk

Right-click:

```text
OakTree
```

Add child node:

```text
MeshInstance3D
```

Rename it:

```text
TrunkMesh
```

Select `TrunkMesh`.

Set:

```text
Mesh: New CylinderMesh
```

Open the `CylinderMesh` settings and set:

```text
Top Radius: 0.25
Bottom Radius: 0.3
Height: 2.0
```

Set `TrunkMesh` transform:

```text
Position X: 0
Position Y: 0
Position Z: 0
Scale X: 1
Scale Y: 1
Scale Z: 1
```

---

## Step 4: Add leaves

Right-click:

```text
OakTree
```

Add child node:

```text
MeshInstance3D
```

Rename it:

```text
LeavesMesh
```

Select `LeavesMesh`.

Set:

```text
Mesh: New SphereMesh
```

Open the `SphereMesh` settings and set:

```text
Radius: 1.0
Height: 1.4
```

Set `LeavesMesh` transform:

```text
Position X: 0
Position Y: 1.2
Position Z: 0
Scale X: 1
Scale Y: 1
Scale Z: 1
```

---

## Step 5: Add tree collision

Right-click:

```text
OakTree
```

Add child node:

```text
CollisionShape3D
```

Rename it:

```text
TreeCollision
```

Select `TreeCollision`.

Set:

```text
Shape: New CapsuleShape3D
```

Open the `CapsuleShape3D` settings and set:

```text
Radius: 0.8
Height: 2.8
```

Set `TreeCollision` transform:

```text
Position X: 0
Position Y: 0.4
Position Z: 0
Scale X: 1
Scale Y: 1
Scale Z: 1
```

This makes the tree clickable and solid.

---

## Step 6: Attach the tree script

Select:

```text
OakTree
```

Attach this script:

```text
res://scripts/world/ClickableTree.gd
```

The script gives the tree an `interact` function.

When the player clicks the tree, the player script sees:

```text
This object has interact(). Use it.
```

---

## Step 7: Press Play

Press Play.

Click the tree.

You should see messages in the Output panel:

```text
You chop the tree.
Picked up 1 Log. Total: 1
Woodcutting XP gained: 10
```

Click it again.

The total should go up:

```text
Picked up 1 Log. Total: 2
```

---

## Step 8: Save your work

When it works:

```powershell
git status
git add .
git commit -m "Add clickable tree gathering"
git pull --rebase
git push
```

---

## Kid challenge

Change these values on `OakTree` in the Inspector:

```text
Amount Per Click
Woodcutting XP
Item Name
```

Try:

```text
Amount Per Click: 2
Woodcutting XP: 25
Item Name: Oak Log
```

Questions:

- What happens when you change the item name?
- What happens when you change the amount?
- What should a better tree give?

---

## Parent notes

Good questions to ask:

- Which part of the tree do we see?
- Which part of the tree gets clicked?
- What is a function?
- What does `interact` mean?
- What does the inventory remember?

Simple explanation:

```text
The tree is an object.
The object has an interact function.
The player clicks the object.
The object gives the player logs.
```

---

## Done checklist

- [ ] `OakTree` exists
- [ ] `OakTree` is a `StaticBody3D`
- [ ] `TrunkMesh` exists
- [ ] `LeavesMesh` exists
- [ ] `TreeCollision` exists
- [ ] `ClickableTree.gd` is attached to `OakTree`
- [ ] Clicking the tree prints chop messages
- [ ] Player receives logs
- [ ] Work is committed and pushed
