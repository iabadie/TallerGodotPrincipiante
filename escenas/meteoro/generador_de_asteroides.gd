extends Node2D

@export var meteoro: PackedScene;
@export_range(0.1, 10, 0.1, "suffix:s") var cooldown: float = 1;
@export_range(-180, 180, 1, "degrees") var DIRECCION: float = 0;
@export var VELOCIDAD_MOVIMIENTO: float = 300.0;
@export var PATRON: String = "xx xx"

var indice_actual = 0;

func _ready():
	$Timer.wait_time = cooldown
	crear_asteroide()

func _on_timer_timeout():
	crear_asteroide()
	

func crear_asteroide():
	print(indice_actual)
	if PATRON[indice_actual] != " ":
		var met = meteoro.instantiate()
		met.DIRECCION = DIRECCION
		met.VELOCIDAD = VELOCIDAD_MOVIMIENTO
		add_child(met)
	indice_actual += 1
	if indice_actual == PATRON.length():
		indice_actual = 0;
	$Timer.start()
