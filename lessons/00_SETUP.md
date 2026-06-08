# Lesson 00: Setup the Project

## Mission

Today we are getting the computer ready so we can build our game.

The game is called **RPG3D Prototype** for now.

It will be a low-poly 3D RPG where players can click to move, gather resources, craft items, fight monsters, and level skills.

---

## What you will learn

By the end of this lesson, you will know how to:

- Download the project from GitHub.
- Open the project folder.
- Install or open Godot.
- Create the Godot project inside the `client/` folder.
- Save your first project files.

---

## Step 1: Make a coding folder

On the computer, make a folder where coding projects will live.

Good example:

```text
C:\Users\PapaK\Desktop\Code
```

Inside that folder, we will put the game project.

---

## Step 2: Open PowerShell

Open the Start Menu.

Search for:

```text
PowerShell
```

Open it.

Then move into the coding folder.

Example:

```powershell
cd "$env:USERPROFILE\Desktop\Code"
```

If the folder does not exist yet, make it:

```powershell
mkdir "$env:USERPROFILE\Desktop\Code"
cd "$env:USERPROFILE\Desktop\Code"
```

---

## Step 3: Download the project from GitHub

Run this command:

```powershell
git clone https://github.com/PapaKodiak92/RPG3D-Prototype.git
```

Then go into the project folder:

```powershell
cd RPG3D-Prototype
```

Check what is inside:

```powershell
dir
```

You should see folders like:

```text
client
server
shared
docs
lessons
art
tools
```

---

## Step 4: Open the folder in VS Code

Run:

```powershell
code .
```

This opens the project in Visual Studio Code.

If that command does not work, open VS Code manually and choose:

```text
File > Open Folder
```

Then select:

```text
RPG3D-Prototype
```

---

## Step 5: Download Godot

Download the normal Godot 4 version for Windows.

For now, choose the regular version, not the .NET/C# version.

Why?

Because we are starting with GDScript. It is simpler for learning the first game lessons.

Godot does not need a big installer. You unzip it and run it.

---

## Step 6: Create the Godot project

Open Godot.

Click:

```text
Import or Create
```

Create a new project with these settings:

```text
Project Name: RPG3D Prototype
Project Path: RPG3D-Prototype/client
Renderer: Forward+
```

Then click:

```text
Create & Edit
```

Important: the Godot project should be inside the `client/` folder, not beside it.

Correct:

```text
RPG3D-Prototype/client/project.godot
```

Wrong:

```text
RPG3D-Prototype/project.godot
```

---

## Step 7: Save and close

Once Godot opens, close it for now.

Then go back to PowerShell and run:

```powershell
git status
```

You should see new Godot files inside `client/`.

---

## Step 8: Save your work to Git

Run:

```powershell
git add .
git commit -m "Create Godot client project"
git push
```

That saves the work and uploads it to GitHub.

---

## Kid challenge

Answer these questions:

1. What folder holds the Godot game client?
2. What command downloads the project from GitHub?
3. What command shows changed files?
4. What command saves a checkpoint in Git?

---

## Parent notes

Do not rush this lesson.

The goal is for the learner to understand that:

- GitHub stores the project online.
- Git downloads the project to the computer.
- Godot opens and edits the game.
- Git commits save checkpoints.
- Git push uploads checkpoints back to GitHub.
