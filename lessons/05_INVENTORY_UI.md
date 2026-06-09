# Lesson 05: Inventory UI

## Mission

Today we are making the inventory visible on the screen.

Before this lesson, logs only appeared in the Output panel.

After this lesson, the screen will show:

```text
Logs: 0
```

When the player clicks the tree, it will update:

```text
Logs: 1
Logs: 2
Logs: 3
```

---

## What you will learn

This lesson teaches:

- UI nodes
- Labels
- Panels
- Signals
- Connecting the player to the UI
- Showing game data on screen

---

## Important vocabulary

### UI

UI means user interface.

It is the text, buttons, panels, health bars, inventory, and menus the player sees.

### Label

A label displays text.

Example:

```text
Logs: 3
```

### Signal

A signal is a message one node sends to another node.

In this lesson:

```text
Player gets a log.
Player sends inventory_changed.
InventoryDisplay hears it.
InventoryDisplay updates the label.
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
  OakTree
    TrunkMesh
    LeavesMesh
    TreeCollision
```

Clicking the tree should print log messages in the Output panel.

---

## Step 1: Pull the latest files

Open PowerShell:

```powershell
cd "$env:USERPROFILE\Desktop\Code\RPG3D-Prototype"
git pull
```

You should get:

```text
client/scripts/ui/InventoryDisplay.gd
```

In Godot, it appears as:

```text
res://scripts/ui/InventoryDisplay.gd
```

---

## Step 2: Add the UI root

Open:

```text
res://scenes/world/StarterWorld.tscn
```

Right-click:

```text
StarterWorld
```

Add child node:

```text
CanvasLayer
```

Rename it:

```text
GameUI
```

Why CanvasLayer?

Because UI should sit on top of the 3D world.

---

## Step 3: Add the inventory display

Right-click:

```text
GameUI
```

Add child node:

```text
Control
```

Rename it:

```text
InventoryDisplay
```

Select `InventoryDisplay`.

In the top toolbar, click:

```text
Layout > Top Left
```

Set its transform/offsets:

```text
Position X: 20
Position Y: 20
Size X: 180
Size Y: 60
```

Attach this script:

```text
res://scripts/ui/InventoryDisplay.gd
```

---

## Step 4: Add a panel

Right-click:

```text
InventoryDisplay
```

Add child node:

```text
Panel
```

Rename it:

```text
InventoryPanel
```

Select `InventoryPanel`.

Set:

```text
Position X: 0
Position Y: 0
Size X: 180
Size Y: 60
```

This gives the inventory text a background.

---

## Step 5: Add the log label

Right-click:

```text
InventoryPanel
```

Add child node:

```text
Label
```

Rename it:

```text
LogLabel
```

Select `LogLabel`.

Set text:

```text
Logs: 0
```

Set:

```text
Position X: 10
Position Y: 15
Size X: 160
Size Y: 30
```

---

## Step 6: Connect the UI to the player

Select:

```text
InventoryDisplay
```

In the Inspector, find:

```text
Player Path
```

Drag the `Player` node into that slot.

This tells the UI:

```text
Listen to this player's inventory.
```

---

## Step 7: Press Play

Press Play.

You should see:

```text
Logs: 0
```

Now click the tree.

The label should update:

```text
Logs: 1
```

Click again:

```text
Logs: 2
```

---

## Step 8: Save your work

When it works:

```powershell
git status
git add .
git commit -m "Add inventory UI"
git pull --rebase
git push
```

---

## Kid challenge

Change the label text before pressing play.

Try:

```text
Wood: 0
```

Then press play.

Question:

```text
Why did it change back to Logs: 0?
```

Answer:

```text
The script controls the label when the game runs.
```

---

## Parent notes

Good questions to ask:

- What is UI?
- What is a Label?
- Why is UI different from the 3D world?
- What is a signal?
- Who sends the signal?
- Who listens for the signal?

Simple explanation:

```text
The player owns the inventory.
The UI shows the inventory.
The signal tells the UI when the inventory changed.
```

---

## Done checklist

- [ ] `GameUI` exists
- [ ] `InventoryDisplay` exists
- [ ] `InventoryPanel` exists
- [ ] `LogLabel` exists
- [ ] `InventoryDisplay.gd` is attached
- [ ] `Player Path` is set to `Player`
- [ ] Screen shows `Logs: 0`
- [ ] Clicking the tree updates the log count
- [ ] Work is committed and pushed
