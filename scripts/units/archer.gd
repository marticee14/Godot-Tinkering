class_name Archer
extends Unit

@export var attack_damage: int = 10
@export var attack_range: float = 250.0

func attack(target: Unit) -> void:
	if not is_instance_valid(target):
		return
	
	var distance = global_position.distance_to(
		target.global_position
	)
	
	if distance <= attack_range:
		sprite.play("attack")
		target.take_damage(attack_damage)

func apply_faction() -> void:
	if faction == null:
		return
	
	if faction.archer_frames == null:
		return
	
	sprite.sprite_frames = faction.archer_frames
	sprite.play("idle")
