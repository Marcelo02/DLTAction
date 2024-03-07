class_name Dummy
extends EnemyChar
#Esse script setta a vida infinita do Dummy de treino
func _ready():
	set_maxHP(9999)
	set_HP(9999)

func _on_timer_timeout():
	set_HP(get_maxHP())
