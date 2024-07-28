extends Control
@onready var fighter_char = $"../../FighterChar"
@onready var vida = $Vida
@onready var vida_barra = $VidaBarra
@onready var mana = $Mana
@onready var mana_barra = $ManaBarra
var barraHP
var barraMana

func _ready():
	update()
	pass # Replace with function body.

func update():
	fighter_char.TakeDamage.connect(update)
	vida.text = str(fighter_char.get_HP()) + "/" + str(fighter_char.get_maxHP())
	barraHP = fighter_char.get_HP() * 100/ fighter_char.get_maxHP()
	vida_barra.value = barraHP
	mana.text = str(fighter_char.get_mana()) +"/"+ str(fighter_char.get_maxMana())
	barraMana = fighter_char.get_mana() * 100 / fighter_char.get_maxMana()
	mana_barra.value = barraMana
