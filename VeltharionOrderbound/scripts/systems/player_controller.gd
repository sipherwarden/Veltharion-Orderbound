extends CharacterBody3D
class_name PlayerController

@export var speed: float = 7.5
@export var dodge_speed: float = 13.0
@export var stamina_regen: float = 24.0
@export var camera_path: NodePath

@onready var combat: CombatSystem = $CombatSystem
@onready var abilities: AbilitySystem = $AbilitySystem
@onready var cam: Camera3D = get_node(camera_path)

var dodge_time: float = 0.0

func _physics_process(delta: float) -> void:
	var profile := SaveSystem.profile
	profile["stamina"] = min(profile["max_stamina"], profile["stamina"] + stamina_regen * delta)
	abilities.tick(delta)
	var input := Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_back") - Input.get_action_strength("move_forward")
	)
	var forward := -cam.global_transform.basis.z
	var right := cam.global_transform.basis.x
	var dir := (right * input.x + forward * input.y)
	dir.y = 0
	dir = dir.normalized()
	if Input.is_action_just_pressed("dodge") and profile["stamina"] >= 20.0:
		dodge_time = 0.18
		profile["stamina"] -= 20.0
	if dodge_time > 0.0:
		dodge_time -= delta
		velocity = dir * dodge_speed
	else:
		velocity = dir * speed
	if Input.is_action_just_pressed("attack_light"):
		combat.do_melee_arc(self, 12.0, 1.8)
	if Input.is_action_just_pressed("attack_heavy") and profile["stamina"] >= combat.stamina_heavy_cost:
		profile["stamina"] -= combat.stamina_heavy_cost
		combat.do_melee_arc(self, 24.0, 2.0)
	move_and_slide()
