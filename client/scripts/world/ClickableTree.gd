extends StaticBody3D

# What item this tree gives the player.
@export var item_name: String = "Log"

# How many logs the player gets per click.
@export var amount_per_click: int = 1

# How much Woodcutting XP this will give later.
# For now, we only print it.
@export var woodcutting_xp: int = 10

func interact(player: Node) -> void:
    print("You chop the tree.")

    if player.has_method("add_item"):
        player.add_item(item_name, amount_per_click)

    print("Woodcutting XP gained: ", woodcutting_xp)
