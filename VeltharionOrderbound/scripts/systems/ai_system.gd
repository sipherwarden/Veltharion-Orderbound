extends CharacterBody3D
class_name AISystem

@export var enemy_id: String = "basic"
@export var target_path: NodePath
@onready var nav: NavigationAgent3D = $NavigationAgent3D

var hp: float
var state: String = "patrol"

func _ready() -> void:
	var def := EnemyDefs.get_def(enemy_id)
	hp = def["hp"]
	nav.path_desired_distance = 0.3

func _physics_process(delta: float) -> void:
	var target := get_node_or_null(target_path) as Node3D
	if target == null:
		return
	nav.target_position = target.global_position
	if hp < 0.35 * EnemyDefs.get_def(enemy_id)["hp"]:
		state = "retreat"
	elif global_position.distance_to(target.global_position) < 2.0:
		state = "attack"
	else:
		state = "aggro"
	if state == "aggro":
		velocity = (nav.get_next_path_position() - global_position).normalized() * EnemyDefs.get_def(enemy_id)["speed"]
	elif state == "retreat":
		velocity = (global_position - target.global_position).normalized() * EnemyDefs.get_def(enemy_id)["speed"]
	else:
		velocity = Vector3.ZERO
	move_and_slide()

func take_damage(amount: float, _dtype: String) -> void:
	hp -= amount
	if hp <= 0.0:
		queue_free()
