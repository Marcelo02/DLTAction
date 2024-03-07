class_name Hurtbox
extends Area2D
@onready var groups = owner.get_groups()
# Called when the node enters the scene tree for the first time.
func _init():
	collision_layer = 0
	collision_mask = 2
	
func _ready():
	area_entered.connect(_on_area_entered)
	print("Grupos:", groups)
	

func _on_area_entered(hitbox: Hitbox) -> void:
	var groups_Hitbox = hitbox.owner.get_groups()
	if hitbox ==null:
		pass
	if owner.has_method("take_damage") and groups != groups_Hitbox:
		owner.take_damage(hitbox.damage)
