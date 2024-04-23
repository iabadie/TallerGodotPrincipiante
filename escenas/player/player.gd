extends CharacterBody2D

@onready var PlayerAnimation: AnimationPlayer = $AnimationPlayer

@export var VELOCIDAD: float = 300.0
@export var DESACELERACION: float = 300.0
@export var vida: int = 3

var es_invencible = false;
var puede_moverse = true;

func _ready():
	get_tree().call_group("personaje", "actualizar_vida", vida)
	
func _physics_process(delta):
	if not puede_moverse:
		velocity = Vector2.ZERO
		move_and_slide()
		return

	var directionX = Input.get_axis("ui_left", "ui_right")
	if directionX:
		velocity.x = directionX * VELOCIDAD
	else:
		velocity.x = move_toward(velocity.x, 0, DESACELERACION)
	
	var directionY = Input.get_axis("ui_up", "ui_down")
	if directionY:
		velocity.y = directionY * VELOCIDAD
	else:
		velocity.y = move_toward(velocity.y, 0, DESACELERACION)
	move_and_slide()

func set_invencible(nuevo_valor: bool):
	es_invencible = nuevo_valor
	$PhysicCollision2D.set_deferred("disabled", nuevo_valor)
	if es_invencible:
		PlayerAnimation.play("invencibilidad")

func _on_timer_invencibilidad_timeout():
	PlayerAnimation.stop()
	set_invencible(false)

func _on_area_2d_area_entered(area):
	vida -= 1
	get_tree().call_group("personaje", "actualizar_vida", vida)
	if vida <= 0:
		get_tree().call_group("sistema", "fin_partida")
	else:
		$TimerInvencibilidad.start()
		set_invencible(true)

func fin_partida():
	puede_moverse = false
