class_name Zombie
extends EnemyChar


# Called when the node enters the scene tree for the first time.
func _ready():
	set_maxHP(20)
	set_HP(get_maxHP())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_and_slide()
	pass
