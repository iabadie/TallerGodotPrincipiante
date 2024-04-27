extends Sprite2D

@export var puntos: int = 10;

func _enter_tree():
	Puntuacion.sumar_coin()
	pass

func _on_area_2d_area_entered(area):
	Puntuacion.puntuacion += puntos
	Puntuacion.restar_coin()
	queue_free()
	
func fin_partida():
	queue_free()
