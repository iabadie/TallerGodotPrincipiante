extends CharacterBody2D

@export_range(-180, 180, 1, "degrees") var DIRECCION: float = 0;
@export var VELOCIDAD: float = 300.0;

func _physics_process(delta):
	var dir = Vector2.from_angle(deg_to_rad(DIRECCION));
	velocity = dir * VELOCIDAD;
	move_and_slide()

func _on_area_2d_area_entered(area):
	queue_free()

func fin_partida():
	DIRECCION = 0;
	VELOCIDAD = 0;

func ganar():
	DIRECCION = 0;
	VELOCIDAD = 0;
