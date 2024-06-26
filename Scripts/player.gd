class_name PlayerChar
extends BaseChar


func _physics_process(delta) -> void:
	get_input() #Pega inputs
	move_char()

func get_direction() -> Vector2: #Pega a direção do input
	var input_direction = Input.get_vector("game_left", "game_right", "game_up", "game_down")
	return input_direction

func get_input() -> void: #Pega outros inputs (Ataque, corrida, itens, etc...)
	if Input.is_action_just_pressed("attack1"):
		attack1()
	if Input.is_action_just_pressed("attack2"):
		attack2()
	if Input.is_action_just_pressed("skill1"):
		skill1()
	if Input.is_action_just_pressed("skill2"):
		skill2()
	if Input.is_action_just_pressed("skill3"):
		skill3()
	if Input.is_action_just_pressed("skill4"):
		skill4()

func get_mouse_direction():
	return global_position.direction_to(get_global_mouse_position())

func move_char() -> void:
	var direction = get_direction() #Pega direção dos inputs
	#Movimento
	if direction.length() > 0:
		velocity = direction * move_speed
	else:
		velocity = velocity.lerp(Vector2.ZERO, friction)
	move_and_slide()

func attack1():
	print("ATK1")
	pass
	
func attack2():
	print("ATK2")
	pass

func skill1():
	print("SKL1")
	pass
	
func skill2():
	print("SKL2")
	pass

func skill3():
	print("SKL3")
	pass

func skill4():
	print("SKL4")
	pass
	

