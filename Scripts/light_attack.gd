extends Hitbox
@onready var animation_player = $AnimationPlayer
func _ready():
	pass
func _process(delta):
	damage = get_parent().get_damage() * 2
