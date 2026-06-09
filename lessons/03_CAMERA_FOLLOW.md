# Lesson 03: Camera Follow

## Mission

Today we are making the camera follow the player.

Right now, the camera stays in one spot. After this lesson, the camera will move with the player so the game feels more like an old-school 3D RPG.

---

## What you will learn

This lesson teaches:

- Following another node
- Offsets
- Smooth movement
- `lerp`
- Looking at a target

---

## Important vocabulary

### Target

The target is the object the camera follows.

For us, the target is:

```text
Player
```

### Offset

The offset is how far away the camera stays from the player.

Example:

```gdscript
Vector3(0.0, 8.0, 10.0)
```

That means:

```text
X: 0     no left/right offset
Y: 8     camera is high above the player
Z: 10    camera is behind the player
```

### Lerp

`lerp` means smooth movement from one position to another.

Instead of snapping instantly, the camera glides.

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

The player should already move when you click the ground.

---

## Step 1: Pull the latest files

Open PowerShell in the project folder:

```powershell
cd "$env:USERPROFILE\Desktop\Code\RPG3D-Prototype"
```

Pull the new lesson and script:

```powershell
git pull
```

You should get this file:

```text
client/scripts/camera/FollowCamera.gd
```

In Godot, it appears as:

```text
res://scripts/camera/FollowCamera.gd
```

---

## Step 2: Attach the script to MainCamera

Open Godot.

Open:

```text
res://scenes/world/StarterWorld.tscn
```

Click:

```text
MainCamera
```

Attach this script:

```text
res://scripts/camera/FollowCamera.gd
```

---

## Step 3: Set the target

With `MainCamera` selected, look in the Inspector for:

```text
Target Path
```

Drag the `Player` node into that slot.

This tells the camera:

```text
Follow this player.
```

---

## Step 4: Set the camera offset

With `MainCamera` selected, set:

```text
Follow Offset X: 0
Follow Offset Y: 8
Follow Offset Z: 10
```

Set:

```text
Follow Speed: 8
```

---

## Step 5: Press Play

Press Play.

Click on the ground to move the player.

The camera should follow the player smoothly.

---

## Step 6: Experiment

Try changing the offset.

### Higher camera

```text
Follow Offset X: 0
Follow Offset Y: 12
Follow Offset Z: 12
```

### Closer camera

```text
Follow Offset X: 0
Follow Offset Y: 5
Follow Offset Z: 6
```

### More side angle

```text
Follow Offset X: 5
Follow Offset Y: 8
Follow Offset Z: 10
```

---

## Step 7: Save your work

When it works, save the checkpoint:

```powershell
git status
git add .
git commit -m "Add camera follow"
git pull --rebase
git push
```

---

## Kid challenge

Find the best camera position.

Try three different offsets and answer:

- Which one feels easiest to see?
- Which one feels most like an old-school RPG?
- Which one is too close?
- Which one is too far?

---

## Parent notes

Good questions to ask:

- What object is the camera following?
- What does offset mean?
- What happens if Y is bigger?
- What happens if Z is bigger?
- Why does smooth movement look better than snapping?

Simple explanation:

```text
The camera looks at the player.
The offset keeps the camera behind and above the player.
The lerp makes the camera move smoothly.
```

---

## Done checklist

- [ ] `FollowCamera.gd` exists
- [ ] Script is attached to `MainCamera`
- [ ] `Target Path` is set to `Player`
- [ ] Camera follows player
- [ ] Camera looks at player
- [ ] Offset can be changed
- [ ] Work is committed and pushed
