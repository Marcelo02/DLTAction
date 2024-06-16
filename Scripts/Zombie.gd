class_name Zombie
extends EnemyChar

var alvo

# Called when the node enters the scene tree for the first time.
func _ready():
	set_maxHP(20)
	set_HP(get_maxHP())
	set_baseMS(100)
	set_MS(get_baseMS())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	DefinirAggro()
	Mover()
	pass

func DefinirAggro():
	var maiorAggro = 0
	for Player in Players_Group:
		if Player.get_Aggro() > maiorAggro:
			alvo = Player
	#print(alvo.name)
	pass

func Mover():
	var posicaoAlvo = alvo.position
	var normalizado = (posicaoAlvo - position).normalized()
	velocity = get_MS() * normalizado
	move_and_slide()
