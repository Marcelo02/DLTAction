extends Control
@onready var fighter_char = $"../../FighterChar"
@onready var vida = $Vida
var Vida

# Called when the node enters the scene tree for the first time.
func _ready():
	vida.text = str(fighter_char.get_HP())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
