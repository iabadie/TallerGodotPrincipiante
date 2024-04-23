extends Sprite2D

@export var puntos: int = 10;

func _on_area_2d_area_entered(area):
	Puntuacion.puntuacion += puntos
	queue_free()
