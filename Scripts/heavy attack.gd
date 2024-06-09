extends Hitbox
@onready var animation_player = $AnimationPlayer
func _ready():
	knockback = 45
	pass
func _process(delta):
	damage = get_parent().get_damage() * 6
