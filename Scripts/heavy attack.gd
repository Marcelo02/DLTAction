extends Hitbox
@onready var animation_player = $AnimationPlayer

func _process(delta):
	damage = get_parent().get_damage() * 6
