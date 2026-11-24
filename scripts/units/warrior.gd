class_name Warrior
extends Unit

@export var attack_damage: int = 20
@export var attack_range: float = 40.0

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
	
	if faction.warrior_frames == null:
		return
	
	sprite.sprite_frames = faction.warrior_frames
	sprite.play("idle")
