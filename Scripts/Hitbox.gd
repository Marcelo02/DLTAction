class_name Hitbox
extends Area2D

var damage: int

# Called when the node enters the scene tree for the first time.
func _init():
	collision_layer = 2
	collision_mask = 0

