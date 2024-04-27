extends Control

func _ready():
	visible = false

func mostrar_modal_perder():
	var nuevo_record = Puntuacion.evaluar_nuevo_record()
	visible = true
	$PanelContainer/MarginContainer/VBoxContainer/Record.text = ("Nuevo record: " if nuevo_record else "Último record: ") + str(Puntuacion.record)
	$PanelContainer/MarginContainer/VBoxContainer/Puntuacion.text = "Tu puntuación: " + str(Puntuacion.puntuacion)

func mostrar_modal_ganar():
	var nuevo_record = Puntuacion.evaluar_nuevo_record()
	visible = true
	$PanelContainer/MarginContainer/VBoxContainer/Title.text = "GANASTE"
	$PanelContainer/MarginContainer/VBoxContainer/Record.text = "Tu record: " + str(Puntuacion.record)
	$PanelContainer/MarginContainer/VBoxContainer/Puntuacion.visible = false

func _on_reintentar_pressed():
	Puntuacion.reiniciar_puntuacion()
	get_tree().reload_current_scene()

func fin_partida():
	mostrar_modal_perder()

func ganar():
	mostrar_modal_ganar()
