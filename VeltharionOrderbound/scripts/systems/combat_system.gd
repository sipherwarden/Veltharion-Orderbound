extends Node
class_name CombatSystem

@export var stamina_light_cost: float = 0.0
@export var stamina_heavy_cost: float = 25.0
@export var parry_window: float = 0.25

func do_melee_arc(attacker: CharacterBody3D, damage: float, radius: float, damage_type: String = "physical") -> void:
	var space := attacker.get_world_3d().direct_space_state
	var shape := SphereShape3D.new()
	shape.radius = radius
	var query := PhysicsShapeQueryParameters3D.new()
	query.shape = shape
	query.transform = Transform3D(Basis(), attacker.global_position + attacker.transform.basis.z * -1.2)
	query.collision_mask = 2
	var hits := space.intersect_shape(query)
	for h in hits:
		var collider: Object = h["collider"]
		if collider != attacker and collider.has_method("take_damage"):
			collider.take_damage(damage, damage_type)
			EventBus.combat_hit.emit(attacker, collider, damage, damage_type)
