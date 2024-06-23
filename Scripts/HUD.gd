extends CanvasLayer

@onready var txt = $RichTextLabel
@onready var player_char = $"../PlayerChar"

# Called when the node enters the scene tree for the first time.
func _ready():
	

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	txt.text = "Vida" + str(player_char.get_HP()) + "/" + str(player_char.get_maxHP())
	pass
