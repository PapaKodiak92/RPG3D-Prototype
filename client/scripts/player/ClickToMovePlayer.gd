extends CharacterBody3D

# How fast the player walks.
# Bigger number = faster movement.
@export var move_speed: float = 5.0

# How close the player needs to get before stopping.
@export var stop_distance: float = 0.15

# We will drag MainCamera into this slot in the Godot Inspector.
@export var camera_path: NodePath

var destination: Vector3
var has_destination: bool = false

@onready var camera: Camera3D = get_node(camera_path) as Camera3D

func _ready() -> void:
    # Start with the destination equal to where the player already is.
    destination = global_position

func _unhandled_input(event: InputEvent) -> void:
    # This checks for a left mouse click.
    if event is InputEventMouseButton:
        if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
            set_destination_from_mouse(event.position)

func _physics_process(_delta: float) -> void:
    if not has_destination:
        velocity = Vector3.ZERO
        move_and_slide()
        return

    # We only care about X and Z for walking on flat ground.
    var flat_position := Vector3(global_position.x, 0.0, global_position.z)
    var flat_destination := Vector3(destination.x, 0.0, destination.z)
    var direction := flat_destination - flat_position

    # Stop when we are close enough to the clicked spot.
    if direction.length() <= stop_distance:
        has_destination = false
        velocity = Vector3.ZERO
        move_and_slide()
        return

    direction = direction.normalized()

    velocity.x = direction.x * move_speed
    velocity.y = 0.0
    velocity.z = direction.z * move_speed

    # Turn the player to face where they are walking.
    look_at(Vector3(destination.x, global_position.y, destination.z), Vector3.UP)

    move_and_slide()

func set_destination_from_mouse(mouse_position: Vector2) -> void:
    if camera == null:
        print("No camera set. Drag MainCamera into the Player camera_path slot.")
        return

    # The camera turns the 2D mouse position into a 3D ray.
    var ray_origin := camera.project_ray_origin(mouse_position)
    var ray_direction := camera.project_ray_normal(mouse_position)
    var ray_end := ray_origin + ray_direction * 1000.0

    var query := PhysicsRayQueryParameters3D.create(ray_origin, ray_end)
    var result := get_world_3d().direct_space_state.intersect_ray(query)

    if result.has("position"):
        destination = result["position"]
        has_destination = true
        print("Walking to: ", destination)
