extends CharacterBody3D

# How fast the player walks.
# Bigger number = faster movement.
@export var move_speed: float = 5.0

# How close the player needs to get before stopping.
@export var stop_distance: float = 0.15

# How strongly gravity pulls the player down.
@export var gravity: float = 24.0

# We will drag MainCamera into this slot in the Godot Inspector.
@export var camera_path: NodePath

var destination: Vector3
var has_destination: bool = false

# Tiny beginner inventory.
# Example: inventory["Log"] = 3
var inventory: Dictionary = {}

@onready var camera: Camera3D = get_node(camera_path) as Camera3D

func _ready() -> void:
    # Start with the destination equal to where the player already is.
    destination = global_position

func _unhandled_input(event: InputEvent) -> void:
    # This checks for a left mouse click.
    if event is InputEventMouseButton:
        if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
            handle_left_click(event.position)

func _physics_process(delta: float) -> void:
    apply_gravity(delta)
    move_toward_destination()
    move_and_slide()

func apply_gravity(delta: float) -> void:
    # If the player is not on the floor, gravity pulls them down.
    # This means deleting PlayerCollision will make the player fall.
    if not is_on_floor():
        velocity.y -= gravity * delta
    else:
        # Keep a tiny downward force so Godot knows we are touching the floor.
        velocity.y = -0.1

func move_toward_destination() -> void:
    if not has_destination:
        velocity.x = 0.0
        velocity.z = 0.0
        return

    # We only care about X and Z for walking on the ground.
    var flat_position: Vector3 = Vector3(global_position.x, 0.0, global_position.z)
    var flat_destination: Vector3 = Vector3(destination.x, 0.0, destination.z)
    var direction: Vector3 = flat_destination - flat_position

    # Stop when we are close enough to the clicked spot.
    if direction.length() <= stop_distance:
        has_destination = false
        velocity.x = 0.0
        velocity.z = 0.0
        return

    direction = direction.normalized()

    velocity.x = direction.x * move_speed
    velocity.z = direction.z * move_speed

    # Turn the player to face where they are walking.
    var look_target: Vector3 = Vector3(destination.x, global_position.y, destination.z)
    if global_position.distance_to(look_target) > 0.01:
        look_at(look_target, Vector3.UP)

func handle_left_click(mouse_position: Vector2) -> void:
    if camera == null:
        print("No camera set. Drag MainCamera into the Player camera_path slot.")
        return

    var result: Dictionary = raycast_from_mouse(mouse_position)

    if result.is_empty():
        return

    var clicked_object: Object = result.get("collider") as Object
    var clicked_position: Vector3 = result["position"] as Vector3

    # If the clicked object has an interact function, use it.
    if clicked_object != null and clicked_object.has_method("interact"):
        clicked_object.interact(self)
        return

    # Otherwise, walk to where we clicked.
    destination = Vector3(clicked_position.x, global_position.y, clicked_position.z)
    has_destination = true
    print("Walking to ground point: ", destination)

func raycast_from_mouse(mouse_position: Vector2) -> Dictionary:
    # The camera turns the 2D mouse position into a 3D ray.
    var ray_origin: Vector3 = camera.project_ray_origin(mouse_position)
    var ray_direction: Vector3 = camera.project_ray_normal(mouse_position)
    var ray_end: Vector3 = ray_origin + ray_direction * 1000.0

    var query: PhysicsRayQueryParameters3D = PhysicsRayQueryParameters3D.create(ray_origin, ray_end)

    # Important: do not let the mouse click hit the player body.
    # We only want clicks on the world/ground/objects.
    query.exclude = [get_rid()]

    return get_world_3d().direct_space_state.intersect_ray(query)

func add_item(item_name: String, amount: int) -> void:
    if not inventory.has(item_name):
        inventory[item_name] = 0

    inventory[item_name] += amount

    print("Picked up ", amount, " ", item_name, ". Total: ", inventory[item_name])
