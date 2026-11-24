class_name Unit
extends CharacterBody2D

signal died

@export var faction: FactionData
@export var max_health: int = 100
@export var movement_speed: float = 300.0

var health: int

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	health = max_health
	apply_faction()

func set_faction(new_faction: FactionData) -> void:
	faction = new_faction
	
	if is_node_ready():
		apply_faction()

func apply_faction() -> void:
	pass

func take_damage(amount: int) -> void:
	health = maxi(health - amount, 0)
	
	if health == 0:
		die()

func heal(amount: int) -> void:
	health = mini(health + amount, max_health)

func die() -> void:
	died.emit()
	queue_free()

func move_in_direction(direction: Vector2) -> void:
	velocity = direction.normalized() * movement_speed
	move_and_slide()
