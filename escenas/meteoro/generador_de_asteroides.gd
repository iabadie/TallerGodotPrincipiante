extends Node2D

@export var meteoro: PackedScene;
@export_range(0, 10, 0.1, "suffix:s") var cooldown: float;
@export_range(-180, 180, 1, "degrees") var DIRECCION: float = 0;
@export var VELOCIDAD: float = 300.0;

func _ready():
	$Timer.wait_time = cooldown
	$Timer.start()

func _on_timer_timeout():
	var met = meteoro.instantiate()
	met.DIRECCION = DIRECCION
	met.VELOCIDAD = VELOCIDAD
	add_child(met)
	$Timer.start()
