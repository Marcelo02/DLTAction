class_name Fighter
extends PlayerChar

#States para State Machine	
enum states {IDLE, WALKING, ATTACKING, RUNNING}
var state_atual
var running_bonus: float = 1.25
@onready var light_attack = $light_attack
@onready var heavy_attack = $heavy_attack

func _ready():
	state_atual = states.IDLE
	
	set_MS(400.0)#Setta a MS do player como a MS Inicial
	set_baseMS(400.0) #Setta a MS Base do player
	
	set_damage(5)
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	get_input()
	move_char()
	pass

func _process(delta):
	var running_speed: float = running_bonus * get_baseMS()
	match state_atual:
		states.IDLE:
			pass
		states.RUNNING: 
			#o guerreiro retira os slows e corre feito maluco, não pode atacar
			if move_speed < running_speed:
				set_MS(running_speed)
	if velocity.length() > 0 and state_atual == states.IDLE:
		state_atual = states.WALKING

func attack1():
	if state_atual != states.RUNNING and state_atual != states.ATTACKING:
		state_atual = states.ATTACKING
		print("O ataque vai para ",get_mouse_direction())
		light_attack.look_at(get_global_mouse_position())
		light_attack.animation_player.play("Attack")
		await light_attack.animation_player.animation_finished
		state_atual = states.IDLE
		print("ataque concluido :)")

func attack2():
	if state_atual != states.RUNNING and state_atual != states.ATTACKING:
		state_atual = states.ATTACKING
		print("O ataque forte vai para ",get_mouse_direction())
		heavy_attack.look_at((get_global_mouse_position()))
		heavy_attack.animation_player.play("Ataque")
		await heavy_attack.animation_player.animation_finished
		state_atual = states.IDLE
		print("ataque concluido :)")

func skill1():
	if state_atual == states.RUNNING:
		print("Corrida cancelada")
		set_MS(get_baseMS())
		state_atual = states.IDLE
	else:
		print("Corrida maluca")
		state_atual = states.RUNNING
	pass

func skill2():
	print("gancho para ", get_mouse_direction())
	

