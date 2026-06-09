extends Camera3D

# Drag the Player node into this slot in the Inspector.
@export var target_path: NodePath

# Camera position compared to the player.
# X = left/right, Y = height, Z = distance behind player.
@export var follow_offset: Vector3 = Vector3(0.0, 8.0, 10.0)

# Bigger number = camera catches up faster.
@export var follow_speed: float = 8.0

@onready var target: Node3D = get_node(target_path) as Node3D

func _process(delta: float) -> void:
    if target == null:
        return

    var wanted_position := target.global_position + follow_offset

    # Move smoothly toward the wanted camera position.
    global_position = global_position.lerp(wanted_position, follow_speed * delta)

    # Always look at the player.
    look_at(target.global_position, Vector3.UP)
