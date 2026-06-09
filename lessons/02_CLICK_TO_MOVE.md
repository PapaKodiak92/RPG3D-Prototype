# Lesson 02: Click-to-Move

## Mission

Today we are making the player move.

The player will click on the ground and the character will walk toward that spot.

This is the first RuneScape-style movement feature.

---

## What you will learn

This lesson teaches:

- Variables
- Functions
- Mouse input
- Raycasting
- 3D positions
- Movement speed
- Physics movement

---

## Important vocabulary

### Variable

A named value the game remembers.

Example:

```gdscript
var move_speed = 5.0
```

### Function

A named set of instructions.

Example:

```gdscript
func move_player():
    pass
```

### Raycast

A raycast is an invisible line that checks what the mouse clicked in the 3D world.

Think of it like pointing a laser from the camera into the game.

### Destination

The destination is the place where the player wants to walk.

---

## Before starting

You should already have:

- `StarterWorld.tscn`
- A `Player` node
- A `MainCamera` node
- A `Ground` object with collision

If clicking does nothing later, the ground probably needs collision.

---

## Step 1: Pull the latest lesson files

Open PowerShell in the project folder:

```powershell
cd "$env:USERPROFILE\Desktop\Code\RPG3D-Prototype"
```

Get the latest files:

```powershell
git pull
```

This should download this script:

```text
client/scripts/player/ClickToMovePlayer.gd
```

---

## Step 2: Attach the script to the Player

Open Godot.

Open:

```text
res://scenes/world/StarterWorld.tscn
```

Click the `Player` node.

In the Inspector, attach this script:

```text
res://scripts/player/ClickToMovePlayer.gd
```

If the script is not there, copy it from:

```text
client/scripts/player/ClickToMovePlayer.gd
```

into Godot's `res://scripts/player/` folder.

---

## Step 3: Set the camera path

With `Player` still selected, look in the Inspector for:

```text
Camera Path
```

Drag the `MainCamera` node into that slot.

This tells the player script which camera is being used to click the world.

---

## Step 4: Make sure the ground has collision

Click the ground collision node.

The scene should have something like this:

```text
StarterWorld
  Ground
  GroundBody
    GroundCollision
  Player
    PlayerMesh
    PlayerCollision
  MainCamera
  SunLight
```

The important part is that the ground needs a `StaticBody3D` and `CollisionShape3D` so the raycast can hit it.

If your `GroundBody` is inside `Ground`, that is okay too.

---

## Step 5: Press Play

Press Play.

Click somewhere on the ground.

The player should walk toward the clicked spot.

You should also see a message in the Godot Output panel like:

```text
Walking to: (x, y, z)
```

That means the mouse click is working.

---

## Step 6: Read the important code

This variable controls speed:

```gdscript
@export var move_speed: float = 5.0
```

This variable tells the player when to stop:

```gdscript
@export var stop_distance: float = 0.15
```

This checks for left mouse clicks:

```gdscript
if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
```

This moves the character:

```gdscript
move_and_slide()
```

---

## Step 7: Save your work to Git

When it works, save it:

```powershell
git status
git add .
git commit -m "Add click-to-move player movement"
git push
```

---

## Kid challenge

Change `move_speed` and test it.

Try:

```text
2.0
5.0
8.0
12.0
```

Answer:

- What number feels too slow?
- What number feels too fast?
- What number feels like an old-school RPG?

Bonus challenge:

Change `stop_distance`.

What happens if it is too big?

---

## Parent notes

Good questions to ask:

- What is a variable?
- What does `move_speed` control?
- What does the mouse click create?
- Why does the ground need collision?
- What happens when the player reaches the destination?

The important lesson is:

```text
Click mouse -> find 3D position -> set destination -> move toward destination
```

---

## Done checklist

- [ ] Latest files pulled from GitHub
- [ ] Script attached to Player
- [ ] MainCamera assigned to Camera Path
- [ ] Ground has collision
- [ ] Clicking ground moves player
- [ ] Speed can be changed
- [ ] Work is committed and pushed
