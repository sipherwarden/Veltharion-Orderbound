extends Node3D
class_name NavigationSystem

@export var camera_path: NodePath
@onready var camera: Camera3D = get_node(camera_path)

var yaw: float = -35.0

func _ready() -> void:
	camera.rotation_degrees.x = -55.0
	camera.rotation_degrees.y = yaw

func _process(delta: float) -> void:
	if Input.is_action_pressed("cam_left"):
		yaw -= 75.0 * delta
	if Input.is_action_pressed("cam_right"):
		yaw += 75.0 * delta
	if Input.is_action_just_pressed("cam_reset"):
		yaw = -35.0
	camera.rotation_degrees.y = lerp(camera.rotation_degrees.y, yaw, 8.0 * delta)
