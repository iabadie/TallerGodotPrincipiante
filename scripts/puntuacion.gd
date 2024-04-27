extends Node

var record = 0;
var puntuacion = 0;
var coins = 0;

func reiniciar_puntuacion():
	puntuacion = 0
	coins = 0

func evaluar_nuevo_record():
	if record < puntuacion:
		record = puntuacion
		return true
	return false

func sumar_coin():
	coins += 1;

func restar_coin():
	coins -= 1
	if coins == 0:
		get_tree().call_group("sistema", "ganar")
