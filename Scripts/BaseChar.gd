class_name BaseChar
extends CharacterBody2D
#Esse Script cria os stats e setta os valores iniciais de qualquer figura do jogo
#Valores iniciais
@export var init_HP: int = 100 #Vida inicial
@export var init_Mana: float = 100.0 #Mana inicial
@export var init_damage: float = 1.0 #Dano inicial
@export var init_armor: float = 0.0 #Armor inicial
@export var init_crit: float = 0.0 #Crítico inicial
@export var init_magic: float = 1.0 #Magia inicial
@export var init_CDR: float = 0.0 #Redução no cooldown de habilidades
@export var init_move_speed: float = 300.0 #Move Speed inicial
@export var init_aggro: float = 1.0 # Aggro inicial
var char_class: String = "none"

#Valores reais
var HP: int
var max_HP: float
var mana: float
var max_mana: float
var damage: float
var armor: float
var crit: float
var magic: float
var CDR: float
var move_speed: float #Move speed atual, alterável e não quero dar acesso ao player
var base_move_speed: float
var aggro: float

#Setters e getters
func set_HP(new_HP): 
	print("Vida alterada para ", new_HP)
	HP = new_HP
func get_HP():
	return HP

func set_maxHP(new_MaxHP): 
	print("Vida máxima alterada para ", new_MaxHP)
	max_HP = new_MaxHP
	if max_HP < HP:
		set_HP(max_HP)
func get_maxHP():
	return max_HP

func set_mana(new_mana):
	print ("Mana alterada para ", new_mana)
	mana = new_mana
func get_mana():
	return mana

func set_maxMana(new_maxMana):
	print("Mana máxima alterada para ", new_maxMana)
	max_mana = new_maxMana
	if max_mana < mana:
		set_mana(max_mana)
func get_maxMana():
	return max_mana

func set_damage(new_damage):
	print("Dano alterado para ", new_damage)
	damage = new_damage
func get_damage():
	return damage

func set_armor(new_armor):
	print("armadura alterada para ", new_armor)
	armor = new_armor
func get_armor():
	return armor

func set_crit(new_crit):
	print("Crit alterado para ", new_crit)
	crit = new_crit
	if crit > 100.0:
		set_crit(100.0)
func get_crit():
	return crit

func set_magic(new_magic):
	print("Magia alterada para ", new_magic)
	magic = new_magic
func get_magic():
	return magic

func set_CDR(new_CDR):
	print("CDR alterado para ", new_CDR)
	CDR = new_CDR
	if CDR > 50.0:
		set_CDR(50.0)
func get_CDR():
	return CDR

func set_MS(new_MS):
	print("Velocidade de movimento alterada para ", new_MS)
	move_speed = new_MS
func get_MS():
	return move_speed

func set_baseMS(new_baseMS):
	print("Velocidade base alterada para ", new_baseMS)
	base_move_speed = new_baseMS
func get_baseMS():
	return base_move_speed

func set_Aggro(new_Aggro):
	print("Aggro alterado para: ", new_Aggro)
	aggro = new_Aggro
func get_Aggro():
	return aggro
#Funções básicas
func _ready() -> void:
	set_MS(init_move_speed) #Setta a MS do player como a MS Inicial
	set_baseMS(init_move_speed) #Setta a MS Base do player

func take_damage(_dano):
	var dano = _dano
	set_HP(HP - dano)
	print("tomou dano igual a ", dano)
	print("Vida atual: ", get_HP())
	if get_HP() <= 0:
		print("Morreu :(")
		die()
	#sistema de knockback

func knockback(posicao_atacante: Vector2, _knockback: float):
	var direcao_knockback = posicao_atacante.direction_to(self.global_position)
	var knockback_force = _knockback
	global_position += knockback_force * direcao_knockback
	pass

func die():
	queue_free()
